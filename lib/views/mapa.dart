import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlng/latlng.dart';
import 'package:location/location.dart';
import 'package:recycle_view/views/openstreetmap.dart';
import 'package:recycle_view/views/perfil_page.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  // LocationData? _currentPosition;
  // String? _address, _dateTime;
  // Location location = Location();
  // LatLng _initialcameraposition = LatLng(0.5937, 0.9629);
  // OpenStreetMapSearchAndPick? open;

  // getLoc() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _currentPosition = await location.getLocation();
  //   _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
  //       _currentPosition!.longitude!.toDouble());
  //   location.onLocationChanged.listen((LocationData currentLocation) {
  //     print("${currentLocation.longitude} : ${currentLocation.latitude}");
  //     setState(() {
  //       _currentPosition = currentLocation;
  //       _initialcameraposition = LatLng(_currentPosition!.latitude!.toDouble(),
  //           _currentPosition!.longitude!.toDouble());
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getLoc();
  // }

  TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/icons/account.png'),
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Perfil();
                }));
              },
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(233, 233, 233, 1),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  children: [
                    // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                    // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                  ],
                )),
                Expanded(
                  child: OpenStreetMapSearchAndPick(
                      center: LatLong(23, 89),
                      buttonColor: Colors.blue,
                      buttonText: 'Set Current Location',
                      onPicked: (pickedData) {
                        print(pickedData.latLong.latitude);
                        print(pickedData.latLong.longitude);
                        print(pickedData.address);
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
