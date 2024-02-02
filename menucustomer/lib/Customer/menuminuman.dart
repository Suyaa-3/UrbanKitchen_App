import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menucustomer/Customer/keranjang.dart';
import 'package:menucustomer/Customer/meja.dart';
import 'package:menucustomer/Customer/menumakanan.dart';

void main() {
  runApp(MenuMinuman());
}

class MenuMinuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MenuList(),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late CollectionReference minumanCollection;
  bool isExpanded = false;
  Map<String, dynamic>? selectedCardData;
  @override
  void initState() {
    super.initState();

    minumanCollection = FirebaseFirestore.instance.collection('minuman');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isExpanded) {
          setState(() {
            isExpanded = false;
            selectedCardData = null; // Reset selected card data when closing
          });
        }
      },
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(500, 10, 350, 0),
                  child: Text(
                    "Urban Kitchen",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: IconButton(
                      onPressed: isExpanded || selectedCardData != null
                          ? null // Disable button when expanded or selectedCardData is not null
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Keranjang()));
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
                  onTap: isExpanded || selectedCardData != null
                      ? null // Disable button when expanded or selectedCardData is not null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuMakanan()));
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
                  onTap: isExpanded || selectedCardData != null
                      ? null // Disable button when expanded or selectedCardData is not null
                      : () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuMinuman()));
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
                  onTap: isExpanded || selectedCardData != null
                      ? null // Disable button when expanded or selectedCardData is not null
                      : () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Meja()));
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
                      var cemilanDocs = snapshot.data!.docs;

                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: cemilanDocs.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            var data = cemilanDocs[index].data()
                                as Map<String, dynamic>;
                            return InkWell(
                                child: Stack(children: [
                              GestureDetector(
                                onTap: () {
                                  print('GestureDetector tapped');
                                  if (!isExpanded) {
                                    setState(() {
                                      isExpanded = true;
                                      selectedCardData = {
                                        'gambar':
                                            data['gambar']?.toString() ?? '',
                                        'nama': data['nama']?.toString() ?? '',
                                        'keterangan':
                                            data['keterangan']?.toString() ??
                                                '',
                                        'harga':
                                            data['harga']?.toString() ?? '',
                                      };
                                      print(
                                          'selectedCardData: $selectedCardData');
                                    });
                                  }
                                },
                                child: Container(
                                  width: 220,
                                  height: 286,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(1, 2),
                                          spreadRadius: 1,
                                          color: Colors.black,
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 180,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data['gambar'] ?? ''))),
                                      ),
                                      Container(
                                        child: Text(data['nama'] ?? '',
                                            style: GoogleFonts.getFont(
                                              'Kavoon',
                                              fontSize: 20,
                                            )),
                                      ),
                                      Container(
                                        child: Text("Rp. ${data['harga']}",
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontSize: 20,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]));
                          });
                    }
                  }),
            ),
          ]),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            bottom:
                isExpanded ? 0 : -MediaQuery.of(context).size.height * 3 / 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3 / 4,
              color: Color.fromRGBO(125, 25, 25, 1),
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 350,
                    child: Image(
                      image: NetworkImage(selectedCardData?['gambar'] ?? ''),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 70),
                    child: Text(selectedCardData?['nama'] ?? '',
                        style: GoogleFonts.getFont('Kavoon',
                            fontSize: 50, color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 70, top: 35),
                    child: Text(selectedCardData?['keterangan'] ?? '',
                        style: GoogleFonts.getFont('Inter',
                            fontSize: 30, color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 70, top: 35),
                    child: Text('Rp. ${selectedCardData?['harga'] ?? ''}',
                        style: GoogleFonts.getFont('Inter',
                            fontSize: 30, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
