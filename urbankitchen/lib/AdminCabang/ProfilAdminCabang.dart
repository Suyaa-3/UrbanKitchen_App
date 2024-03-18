import 'package:flutter/material.dart';
import 'package:urbankitchen/AdminCabang/UpdateMakanan.dart';
import 'package:urbankitchen/AdminCabang/updatemenu.dart';
import 'package:urbankitchen/SuperAdmin/detailadmin.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/totalharian.dart';

class AdminCabang extends StatefulWidget {
  const AdminCabang({super.key});

  @override
  State<AdminCabang> createState() => _AdminCabangState();
}

class _AdminCabangState extends State<AdminCabang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Admin Urban Kitchen",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(85, 20, 0, 48),
                      height: 220,
                      width: 190,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(125, 25, 25, 1),
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 1),
                              color: Colors.black,
                            ),
                          ]),
                    ),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(120, 30, 84, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/profileadmin.jpg'),
                                width: 120,
                                height: 120,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Text(
                              "Asep Stroberi",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 300, 0, 31),
                      width: double.infinity,
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                        color: Color.fromRGBO(125, 25, 25, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: Offset(0.0, -25.0),
                                        child: Container(
                                          width: 90,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(125, 25, 25, 1),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 25, 25, 1),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Bandung",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-1.0, -15.0),
                                        child: Container(
                                          height: 40,
                                          width: 128,
                                          child: Text(
                                            " JL. holis, caringin kota bandung, jawa barat",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(125, 25, 25, 1),
                                          ),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Update Stok",
                                          style: TextStyle(fontSize: 11),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateMakanan()));
                                },
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(
                                        color: Color.fromRGBO(125, 25, 25, 1),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: Offset(0.0, -25.0),
                                        child: Container(
                                          width: 90,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(125, 25, 25, 1),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 25, 25, 1),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Bandung",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-1.0, -15.0),
                                        child: Container(
                                          height: 40,
                                          width: 128,
                                          child: Text(
                                            " JL. holis, caringin kota bandung, jawa barat",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                Color.fromRGBO(125, 25, 25, 1),
                                          ),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Total : Rp. 30.000.000",
                                          style: TextStyle(fontSize: 11),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TotalHarian()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                          color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, -25.0),
                          child: Container(
                            width: 90,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(125, 25, 25, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(125, 25, 25, 1),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Bandung",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-1.0, -15.0),
                          child: Container(
                            height: 40,
                            width: 128,
                            child: Text(
                              " JL. holis, caringin kota bandung, jawa barat",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(125, 25, 25, 1),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "Update Menu",
                            style: TextStyle(fontSize: 11),
                          )),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UpdateMenu()));
                  },
                ),
              ],
            ),
          ]),
        ));
  }
}
