import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbankitchen/halamantotal/totalharian.dart';

class AdminSuper extends StatelessWidget {
  const AdminSuper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Admin Urban Kitchen",
          style: TextStyle(fontSize: 18,),),
        ),
        
      ),
body: SingleChildScrollView(
   child: Column(
  children: [ 
Stack(
  children:  [
Stack(
  children: [
    Container(
      margin: EdgeInsets.fromLTRB(85, 20, 0, 48),
      height: 220,
      width: 190,  
          decoration: BoxDecoration(
            color: Color.fromRGBO(125, 25, 25, 1),
        border: Border.all(width: 1, color: Color.fromRGBO(125, 25, 25, 1)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 1),
              color: Colors.black,
            ),]
      ),
    ),
  Column(
    children: [
       
     Container(
       margin: EdgeInsets.fromLTRB(120, 30, 84, 10),
child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(image: AssetImage('assets/images/profileadmin.jpg'),width: 120,height: 120,),
          )
     ),
     Container(
      margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
      child: Text("Asep Stroberi",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),)),
      Positioned(
        
        child: 
        
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 84, 10),
          width: 60,
          child: Text("Hapus Admin",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13,color: Colors.white,),),
        ),
      
        ),
        
        
        
    ],
  ),
          Container(
          margin: EdgeInsets.fromLTRB(210, 195, 84, 10),
          width: 60,
          child: Text("Tambah Admin",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13,color: Color.fromARGB(255, 255, 255, 255),),),
        ),
  
  ],
),
 Container(
  
  margin:  EdgeInsets.fromLTRB(44, 290, 44, 48),
  width:  double.infinity,
  height:  246,
  child:  
Stack(
  children: <Widget>[
    
    InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        height: 240,
        width: 270,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(color: Color.fromRGBO(125, 25, 25, 1),width: 1),
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 1),
              color: Colors.black,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Transform.translate(
              offset: Offset(0.0, -35.0),
              child: Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-5.0, -25.0),
              child: Container(
                height: 40,
                width: 228,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000")),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TotalHarian()));
                    },
    ),
  ],
),)
],

   ),],
),),
    );
  }
}