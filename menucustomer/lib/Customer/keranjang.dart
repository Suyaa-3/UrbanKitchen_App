import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:menucustomer/Customer/meja.dart';
import 'package:menucustomer/Customer/menumakanan.dart';
import 'package:menucustomer/Customer/menuminuman.dart';
import 'package:menucustomer/Customer/struk.dart';

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

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  bool isLoading = true;
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('cart').get();
      setState(() {
        cartItems = snapshot.docs.map((doc) {
          return CartItem(
            documentId: doc.id,
            gambar: doc['gambar'],
            nama: doc['nama'],
            harga: (doc['harga']),
            jumlah: (doc['jumlah']),
          );
        }).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error loading cart items: $error');
    }
  }

  void tambahItemKeCart(CartItem item) async {
    try {
      var existingItem = cartItems.firstWhere(
        (cartItem) => cartItem.nama == item.nama,
        orElse: () =>
            CartItem(documentId: '', gambar: '', nama: '', harga: 0, jumlah: 0),
      );

      if (existingItem.nama.isEmpty) {
        // If the item is not in the cart, add it to Firestore
        await FirebaseFirestore.instance.collection('cart').add({
          'gambar': item.gambar,
          'nama': item.nama,
          'harga': item.harga,
          'jumlah': item.jumlah,
        });
      } else {
        // If the item is already in the cart, update the quantity in Firestore
        await FirebaseFirestore.instance
            .collection('cart')
            .doc(existingItem
                .documentId) // Assuming you have a documentId field in CartItem
            .update({'jumlah': existingItem.jumlah + item.jumlah});
      }
    } catch (error) {
      print('Error adding item to cart: $error');
    }
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
            isLoading
                ? CircularProgressIndicator()
                : StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('cart')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      // Get the cart items from the snapshot
                      List<CartItem> cartItems = snapshot.data!.docs.map((doc) {
                        return CartItem(
                          documentId: doc['nama'],
                          gambar: doc['gambar'],
                          nama: doc['nama'],
                          harga: (doc['harga']),
                          jumlah: (doc['jumlah']),
                        );
                      }).toList();

                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ),
                          shrinkWrap: true,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            var item = cartItems[index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(40, 20, 0, 20),
                              child: Container(
                                // height: 250,
                                // width: 275,
                                padding: EdgeInsets.all(
                                    16.0), // Adjust the padding as needed
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the border radius as needed
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      child: Image.network(item.gambar),
                                    ),
                                    Text(
                                      item.nama,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'Harga: ${item.harga}, Jumlah: ${item.jumlah}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          item.jumlah.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
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
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 600),
                    height: 100,
                    width: 100,
                    child: Text(
                      "5",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }
}
