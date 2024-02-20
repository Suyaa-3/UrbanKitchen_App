import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kasirurban/Kasir/Kasirmeja.dart';
import 'package:kasirurban/Kasir/detailpelanggan.dart';
import 'package:kasirurban/Kasir/kasirmakanan.dart';
import 'package:kasirurban/Kasir/kasirminuman.dart';
import 'package:kasirurban/Kasir/switchmenupage.dart';
import 'package:provider/provider.dart';

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

class KasirKeranjang extends StatefulWidget {
  const KasirKeranjang({Key? key}) : super(key: key);

  @override
  State<KasirKeranjang> createState() => _KasirKeranjangState();
}

class _KasirKeranjangState extends State<KasirKeranjang> {
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

  void kurangiJumlahItem(CartItem item) async {
    try {
      var existingItem = cartItems.firstWhere(
        (cartItem) => cartItem.nama == item.nama,
        orElse: () =>
            CartItem(documentId: '', gambar: '', nama: '', harga: 0, jumlah: 0),
      );

      if (existingItem.nama.isNotEmpty) {
        if (existingItem.jumlah > 1) {
          // If the quantity is more than 1, update the quantity in Firestore
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(existingItem
                  .documentId) // Assuming you have a documentId field in CartItem
              .update({'jumlah': existingItem.jumlah - 1});
        } else {
          // If the quantity is 1, remove the item from Firestore
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(existingItem
                  .documentId) // Assuming you have a documentId field in CartItem
              .delete();
        }
      }
    } catch (error) {
      print('Error updating item quantity in cart: $error');
    }
  }

  void _hapusItemDariCart(CartItem item) async {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(item.documentId)
          .delete();
    } catch (error) {
      print('Error deleting item from cart: $error');
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
                  padding: EdgeInsets.fromLTRB(350, 15, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 50,
                    ),
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
                        width: 1,
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                      color: Color.fromRGBO(125, 25, 25, 1),
                    ),
                    height: 60,
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                      child: Text(
                        "Makanan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KasirMakanan(),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                      color: Color.fromRGBO(125, 25, 25, 1),
                    ),
                    height: 60,
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                      child: Text(
                        "Minuman",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KasirMinuman(),
                      ),
                    );
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                      color: Color.fromRGBO(125, 25, 25, 1),
                    ),
                    height: 60,
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(170, 8, 0, 0),
                      child: Text(
                        "Meja",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KasirMeja(),
                      ),
                    );
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
                                      margin: EdgeInsets.fromLTRB(120, 0, 0, 0),
                                      width: 30,
                                      height: 30,
                                      child: IconButton(
                                          onPressed: () =>
                                              kurangiJumlahItem(item),
                                          icon: Icon(
                                              Icons.highlight_remove_sharp)),
                                    ),
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
                                        IconButton(
                                          onPressed: () =>
                                              kurangiJumlahItem(item),
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20,
                                          ),
                                        ),
                                        Text(
                                          item.jumlah.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              tambahItemKeCart(item),
                                          icon: Icon(
                                            Icons.add,
                                            size: 20,
                                          ),
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
            Padding(
              padding: EdgeInsets.fromLTRB(400, 40, 0, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 200,
                      height: 70,
                      child: Center(
                        child: Text(
                          "Batalkan",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(125, 25, 25, 1),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(125, 25, 25, 1),
                          border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(125, 25, 25, 1),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPelanggan(),
                          ),
                        );
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
