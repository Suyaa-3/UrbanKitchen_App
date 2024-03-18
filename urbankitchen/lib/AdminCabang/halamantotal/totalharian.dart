import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/detailtotal/harian/detailtotalharian.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/detailtotal/harian/pemasukanharian.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/detailtotal/harian/pengeluaranharian.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/totalbulanan.dart';
import 'package:urbankitchen/AdminCabang/halamantotal/totalmingguan.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TotalHarian extends StatefulWidget {
  const TotalHarian({Key? key});

  @override
  State<TotalHarian> createState() => _TotalHarianState();
}

class _TotalHarianState extends State<TotalHarian> {
  late int pemasukan = 0;
  late int pengeluaran = 1;
  DateTime tanggal = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  var _numberToMonth = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "Mei",
    6: "Jun",
    7: "Jul",
    8: "Ags",
    9: "Sep",
    10: "Okt",
    11: "Nov",
    12: "Des",
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> generatePDF(BuildContext context) async {
    print("Memulai generatePDF");
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text("Laporan Keuangan Harian",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 16)),
              pw.SizedBox(height: 12), // Spasi antara judul dan tabel

              // Tabel
              pw.Table.fromTextArray(
                border: null, // Tidak ada border di sekitar tabel
                headerAlignment: pw.Alignment.centerLeft,
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration: pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
                headerHeight: 25,
                cellHeight: 30,
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.centerLeft,
                },
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                data: [
                  ['Jenis', 'Nominal'],
                  ['Pemasukan', 'Rp.$pemasukan'],
                  ['Pengeluaran', 'Rp.$pengeluaran'],
                  ['Total', 'Rp.30.000.000'],
                  ['Hasil Bersih', 'Rp.-'],
                ],
              ),
            ],
          );
        },
      ),
    );

    final fileName = "laporan_keuangan_${_dateController.text}.pdf";
    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/$fileName");
    await file.writeAsBytes(await pdf.save());

    print("Path File: ${file.path}");

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PDF Berhasil Diunduh'),
          content: Text('PDF telah berhasil diunduh di ${file.path}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: Text('Selesai'),
            ),
            TextButton(
              onPressed: () {
                OpenFile.open(file.path); // Membuka file
              },
              child: Text('Buka File'),
            ),
          ],
        );
      },
    );
    print("Selesai generatePDF");
  }

  Future<void> fetchData() async {
    try {
      DateTime startDate = DateTime(tanggal.year, tanggal.month, tanggal.day);
      DateTime endDate = startDate.add(Duration(days: 1));

      print('Fetching data for date: $startDate');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('laporan')
          .where('tanggal',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .where('tanggal', isLessThan: Timestamp.fromDate(endDate))
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var documentSnapshot = querySnapshot.docs.first;

        setState(() {
          pemasukan = documentSnapshot['pemasukan'];
          pengeluaran = documentSnapshot['pengeluaran'];

          print('Pemasukan: $pemasukan, Pengeluaran: $pengeluaran');
        });
      } else {
        pemasukan = 0;
        pengeluaran = 0;
      }
    } catch (error) {
      print('error: $error');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tanggal,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != tanggal) {
      setState(() {
        tanggal = picked;
        _dateController.text =
            "${tanggal.day}-${_numberToMonth[tanggal.month]}-${tanggal.year}";
      });

      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    int HasilBersih = pemasukan - pengeluaran;

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
        child: Column(
          children: [
            SizedBox(
              height: 65,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: InkWell(
                    child: Container(
                      height: 48,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Harian",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(125, 25, 25, 1)),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TotalHarian()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: InkWell(
                    child: Container(
                      height: 48,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Mingguan",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(125, 25, 25, 1)),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TotalMingguan()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: InkWell(
                    child: Container(
                      height: 48,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Bulanan",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(125, 25, 25, 1)),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(125, 25, 25, 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TotalBulanan()));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              width: 220,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${_dateController.text}",
                      ),
                      Icon(Icons.calendar_today_rounded)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 400,
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
                      "Laporan Keuangan Harian",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      height: 48,
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Pemasukan    : Rp.$pemasukan"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PemasukanHarian()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 48,
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Pengeluaran    : Rp.$pengeluaran"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PengeluaranHarian()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      height: 48,
                      width: 220,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Total    : Rp.30.000.000"),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailTotalHarian()));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    height: 48,
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text("Hasil Bersih   : Rp.$HasilBersih"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: InkWell(
                child: Container(
                  height: 48,
                  width: 100,
                  child: Center(
                      child: Text(
                    "print",
                    style: TextStyle(color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(125, 25, 25, 1)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(125, 25, 25, 1),
                  ),
                ),
                onTap: () async {
                  await generatePDF(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TotalHarian()));
                  print('print selesai');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
