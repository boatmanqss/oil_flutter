import 'dart:convert';

import 'package:final_620710123/models/oil_item.dart';
import 'package:final_620710123/pages/oil/oil_lists_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OilPage extends StatefulWidget {
  const OilPage({Key? key}) : super(key: key);

  @override
  _OilPageState createState() => _OilPageState();
}

class _OilPageState extends State<OilPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station_sharp),
            label: 'ราคาน้ำมัน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station_outlined ),
            label: 'ราคาก๊าซธรรมชาติ',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      body: Container(
        child: OilListsPage(),
      ),
    );
  }

}
