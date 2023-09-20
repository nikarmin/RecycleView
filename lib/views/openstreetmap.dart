// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  List<GeoPoint> listGeoPoint = [];

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
                  _mapController.move(
                      LatLng(doc["lat"], doc["long"]), 15.0); //15.0
                  _focusNode.unfocus();
                  _options.clear();
                  setState(() {});
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

    //adicionarPonto();
    // pegarPontos();

    return data;
  }

  adicionarPonto() async {
    final geo = GeoFlutterFire();
    GeoFirePoint myLocation =
        geo.point(latitude: 12.960632, longitude: 77.641603);
    FirebaseFirestore.instance
        .collection('locations')
        .add({'name': 'random name', 'position': myLocation.data});
  }

  List<DocumentSnapshot> findPointsWithinRadius(
    List<DocumentSnapshot> points,
    double userLat,
    double userLon,
  ) {
    List<DocumentSnapshot> nearbyPoints = [];
    for (var point in points) {
      double pointLat = point['lat'];
      double pointLon = point['long'];
      double distance = calculateHaversineDistance(
        userLat,
        userLon,
        pointLat,
        pointLon,
      );
      if (distance <= 1.0) {
        nearbyPoints.add(point);
      }
    }
    return nearbyPoints;
  }

  double calculateHaversineDistance(
    double userLat,
    double userLon,
    double pointLat,
    double pointLon,
  ) {
    const double radiusOfEarthKm = 6371.0; // Raio da Terra em quilômetros
    double dLat = pointLat - userLat;
    double dLon = pointLon - userLon;

    double a = pow(sin(dLat / 2), 2) +
        cos(userLat) * cos(pointLat) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = radiusOfEarthKm * c; // Distância em quilômetros
    return distance;
  }

  Future<List<DocumentSnapshot>> findNearbyPoints() async {
    final double radiusInKm = 1.0; // Raio em quilômetros

    double lat = widget.center.latitude;
    double lon = widget.center.longitude;

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('pontos_de_coleta')
        .where(
          'lat',
          isGreaterThanOrEqualTo:
              lat - 0.009, // Aproximadamente 1km em latitude
          isLessThanOrEqualTo: lat + 0.009,
        )
        // .where(
        //   'long',
        //   isGreaterThanOrEqualTo:
        //       lon - 0.009, // Aproximadamente 1km em longitude
        //   isLessThanOrEqualTo: lon + 0.009,
        // )
        .get();

    return snapshot.docs;
  }

  buscarPontosProximos() async {
    GeoFlutterFire geo = GeoFlutterFire();
    Stream<List<DocumentSnapshot>> stream;
    final radius = BehaviorSubject<double>.seeded(1.0);
    GeoFirePoint center = geo.point(
        latitude: widget.center.latitude, longitude: widget.center.longitude);
    stream = radius.switchMap((rad) {
      var collectionReference = FirebaseFirestore.instance.collection('teste');
      return geo.collection(collectionRef: collectionReference).within(
          center: center, radius: rad, field: 'ponto', strictMode: true);
    });

    stream.listen((List<DocumentSnapshot> documentList) {
      print(documentList);
    });
    // final geo = GeoFlutterFire();
    // GeoFirePoint center = geo.point(
    //     latitude: widget.center.latitude, longitude: widget.center.longitude);
    // var collectionReference = FirebaseFirestore.instance.collection('teste');
    // var geoRef = geo.collection(collectionRef: collectionReference);
    // var snap =
    //     await geoRef.within(center: center, radius: 0, field: 'ponto').first;

    // if (snap.isNotEmpty) {
    //   print("DATAAAAAA: ${snap.first.toString()}");
    // } else {
    //   print("Nenhum dado encontrado.");
    // }
  }

  oooo() async {
    final points = await findNearbyPoints();
    final nearbyPoints = findPointsWithinRadius(
      points,
      widget.center.latitude,
      widget.center.longitude,
    );
  }

  @override
  void initState() {
    //adicionarPonto();
    //oooo();

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
