import 'package:final_620710123/pages/oil/oil_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  OilPage? _currentPage = OilPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ราคาน้ำมัน',style: GoogleFonts.prompt(fontSize: 20.0),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      child: Container(
                    width: 150.0,
                    height: 100.0,
                    child: Image.asset('assets/images/ptt-logo.png'),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'PTT OIL',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icons.local_gas_station_sharp, 'ราคาน้ำมัน', 0),
              onTap: () {
                _showSubPage(context, 0);
              },
            ),
            ListTile(
              title: _buildDrawerItem(Icons.person, 'ผู้จัดทำ', 1),
              onTap: () {
                _showSubPage(context, 1);
              },
            ),
          ],
        ),
      ),
      body: _buildSubPage(),
    );
  }

  dynamic _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return _currentPage;
      default:
        return null;
    }
  }

  Row _buildDrawerItem(IconData icon, String title, int onFocus) {
    return Row(
      children: [
        Icon(icon, color: _subPageIndex == onFocus ? Colors.blue : null),
        SizedBox(width: 8.0),
        Text(title,
            style: _subPageIndex == onFocus
                ? GoogleFonts.prompt(fontSize: 20.0)
                : GoogleFonts.prompt(fontSize: 15.0)),
      ],
    );
  }

  void _showSubPage(BuildContext context, int page) {
    setState(() {
      _subPageIndex = page;
      _currentPage = page == 0 ? OilPage() : null;
    });
    Navigator.of(context).pop();
  }
}
