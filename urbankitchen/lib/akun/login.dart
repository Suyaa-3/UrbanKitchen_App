import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:urbankitchen/AdminCabang/ProfilAdminCabang.dart';
import 'package:urbankitchen/AdminCabang2/ProfilAdminCabang.dart';
import 'package:urbankitchen/SuperAdmin/SuperAdminHome.dart';
import 'package:urbankitchen/SuperAdmin/detailadmin.dart';
import 'package:urbankitchen/akun/Register.dart';
import 'package:urbankitchen/akun/waitpage.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  bool _isObscure = true;
  final _loginkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

signInWithEmailAndPassword() async {
  try {
    setState(() {
      isLoading = true;
    });
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    );

    // Mengambil data pengguna dari Firestore
    final userDoc = await FirebaseFirestore.instance
        .collection('akunadmin')
        .doc(userCredential.user?.uid)
        .get();

    final userData = userDoc.data();

    // Memeriksa peran pengguna
    if (userData != null && userData['role'] != null) {
      String role = userData['role'];
      if (role == 'manajer1') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminCabang()));
      } else if (role == 'manajer2') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminCabang2()));
      } else {
        // Jika peran tidak ditemukan atau kosong
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WaitPage()));
      }
    } else {
      // Jika data pengguna atau peran tidak ditemukan
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WaitPage()));
    }
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("wrong password or email"),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: _loginkey,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Superadminhomepage()));
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Center(
                     child: 
                     isLoading
                      ? CircularProgressIndicator() // Tampilkan indikator loading
                      : TextButton(
                          child: Text(
                            "LOGIN",
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
                            if (_loginkey.currentState!.validate()) {
                              signInWithEmailAndPassword();
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
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
