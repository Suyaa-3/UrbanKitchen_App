import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:menucustomer/Customer/meja.dart';
import 'package:menucustomer/Customer/menumakanan.dart';
import 'package:menucustomer/Customer/menuminuman.dart';
import 'package:menucustomer/Customer/struk.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key});

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(500, 10, 0, 0),
                  child: Text(
                    "Urban Kitchen",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(350, 15, 0, 0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        size: 50,
                      )),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(35, 50, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                        color: Color.fromRGBO(125, 25, 25, 1)),
                    height: 60,
                    width: 400,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                        child: Text(
                          "Makanan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuMakanan()));
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                        color: Color.fromRGBO(125, 25, 25, 1)),
                    height: 60,
                    width: 400,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                        child: Text(
                          "Minuman",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuMinuman()));
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                        color: Color.fromRGBO(125, 25, 25, 1)),
                    height: 60,
                    width: 400,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(170, 8, 0, 0),
                        child: Text(
                          "Meja",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Meja()));
                  },
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(100, 50, 0, 0),
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                          color: Colors.black,
                        ),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: 130,
                        height: 130,
                        child: Image(
                          image: AssetImage('assets/images/burger.png'),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 70, 0, 0),
                            child: Text("Burger",
                                style: GoogleFonts.getFont(
                                  'Kavoon',
                                  fontSize: 20,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text("Rp. 50.000",
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              size: 40,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_sharp,
                              size: 40,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 180),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.highlight_remove_rounded,
                              size: 40,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 50, 0, 0),
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                          color: Colors.black,
                        ),
                      ]),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                height: 1,
                width: 1000,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(200, 50, 0, 0),
              child: Row(
                children: [
                  Container(
                      height: 100,
                      width: 200,
                      child: Text(
                        "Meja No:",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 600),
                      height: 100,
                      width: 100,
                      child: Text("5",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w600))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 1,
                width: 1000,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(400, 40, 0, 0),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 70,
                    child: Center(
                        child: Text(
                      "Batalkan",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: InkWell(
                      child: Container(
                        width: 200,
                        height: 70,
                        child: Center(
                            child: Text(
                          "Konfirmasi",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(125, 25, 25, 1),
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Struk()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
