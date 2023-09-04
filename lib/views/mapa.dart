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
  Future<Position> getLocalizacao() async {
    bool localizacaoOn = await Geolocator.isLocationServiceEnabled();

    if (!localizacaoOn) {
      return Future.error('Serviços de localização desativados.');
    }
    LocationPermission permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Permissão para localização negada para sempre.');
    }

    return await Geolocator.getCurrentPosition();
  }

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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: FutureBuilder(
                future: getLocalizacao(),
                builder: (BuildContext context, AsyncSnapshot<Position> snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                    ));
                  } else if (snap.hasError) {
                    return Text(snap.hasError.toString());
                  } else {
                    return Expanded(
                        child: OpenStreetMapSearchAndPick(
                            center: LatLong(
                                snap.data!.latitude, snap.data!.longitude),
                            buttonColor: Colors.blue,
                            buttonText: 'Set Current Location',
                            onPicked: (pickedData) {
                              print(pickedData.latLong.latitude);
                              print(pickedData.latLong.longitude);
                              print(pickedData.address);
                            }));
                  }
                })
            // Expanded(
            //   child: OpenStreetMapSearchAndPick(
            //       center: LatLong(23, 89),
            //       buttonColor: Colors.blue,
            //       buttonText: 'Set Current Location',
            //       onPicked: (pickedData) {
            //         print(pickedData.latLong.latitude);
            //         print(pickedData.latLong.longitude);
            //         print(pickedData.address);
            //       }),
            // ),

            ,
          ),
        ));
  }
}
