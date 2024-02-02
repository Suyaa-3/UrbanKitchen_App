import 'package:flutter/material.dart';
import 'package:kasirurban/Kasir/Kasirmeja.dart';
import 'package:kasirurban/Kasir/Struk.dart';
import 'package:kasirurban/Kasir/kasirmakanan.dart';
import 'package:kasirurban/Kasir/kasirminuman.dart';

class CartItem {
  final String documentId;
  final String gambar;
  final String nama;
  final int harga;
  int jumlah;

  CartItem({
    required this.documentId,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.jumlah,
  });
}

class DetailPelanggan extends StatefulWidget {
  const DetailPelanggan({Key? key}) : super(key: key);

  @override
  State<DetailPelanggan> createState() => _DetailPelangganState();
}

class _DetailPelangganState extends State<DetailPelanggan> {
  _DetailPelangganState() {
    _selectedVal = _PembayaranMetodeList[0];
    _Waktupemesanan.text = _getCurrentTime();
  }

  final TextEditingController _Waktupemesanan = TextEditingController();
  final TextEditingController _meja = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _menupesanan = TextEditingController();

  final _PembayaranMetodeList = [
    "CASH",
    "BCA",
    "OVO",
    "DANA",
    "GOPAY",
    "MANDIRI"
  ];
  String? _selectedVal = "CASH";

  String _getCurrentTime() {
    var time = DateTime.now();

    return "${time.day.toString().padLeft(2, '0')}-${time.month.toString().padLeft(2, '0')}-${time.year.toString().padLeft(2, '0')},${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        child: Column(children: [
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
                  icon: Icon(Icons.shopping_bag_outlined, size: 50),
                ),
              ),
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
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KasirMakanan()),
                  );
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
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KasirMinuman()),
                  );
                },
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
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
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KasirMeja()),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Color.fromRGBO(125, 25, 25, 1),
            height: 1032,
            width: 1280,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100, top: 90),
                      child: Container(
                        child: Text("Waktu Pemesanan ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80, top: 90),
                      child: Container(
                        child: Text(": ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 100, top: 90),
                        child: Container(
                          width: 600,
                          child: TextField(
                            controller: _Waktupemesanan,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100, top: 90),
                      child: Container(
                        child: Text("Nomor Meja ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 175, top: 90),
                      child: Container(
                        child: Text(": ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 100, top: 90),
                        child: Container(
                          width: 600,
                          child: TextField(
                            controller: _meja,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100, top: 90),
                      child: Container(
                        child: Text("Nama Customer ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120, top: 90),
                      child: Container(
                        child: Text(": ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 100, top: 90),
                        child: Container(
                          width: 600,
                          child: TextField(
                            controller: _nama,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100, top: 90),
                      child: Container(
                        child: Text("Menu Pesanan",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150, top: 90),
                      child: Container(
                        child: Text(": ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 100, top: 90),
                        child: Container(
                          width: 600,
                          child: TextField(
                            controller: _menupesanan,
                            maxLines: 4,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 100, top: 90),
                      child: Container(
                        child: Text("Pembayaran",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 185, top: 90),
                      child: Container(
                        child: Text(": ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 100, top: 90),
                        child: Container(
                            width: 600,
                            child: DropdownButtonFormField(
                              dropdownColor: Color.fromRGBO(63, 136, 204, 1),
                              value: _selectedVal,
                              items: _PembayaranMetodeList.map(
                                  (e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      )).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedVal as String;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(400, 90, 0, 0),
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 500,
                          height: 80,
                          child: Center(
                              child: Text(
                            "Konfirmasi",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(172, 172, 172, 1),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(226, 226, 226, 1)),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Struk()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
