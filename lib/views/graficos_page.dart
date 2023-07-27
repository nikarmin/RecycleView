import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphic/graphic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraficosPage extends StatelessWidget {
  List<_PieData> data = [
    _PieData('35', 45, 'Jan'),
    _PieData('28', 23, 'Feb'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SfCircularChart(
                    title: ChartTitle(text: 'Sales by sales person'),
                    legend: Legend(isVisible: true),
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                          explode: true,
                          explodeIndex: 0,
                          dataSource: data,
                          xValueMapper: (_PieData data, _) => data.xData,
                          yValueMapper: (_PieData data, _) => data.yData,
                          dataLabelMapper: (_PieData data, _) => data.text,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: true)),
                    ])
              ]))),
      appBar: AppBar(
        title: ImageIcon(AssetImage('assets/images/icons/earth-love.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/icons/profile.png'),
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color.fromARGB(255, 89, 165, 128),
            onTap: (value) {},
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/icons/home.png',
                  ),
                  size: 50,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/camera.png'),
                    size: 50,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/newspaper.png'),
                    size: 50,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/pin.png'),
                    size: 50,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/planet-ecologic.png'),
                    size: 50,
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
