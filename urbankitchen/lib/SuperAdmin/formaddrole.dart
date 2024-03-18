import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Addrole extends StatefulWidget {
  final Map<String, dynamic> userData;
  final String documentId;

  const Addrole({Key? key, required this.userData, required this.documentId})
      : super(key: key);

  @override
  State<Addrole> createState() => _AddroleState();
}

class _AddroleState extends State<Addrole> {
  bool isLoading = false;
  final _AddRoleKey = GlobalKey<_AddroleState>();
  String role = "kasir1";
  String gambarURL = "";
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool isActive = false;
  addRole() async {
    try {
      await FirebaseFirestore.instance
          .collection("akunadmin")
          .doc(widget.documentId)
          .update({
        "username": _nama.text,
        "email": _email.text,
        "isActive": isActive,
        "role": role,
      });
    } catch (e) {
      print('Error fetching document: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    // Access user data and set it in the corresponding text fields
    _nama.text = widget.userData['username'] ?? '';
    _email.text = widget.userData['email'] ?? '';
    gambarURL = widget.userData['photo'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _AddRoleKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blueAccent,
              ),
              Container(
                width: 400,
                height: 500,
                margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 270,
                      height: 150,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(gambarURL),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 20, 20),
                          ),
                          Container(
                            width: 110,
                            height: 100,
                            color: Colors.blue,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 120,
                                  height: 40,
                                  child: Switch(
                                    value: isActive,
                                    onChanged: (value) {
                                      setState(() {
                                        isActive = value;
                                      });
                                    },
                                  ),
                                  margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  color: Colors.amber,
                                  margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: 230,
                        height: 270,
                        margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'nama kosong';
                                }
                                return null;
                              },
                              cursorColor: Color.fromARGB(1, 255, 28, 28),
                              decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                labelText: 'email',
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _nama,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'nama kosong';
                                }
                                return null;
                              },
                              cursorColor: Color.fromARGB(1, 255, 28, 28),
                              decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.black),
                                labelText: 'Nama',
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropdownButton<String>(
                              value: role,
                              onChanged: (newValue) {
                                setState(() {
                                  role = newValue!;
                                });
                              },
                              items: [
                                'kasir1',
                                'manajer1',
                                'kasir2',
                                'manajer2'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                            ),
                            InkWell(
                              onTap: () {
                                addRole();
                              },
                              child: Container(
                                height: 20,
                                width: 50,
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
