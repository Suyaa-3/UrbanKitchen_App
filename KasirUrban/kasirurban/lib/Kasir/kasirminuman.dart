import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kasirurban/Kasir/KasirKeranjang.dart';
import 'package:kasirurban/Kasir/Kasirmeja.dart';
import 'package:kasirurban/Kasir/kasirmakanan.dart';
import 'package:kasirurban/Kasir/switchmenupage.dart';

class CartItem {
  final String nama;
  final int harga;
  final int jumlah;

  CartItem({required this.nama, required this.harga, required this.jumlah});
}

class Cart {
  List<CartItem> items = [];
}

class KasirMinuman extends StatefulWidget {
  const KasirMinuman({Key? key}) : super(key: key);

  @override
  State<KasirMinuman> createState() => _KasirMinumanState();
}

class _KasirMinumanState extends State<KasirMinuman> {
  List<bool> switchValuesMinuman = List.generate(25, (index) => true);
  List<bool> switchValues = List.generate(25, (index) => true);

  late CollectionReference minumanCollection;

  Cart cart = Cart();

  @override
  void initState() {
    super.initState();
    minumanCollection = FirebaseFirestore.instance.collection('minuman');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const switchmenu()));
                      },
                      icon: Icon(
                        Icons.list_alt_outlined,
                        size: 50,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(400, 10, 350, 0),
                  child: Text(
                    "Urban Kitchen",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KasirKeranjang()));
                      },
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KasirMakanan()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KasirMinuman()));
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
                        MaterialPageRoute(builder: (context) => KasirMeja()));
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(70, 20, 70, 30),
              child: FutureBuilder<QuerySnapshot>(
                future: minumanCollection.get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('error: ${snapshot.error}');
                  } else {
                    var minumanDocs = snapshot.data!.docs;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: minumanDocs.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) {
                        var data =
                            minumanDocs[index].data() as Map<String, dynamic>;
                        return InkWell
                        (
                          onTap: () {
                            setState(() {
                              switchValues[index] = !switchValues[index];

                              if (switchValuesMinuman[index]) {
                                // Jika switch aktif, tambahkan item ke dalam cart

                                FirebaseFirestore.instance
                                    .collection('cart')
                                    .doc()
                                    .set({
                                  'gambar': data['gambar'],
                                  'nama': data['nama'],
                                  'harga': data['harga'],
                                  'jumlah': 1,
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Peringatan'),
                                      content: Text('berhasil memasukan data'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // Jika switch non-aktif, beri peringatan atau lakukan tindakan lain
                                // Misalnya, tampilkan pesan atau jalankan fungsi tertentu
                                // Di sini, kita tambahkan efek blur pada card ketika switch non-aktif.
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Peringatan'),
                                      content: Text(
                                          'Switch non-aktif. Tidak dapat menambahkan item ke dalam keranjang.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            });
                          },
                          child: Container(
                            width: 220,
                            height: 286,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.grey),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(1, 2),
                                  spreadRadius: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: switchValuesMinuman[index] ? 0 : 130,
                                  sigmaY: switchValuesMinuman[index] ? 0 : 130,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(data['gambar']),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        data['nama'],
                                        style: GoogleFonts.getFont(
                                          'Kavoon',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Rp. ${data['harga']}",
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 150, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
