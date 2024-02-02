import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

class UpdateMenu extends StatefulWidget {
  const UpdateMenu({super.key});

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  bool isLoading = false;
  String selectedType = 'makanan';
  final _FormMenuKey = GlobalKey<_UpdateMenuState>();
  TextEditingController _nama = TextEditingController();
  TextEditingController _harga = TextEditingController();
  TextEditingController _jumlahkursi = TextEditingController();
  TextEditingController _keterangan = TextEditingController();
  TextEditingController _gambar = TextEditingController();
  PlatformFile? pickedFile;

  formMenu() async {
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
      int? _hargaValue;
      if (selectedType != 'meja') {
        _hargaValue = int.tryParse(_harga.text);
      }
      // Pastikan _jumlahkursi.text tidak kosong sebelum menyertakannya ke dalam data
      String? jumlahKursiValue;
      if (selectedType == 'meja' && _jumlahkursi.text.isNotEmpty) {
        jumlahKursiValue = _jumlahkursi.text;
      }
      final downloadURL = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection(selectedType).add({
        'nama': _nama.text,
        'harga': _hargaValue,
        'jumlahkursi': jumlahKursiValue,
        'keterangan': _keterangan.text,
        'gambar': _gambar.text = downloadURL,
      });
      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateMenu()));
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
      appBar: AppBar(
        toolbarHeight: 40,
        title: Padding(
          padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
          child: Text("Bandung", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color.fromRGBO(125, 25, 25, 1),
        leading: BackButton(
          color: Color(0xFFF9F6EE),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _FormMenuKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 40, 0, 0),
            child: Column(
              children: [
                Container(
                  height: 48,
                  width: 220,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Update Menu",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 720,
                  width: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(125, 25, 25, 1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          "Silahkan Masukkan Data Menu",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _nama,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'nama kosong';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: 'masukkan nama',
                          labelText: 'Nama',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _harga,
                        validator: (value) {
                          if (selectedType == 'meja' &&
                              (value == null || value.isEmpty)) {
                            return 'Jumlah kursi tidak boleh kosong';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: selectedType == 'meja'
                              ? 'Masukkan jumlah kursi'
                              : 'masukkan Harga',
                          labelText:
                              selectedType == 'meja' ? 'Jumlah Kursi' : 'Harga',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _keterangan,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'keterangan kosong';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: 'masukkan keterangan',
                          labelText: 'keterangan',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(125, 25, 25, 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DropdownButton<String>(
                        value: selectedType,
                        onChanged: (newValue) {
                          setState(() {
                            selectedType = newValue!;
                          });
                        },
                        items: ['makanan', 'minuman', 'cemilan', 'meja']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
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
                        height: 30,
                      ),
                      InkWell(
                        child: Container(
                          width: 230,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(125, 25, 25, 1),
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        onTap: () {
                          formMenu();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
