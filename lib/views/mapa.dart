import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:recycle_view/views/perfil_page.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
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
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  child: TextField(
                    controller: _search,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          )),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search, color: Colors.grey),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey),
                        onPressed: () => _search.clear(),
                      ),
                      hintText: 'Pesquise algum ponto...',
                      hintStyle: GoogleFonts.jost(
                          textStyle:
                              TextStyle(fontSize: 17, color: Colors.black)),
                    ),
                  ),
                ),
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
                )
              ],
            ),
          ),
        ));
  }
}
