import 'package:flutter/material.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/detailtotalharian.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/pemasukanharian.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/pengeluaranharian.dart';
import 'package:urbankitchen/halamantotal/detailtotal/mingguan/detailtotalmingguan.dart';
import 'package:urbankitchen/halamantotal/detailtotal/mingguan/pemasukanmingguan.dart';
import 'package:urbankitchen/halamantotal/detailtotal/mingguan/pengeluaranmingguan.dart';
import 'package:urbankitchen/halamantotal/totalbulanan.dart';
import 'package:urbankitchen/halamantotal/totalharian.dart';

class TotalMingguan extends StatelessWidget {
  const TotalMingguan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Padding(
          padding: EdgeInsets.fromLTRB(60,0,0,0),
          child: Text("Bandung",style:TextStyle(color: Colors.white) ),
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
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Harian",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TotalHarian()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Mingguan",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TotalMingguan()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Bulanan",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TotalBulanan()));
                    },
            ),
          ),
        ],
       ),SizedBox(
          height: 40,
       ),
       Container(
        height: 48,
        width: 220,
       decoration: BoxDecoration(
        border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
        borderRadius: BorderRadius.circular(10)
       ),
       child: Center(
         child: Text(
          "Oktober, 1-7 ,1980"
         ),
       ),
       ),
       SizedBox(height:30),
       Container(
        
        height: 400,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1))
        ),
     child: Column(
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
   Container(
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: Text("Laporan Keuangan Mingguan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
   ),
     InkWell(
       child: Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0,0),
          height: 48,
          width: 220,
         decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
          borderRadius: BorderRadius.circular(10)
         ),
         child: Center(
           child: Text(
            "Pemasukan    : Rp.30.000.000"
           ),
         ),
         ),
          onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PemasukanMingguan()));
                    },
     ),
       InkWell(
         child: Container(
             margin: EdgeInsets.fromLTRB(0, 30, 0,0),
          height: 48,
          width: 220,
         decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
          borderRadius: BorderRadius.circular(10)
         ),
         child: Center(
           child: Text(
            "Pengeluaran    : Rp.25.000.000"
           ),
         ),
         ),
          onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PengeluaranMingguan()));
                    },
       ),
       InkWell(
         child: Container(
             margin: EdgeInsets.fromLTRB(0, 30, 0,0),
          height: 48,
          width: 220,
         decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
          borderRadius: BorderRadius.circular(10)
         ),
         child: Center(
           child: Text(
            "Total    : Rp.30.000.000"
           ),
         ),
         ),
          onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailTotalMingguan()));
                    },
       ),
       Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0,0),
        height: 48,
        width: 220,
       decoration: BoxDecoration(
        border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
        borderRadius: BorderRadius.circular(10)
       ),
       child: Center(
         child: Text(
          "Hasil Bersih   : Rp.5.000.000"
         ),
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