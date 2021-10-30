import 'package:final_620710123/models/oil_item.dart';
import 'package:final_620710123/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OilListsPage extends StatefulWidget {
  const OilListsPage({Key? key}) : super(key: key);

  @override
  _OilListsPageState createState() => _OilListsPageState();
}

class _OilListsPageState extends State<OilListsPage> {
  late Future<List<OilItem>> _futureOilList;

  var items = [
    OilItem(
      id: 1,
      name: "ข้าวไข่เจียว",
      price: 25,
      image: 'https://orapiweb1.pttor.com/uploads/images/20210115_130045_4176.jpg',
    ),
    OilItem(
      id: 1,
      name: "ข้าวไข่เจียว",
      price: 25,
      image: 'https://orapiweb1.pttor.com/uploads/images/20210115_130045_4176.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<OilItem>>(
        // ข้อมูลจะมาจาก Future ที่ระบุให้กับ parameter นี้
        future: _futureOilList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureOilList = _loadOils();
                      });
                    },
                    child: Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var oilItem = snapshot.data![index];

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: InkWell(
                    onTap: null,
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          oilItem.image,
                          width: 215.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      oilItem.name,
                                      style: GoogleFonts.prompt(fontSize: 12.0),
                                    ),
                                    Text(
                                      '${oilItem.price.toString()} บาท',
                                      style: GoogleFonts.prompt(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<List<OilItem>> _loadOils() async {
    List list = await Api().fetch('api/oilprice/LatestOilPrice');
    var oilList = list.map((item) => OilItem.fromJson(item)).toList();
    return oilList;
  }


  @override
  initState() {
    super.initState();
    _futureOilList = _loadOils();
  }

}
