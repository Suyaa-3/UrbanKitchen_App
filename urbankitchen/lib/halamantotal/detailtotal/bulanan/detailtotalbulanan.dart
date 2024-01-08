import 'package:flutter/material.dart';
import 'package:urbankitchen/halamantotal/detailtotal/bulanan/pemasukanbulanan.dart';
import 'package:urbankitchen/halamantotal/detailtotal/bulanan/pengeluaranbulanan.dart';
import 'package:urbankitchen/halamantotal/totalharian.dart';

class DetailTotalBulanan extends StatelessWidget {
  const DetailTotalBulanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Padding(
          padding: EdgeInsets.fromLTRB(60,0,0,0),
          child: Text("Bulanan",style:TextStyle(color: Colors.white) ),
        ),
        
        backgroundColor: Color.fromRGBO(125, 25, 25, 1),
         leading: BackButton(
          
          onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TotalHarian()), (route) => false);},
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
                child: Center(child: Text("Pengeluaran",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PengeluaranBulanan()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("pemasukan",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PemasukanBulanan()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Total Penjualan",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailTotalBulanan()));
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
          "january,1-31,1847"
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
    child: Text("Total Penjualan Menu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
   ),
     Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0,0),
          height: 48,
          width: 220,
         decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
          borderRadius: BorderRadius.circular(10)
         ),
         child: Center(
           child: Text(
            "Pengeluaran    : Rp.30.000.000"
           ),
         ),
         ),
          
       SingleChildScrollView(
         child: Container(
             margin: EdgeInsets.fromLTRB(0, 30, 0,0),
          height: 220,
          width: 220,
         decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
          borderRadius: BorderRadius.circular(10)
         ),
        child:SingleChildScrollView(
          child: Column(children: [
             Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0,10),
            height: 48,
            width: 200,
           decoration: BoxDecoration(
            border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
            borderRadius: BorderRadius.circular(10)
           ),
           child: Center(
             child: Text(
              "Pemasukan    : Rp.30.000.000",
              style: TextStyle( fontSize: 12),
             ),
           ),
           ),
            Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0,10),
            height: 48,
            width: 200,
           decoration: BoxDecoration(
            border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
            borderRadius: BorderRadius.circular(10)
           ),
           child: Center(
             child: Text(
              "Pemasukan    : Rp.30.000.000",
              style: TextStyle( fontSize: 12),
             ),
           ),
           ),
            Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0,10),
            height: 48,
            width: 200,
           decoration: BoxDecoration(
            border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
            borderRadius: BorderRadius.circular(10)
           ),
           child: Center(
             child: Text(
              "Pemasukan    : Rp.30.000.000",
              style: TextStyle( fontSize: 12),
             ),
           ),
           ),
            Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0,10),
            height: 48,
            width: 200,
           decoration: BoxDecoration(
            border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
            borderRadius: BorderRadius.circular(10)
           ),
           child: Center(
             child: Text(
              "Pemasukan    : Rp.30.000.000",
              style: TextStyle( fontSize: 12),
             ),
           ),
           ),
            Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0,10),
            height: 48,
            width: 200,
           decoration: BoxDecoration(
            border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
            borderRadius: BorderRadius.circular(10)
           ),
           child: Center(
             child: Text(
              "Pemasukan    : Rp.30.000.000",
              style: TextStyle( fontSize: 12),
             ),
           ),
           ),
           ],
          ),
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