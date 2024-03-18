import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbankitchen/SuperAdmin/formaddrole.dart';

class Listadmin extends StatefulWidget {
  const Listadmin({Key? key}) : super(key: key);

  @override
  State<Listadmin> createState() => _ListadminState();
}

class _ListadminState extends State<Listadmin> {
  late CollectionReference adminCollection;

  @override
  void initState() {
    super.initState();
    adminCollection = FirebaseFirestore.instance.collection('akunadmin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                child: FutureBuilder<QuerySnapshot>(
                    future: adminCollection.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('error: ${snapshot.error}');
                      } else {
                        var adminDocs = snapshot.data!.docs;

                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              childAspectRatio: 1.9,
                            ),
                            itemCount: adminDocs.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              var data = adminDocs[index].data()
                                  as Map<String, dynamic>;
                              return InkWell(
                                  child: Stack(children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Addrole(
                                                  documentId:
                                                      adminDocs[index].id,
                                                  userData: data,
                                                )));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
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
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data['photo'] ?? ''))),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 20, 0, 0),
                                              child: Text(data['email'] ?? '',
                                                  style: GoogleFonts.getFont(
                                                    'Kavoon',
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 0, 0),
                                              child: Text(
                                                  data['username'] ?? '',
                                                  style: GoogleFonts.getFont(
                                                    'Kavoon',
                                                    fontSize: 12,
                                                  )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 10, 0, 0),
                                              child: Text(" ${data['noHP']}",
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontSize: 12,
                                                  )),
                                            ),
                                          ],
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
            ],
          ),
        ),
      ),
    );
  }
}
