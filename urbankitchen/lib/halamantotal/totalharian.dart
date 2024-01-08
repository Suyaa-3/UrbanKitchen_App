import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/detailtotalharian.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/pemasukanharian.dart';
import 'package:urbankitchen/halamantotal/detailtotal/harian/pengeluaranharian.dart';
import 'package:urbankitchen/halamantotal/totalbulanan.dart';
import 'package:urbankitchen/halamantotal/totalmingguan.dart';

class TotalHarian extends StatefulWidget {
  const TotalHarian ({Key? key});

  @override
  State<TotalHarian> createState() => _TotalHarianState();
}

class _TotalHarianState extends State<TotalHarian> {
  late int pemasukan =0;
  late int pengeluaran=1;
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
  
  void initState(){
    super.initState();
    fetchData();
   
  }
  

 
 

  Future<void> fetchData() async {
    try{
   DateTime startDate = DateTime(tanggal.year, tanggal.month, tanggal.day);
    DateTime endDate = startDate.add(Duration(days: 1)); 

    print('Fetching data for date: $startDate');

        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('laporan').where('tanggal', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('tanggal', isLessThan: Timestamp.fromDate(endDate))
        .get();

      if(querySnapshot.docs.isNotEmpty){
         var documentSnapshot = querySnapshot.docs.first;
       
        setState(() {
          pemasukan = documentSnapshot['pemasukan'];
          pengeluaran = documentSnapshot['pengeluaran'];
          
          print('Pemasukan: $pemasukan, Pengeluaran: $pengeluaran');
        });
      } else{
      pemasukan = 0;
      pengeluaran=0;
      }
    } catch(error){
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
          padding: EdgeInsets.fromLTRB(60,0,0,0),
          child: Text("Bandung",style:TextStyle(color: Colors.white) ),
        ),
        
        backgroundColor: Color.fromRGBO(125, 25, 25, 1),
         leading: BackButton(
          
          color: Color(0xFFF9F6EE),
        ),

      ),
      body: 
      
       SingleChildScrollView(
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
       child: InkWell(
          onTap: () {
      _selectDate(context);
    },
         child: Center(
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              SizedBox(width: 20,),
               Text(
       
          "${_dateController.text}", 
               ),
               
               Icon(Icons.calendar_today_rounded)
             ],
           ),
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
    child: Text("Laporan Keuangan Harian",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
            "Pemasukan    : Rp.$pemasukan"
           ),
         ),
         ),
          onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PemasukanHarian()));
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
            "Pengeluaran    : Rp.$pengeluaran"
           ),
         ),
         ),
          onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PengeluaranHarian()));
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
                          MaterialPageRoute(builder: (context) => DetailTotalHarian()));
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
          "Hasil Bersih   : Rp.$HasilBersih"
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