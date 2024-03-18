import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:urbankitchen/SuperAdmin/SuperAdminHome.dart';
import 'package:urbankitchen/SuperAdmin/detailadmin.dart';
import 'package:urbankitchen/akun/waitpage.dart';
import 'package:mime/mime.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscure = true;
  final _registrasikey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _noHP = TextEditingController();
  final TextEditingController _photo = TextEditingController();
  bool isActive = false;
  String role = "";
  PlatformFile? pickedFile;

  createUserWithEmailAndPassword() async {
    final path = 'files/${pickedFile!.name}';
    final mimeType = lookupMimeType(
        pickedFile!.path!); // Adjust this based on your file type
    SettableMetadata metadata = SettableMetadata(contentType: mimeType);
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    ref.putFile(file, metadata);

    try {
      setState(() {
        isLoading = true;
      });
      final downloadURL = await ref.getDownloadURL();
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      var uuid = Uuid();
      String id = uuid.v4();
      await FirebaseFirestore.instance
          .collection("akunadmin")
          .doc(credential.user!.uid)
          .set({
        "id": id,
        "photo": downloadURL,
        "email": _email.text,
        "username": _username.text,
        "noHP": _noHP.text,
        "isActive": isActive,
        "role": role,
      });

      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => WaitPage()));
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: _registrasikey,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 25),
                  child: Image.asset('assets/images/logo.png'),
                  width: 425,
                  height: 325,
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email kosong';
                      }
                      return null;
                    },
                    cursorColor: Color.fromARGB(1, 255, 28, 28),
                    decoration: const InputDecoration(
                      hintText: 'masukkan email',
                      labelText: 'Email',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(1, 1, 1, 0.20)),
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(125, 25, 25, 0.40)),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama kosong';
                      }
                      return null;
                    },
                    cursorColor: Color.fromARGB(1, 255, 28, 28),
                    decoration: const InputDecoration(
                      hintText: 'masukkan Nama',
                      labelText: 'Nama',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(1, 1, 1, 0.20)),
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(125, 25, 25, 0.40)),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _password,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password kosong';
                      }
                      return null;
                    },
                    cursorColor: Color.fromARGB(1, 255, 28, 28),
                    decoration: InputDecoration(
                      hintText: 'silahkan masukkan password',
                      labelText: 'Password',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(1, 1, 1, 0.20)),
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(125, 25, 25, 0.40)),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    controller: _noHP,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No HP kosong';
                      }
                      return null;
                    },
                    cursorColor: Color.fromARGB(1, 255, 28, 28),
                    decoration: InputDecoration(
                      hintText: 'masukan no hp',
                      labelText: 'nohp',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(1, 1, 1, 0.20)),
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(125, 25, 25, 0.40)),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 3, color: Color.fromRGBO(125, 25, 25, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Container(
                    width: 270,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(125, 25, 25, 1),
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Masukkan gambar",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  onTap: () {
                    selectFile();
                  },
                ),
                SizedBox(height: 20),
                // Displaying selected image details
                pickedFile != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Gambar Terpilih:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("Nama File: ${pickedFile!.name}"),
                          Text("Tipe File: ${pickedFile!.extension}"),
                        ],
                      )
                    : Container(),

                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Container(
                    child: Text(
                      "lupa password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 230),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WaitPage()));
                  },
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                  child: Center(
                    child: TextButton(
                      child: Text(
                        "REGISTER",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          backgroundColor: Color.fromRGBO(125, 25, 25, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Color.fromRGBO(125, 25, 25, 1),
                      ),
                      onPressed: () {
                        if (_registrasikey.currentState!.validate()) {
                          createUserWithEmailAndPassword();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Processing'),
                              backgroundColor: Color.fromRGBO(125, 25, 25, 1),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  height: 40,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color.fromRGBO(125, 25, 25, 1),
                  ),
                ),
                Container(
                  child: Image.asset('assets/images/bawahan.png'),
                  width: 425,
                  height: 178,
                ),
              ],
            )),
      ),
    );
  }
}
