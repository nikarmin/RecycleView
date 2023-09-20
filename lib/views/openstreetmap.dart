// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geo_firestore_flutter/geo_firestore_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:recycle_view/views/layout/layout_ponto.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

import '../services/auth_service.dart';

class OpenStreetMapSearchAndPick extends StatefulWidget {
  final LatLong center;
  final void Function(PickedData pickedData) onPicked;
  final Future<LatLng> Function() onGetCurrentLocationPressed;
  final IconData zoomInIcon;
  final IconData zoomOutIcon;
  final IconData currentLocationIcon;
  final IconData locationPinIcon;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color locationPinIconColor;
  final String locationPinText;
  final TextStyle locationPinTextStyle;
  final String buttonText;
  final String hintText;
  final double buttonHeight;
  final double buttonWidth;
  final TextStyle buttonTextStyle;
  final String baseUri;
  final User? user = FirebaseAuth.instance.currentUser;

  static Future<LatLng> nopFunction() {
    throw Exception("");
  }

  OpenStreetMapSearchAndPick(
      {Key? key,
      this.center = const LatLong(0, 0),
      required this.onPicked,
      this.zoomOutIcon = Icons.zoom_out_map,
      this.zoomInIcon = Icons.zoom_in_map,
      this.currentLocationIcon = Icons.my_location,
      this.onGetCurrentLocationPressed = nopFunction,
      this.buttonColor = Colors.blue,
      this.locationPinIconColor = Colors.red,
      this.locationPinText = 'Location',
      this.locationPinTextStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
      this.hintText = 'Procurar endereço',
      this.buttonTextStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      this.buttonTextColor = Colors.white,
      this.buttonText = 'Set Current Location',
      this.buttonHeight = 50,
      this.buttonWidth = 200,
      this.baseUri = 'https://nominatim.openstreetmap.org',
      this.locationPinIcon = Icons.home})
      : super(key: key);

  @override
  State<OpenStreetMapSearchAndPick> createState() =>
      _OpenStreetMapSearchAndPickState();
}

class _OpenStreetMapSearchAndPickState
    extends State<OpenStreetMapSearchAndPick> {
  MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<OSMdata> _options = <OSMdata>[];
  Timer? _debounce;
  var client = http.Client();

  // calcularPontosProximos(LatLng user, LatLng ponto) async {
  //   const double raioTerra = 6372.795477598;

  //   double lat1 = user.latitude * pi / 180;
  //   double lon1 = user.longitude * pi / 180;
  //   double lat2 = ponto.latitude * pi / 180;
  //   double lon2 = ponto.longitude * pi / 180;

  //   double dLat = lat2 - lat1;
  //   double dLon = lon2 - lon1;

  //   double a = sin(dLat / 2) * sin(dLat / 2) +
  //       cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);

  //   double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  //   double distance = raioTerra * c; // Distância em quilômetros
  //   return distance;
  // }

  // List<LatLng> findNearestPoints(
  //     LatLng user, List<LatLng> recyclePoints, int numberOfPoints) {
  //   recyclePoints.sort((a, b) {
  //     double distanceA = calcularPontosProximos(user, a);
  //     double distanceB = calcularPontosProximos(user, b);
  //     return distanceA.compareTo(distanceB);
  //   });

  //   return recyclePoints.take(numberOfPoints).toList();
  // }

  void setNameCurrentPos() async {
    double latitude = _mapController.center.latitude;
    double longitude = _mapController.center.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }
    String url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    // var response = await client.post(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController.text =
        decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION";
    setState(() {});
  }

  void setNameCurrentPosNew() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
        _currentPosition!.longitude!.toDouble());
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.latitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
            _currentPosition!.longitude!.toDouble());
      });
    });

    double? latitude = _currentPosition?.latitude?.toDouble();
    double? longitude = _currentPosition?.longitude?.toDouble();
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }
    String url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    // var response = await client.post(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController.text =
        decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION";
    setState(() {});
  }

  void setNameCurrentPosAtInit() async {
    double latitude = widget.center.latitude;
    double longitude = widget.center.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }

    String url =
        '${widget.baseUri}/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    // var response = await client.post(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController.text =
        decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION";
    setState(() {});
  }

  LocationData? _currentPosition;
  String? _address, _dateTime;
  Location location = Location();
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);
  OpenStreetMapSearchAndPick? open;

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
        _currentPosition!.longitude!.toDouble());
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.latitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
            _currentPosition!.longitude!.toDouble());
      });
    });
  }

  pegar() async {
    await context.read<AuthService>().getPontoDeColeta();
  }

  final List<Marker> _markers = [];
  List<LatLng> pointers = [];
  List<Marker> markerspoints = [];
  List<LatLng> pontinhosarr = [];

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    //pointers.add(LatLng(e["lat"], e["long"])));
    snapshot.data?.docs.map((e) => print("data: " + e.data().toString()));
    print(" snapshot: " + snapshot.toString());

    // print(_markers.toList().length);

    final data = snapshot.data?.docs
        .map((doc) => ListTile(
              title: GestureDetector(
                child: LayoutPontos(
                  nome: doc["nome"],
                  lat: doc["lat"],
                  long: doc["long"],
                  cidade: doc["cidade"],
                  //pontos: pointers,
                  tipo: doc["tipo"],
                  horario: doc["funcionamento"],
                ),
                onTap: () {
                  // adicionar função
                },
              ),
            ))
        .toList();
    // List<LatLng> pontinhosarr = [];
    final pontinhos = snapshot.data?.docs
        .map((doc) => pontinhosarr.add(LatLng(doc["lat"], doc["long"])))
        .toList();

    pontinhosarr.forEach((element) {
      markerspoints.add(Marker(
        point: element,
        width: 60,
        height: 60,
        builder: (context) => const Icon(
          Icons.place_rounded,
          size: 45,
          color: Color.fromRGBO(51, 111, 93, 1),
        ),
      ));
    });

    buscarPontosProximos();
    // pegarPontos();

    return data;
  }

  void buscarPontosProximos() async {
    try {
      // Inicialize o Firebase
      await Firebase.initializeApp();

      // Obtenha a localização atual do dispositivo
      Position position = await Geolocator.getCurrentPosition();
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Configure o GeoFlutterFire
      final geo = GeoFlutterFire();
      final _firestore = FirebaseFirestore.instance;
      GeoFirePoint center = geo.point(latitude: latitude, longitude: longitude);
      var collectionReference = _firestore.collection('pontos_de_coleta');

      // Defina o raio para 2 km
      double radius = 2.0;
      String field = 'position';

      // Consulta pontos dentro do raio de 2 km da localização atual
      Stream<List<DocumentSnapshot>> stream = geo
          .collection(collectionRef: collectionReference)
          .within(center: center, radius: radius, field: field);

      stream.listen((List<DocumentSnapshot> documentList) {
        // Faça algo com os documentos encontrados (pontos próximos)
        for (var document in documentList) {
          print('Nome: ${document['nome']}');
          print('Latitude: ${document['position'].latitude}');
          print('Longitude: ${document['position'].longitude}');
        }
      });
    } catch (e) {
      print('Erro ao buscar pontos próximos: $e');
    }
  }

  // pegarPontosProximos() async {
  //   final geo =
  //       GeoFirestore(FirebaseFirestore.instance.collection('pontos_de_coleta'));

  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('pontos_de_coleta').get();

  //   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data =
  //         documentSnapshot.data() as Map<String, dynamic>;

  //     // Verifique se o documento possui campos de latitude e longitude
  //     if (data.containsKey('latitude') && data.containsKey('longitude')) {
  //       double latitude = data['latitude'];
  //       double longitude = data['longitude'];

  //       GeoPoint geoPoint =
  //           geo.point(latitude: latitude, longitude: longitude);

  //       // Adicione o ponto ao GeoFirestore
  //       await geo.setLocation(documentSnapshot.id, geoPoint);
  //       print('Documento ${documentSnapshot.id} adicionado ao GeoFirestore');
  //     } else {
  //       print(
  //           'Documento ${documentSnapshot.id} não possui campos de latitude e longitude.');
  //     }
  //   }
  // }

  // Future<void> findNearbyPoints(
  //     double latitude, double longitude, double radiusInKm) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   final geo = GeoFirestore(firestore.collection('pontos_de_coleta'));

  //   GeoFirestore center = geo.getLocation(documentID);
  //   point(latitude: latitude, longitude: longitude);

  //   String collectionName =
  //       'pontos_de_coleta'; // Nome da coleção que contém os pontos
  //   CollectionReference collection = _firestore.collection(collectionName);

  //   Stream<List<DocumentSnapshot<Map<String, dynamic>>>> stream = geo
  //       .collection(collection: collection)
  //       .within(center: center, radius: radiusInKm, field: 'location');

  //   stream.listen((List<DocumentSnapshot<Map<String, dynamic>>> result) {
  //     // Result contém os documentos dos pontos de coleta dentro do raio especificado
  //     for (var doc in result) {
  //       var data = doc.data() as Map<String, dynamic>;
  //       var pointName = data[
  //           'name']; // Substitua 'name' pelo campo correto que contém o nome do ponto
  //       var pointLocation = data[
  //           'location']; // Substitua 'location' pelos campos corretos de latitude e longitude
  //       var pointLatitude = pointLocation.latitude;
  //       var pointLongitude = pointLocation.longitude;

  //       // Agora você pode processar os pontos de coleta encontrados
  //       print(
  //           'Nome: $pointName, Latitude: $pointLatitude, Longitude: $pointLongitude');
  //     }
  //   });
  // }

  // pegarPontos() async {
  //   LatLng userLocation =
  //       LatLng(widget.center.latitude, widget.center.longitude);
  //   List<LatLng> nearestPoints =
  //       findNearestPoints(userLocation, pontinhosarr, pontinhosarr.length);

  //   print('Pontos de coleta mais próximos:');
  //   for (var point in nearestPoints) {
  //     double distance = calcularPontosProximos(userLocation, point);
  //     print(' Distância = ${distance.toStringAsFixed(2)} km');
  //   }
  // }

  @override
  void initState() {
    setNameCurrentPos();
    pegar();

    markerspoints.add(Marker(
      point: LatLng(widget.center.latitude, widget.center.longitude),
      width: 60,
      height: 60,
      builder: (context) {
        return const CircleAvatar(
          backgroundColor: Color.fromRGBO(51, 111, 93, 0.397),
          child: Icon(
            Icons.emoji_people_outlined,
            color: Colors.black,
            size: 25,
          ),
        );
      },
    ));

    // _markers.addAll(pointers
    //     .map((point) => Marker(
    //           point: point,
    //           width: 60,
    //           height: 60,
    //           builder: (context) => const Icon(
    //             Icons.pin_drop,
    //             size: 25,
    //             color: Color.fromRGBO(51, 111, 93, 0.397),
    //           ),
    //         ))
    //     .toList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String? _autocompleteSelection;
    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: widget.buttonColor),
    );
    OutlineInputBorder inputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: widget.buttonColor, width: 3.0),
    );
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
              child: FlutterMap(
            options: MapOptions(
                screenSize: MediaQuery.of(context).size / 2,
                center: LatLng(widget.center.latitude, widget.center.longitude),
                zoom: 15.0,
                maxZoom: 18,
                minZoom: 6),
            mapController: _mapController,
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: markerspoints)
            ],
          )),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Color.fromRGBO(51, 111, 93, 1)),
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          leading: const ImageIcon(
                            AssetImage('assets/images/icons/recycle-bin.png'),
                            size: 30,
                            color: Colors.white,
                          ),
                          title: Text(
                              "${markerspoints.length - 1} PONTOS NA REGIÃO",
                              style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("pontos_de_coleta")
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }
                            return ListView(
                                children: getExpenseItems(snapshot));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  TextFormField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      style: GoogleFonts.poppins(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(243, 243, 243, 1),
                        hintText: widget.hintText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(
                              style: BorderStyle.none,
                              width: 0,
                            )),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.grey),
                          onPressed: () => _searchController.clear(),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.grey),
                          onPressed: () {
                            // Perform the search here
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();

                        _debounce =
                            Timer(const Duration(milliseconds: 2000), () async {
                          if (kDebugMode) {
                            print(value);
                          }
                          var client = http.Client();
                          try {
                            String url =
                                '${widget.baseUri}/search?q=$value&format=json&polygon_geojson=1&addressdetails=1';
                            if (kDebugMode) {
                              print(url);
                            }
                            var response = await client.get(Uri.parse(url));
                            // var response = await client.post(Uri.parse(url));
                            var decodedResponse =
                                jsonDecode(utf8.decode(response.bodyBytes))
                                    as List<dynamic>;
                            if (kDebugMode) {
                              print(decodedResponse);
                            }
                            _options = decodedResponse
                                .map((e) => OSMdata(
                                    displayname: e['display_name'],
                                    lat: double.parse(e['lat']),
                                    lon: double.parse(e['lon'])))
                                .toList();
                            setState(() {});
                          } finally {
                            client.close();
                          }

                          setState(() {});
                        });
                      }),
                  StatefulBuilder(builder: ((context, setState) {
                    return Container(
                      child: Column(children: [
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  _options.length > 5 ? 5 : _options.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    _options[index].displayname,
                                    style: GoogleFonts.poppins(),
                                  ),
                                  subtitle: Text(
                                      '${_options[index].lat},${_options[index].lon}',
                                      style: GoogleFonts.jost()),
                                  onTap: () {
                                    _mapController.move(
                                        LatLng(_options[index].lat,
                                            _options[index].lon),
                                        15.0);

                                    _focusNode.unfocus();
                                    _options.clear();
                                    setState(() {});
                                  },
                                );
                              }),
                        ),
                      ]),
                    );
                  })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<PickedData> pickData() async {
    LatLong center = LatLong(
        _mapController.center.latitude, _mapController.center.longitude);
    var client = http.Client();
    String url =
        '${widget.baseUri}/reverse?format=json&lat=${_mapController.center.latitude}&lon=${_mapController.center.longitude}&zoom=18&addressdetails=1';

    var response = await client.get(Uri.parse(url));
    // var response = await client.post(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    String displayName = decodedResponse['display_name'];
    return PickedData(center, displayName, decodedResponse["address"]);
  }
}

class OSMdata {
  final String displayname;
  final double lat;
  final double lon;
  OSMdata({required this.displayname, required this.lat, required this.lon});
  @override
  String toString() {
    return '$displayname, $lat, $lon';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OSMdata && other.displayname == displayname;
  }

  @override
  int get hashCode => Object.hash(displayname, lat, lon);
}

class LatLong {
  final double latitude;
  final double longitude;
  const LatLong(this.latitude, this.longitude);
}

class PickedData {
  final LatLong latLong;
  final String addressName;
  final Map<String, dynamic> address;

  PickedData(this.latLong, this.addressName, this.address);
}
