import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbankitchen/SuperAdmin/detailadmin.dart';
import 'package:urbankitchen/main.dart';

class Superadminhomepage extends StatelessWidget {
  const Superadminhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
      child: 
      
      Column( 
        children: [ SizedBox(
            height: 40,
          ),Column(children: [ Container(
          margin: EdgeInsets.only(left: 15),
          child: Image(image: AssetImage('assets/images/logo.png'),width: 200,height: 200,),
          
        ),Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(
            "Urban Kitchen",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          ), 
          )
          ],
          ),
         
          
          
          SizedBox(
            height: 30,
          ),

          
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 31),
                width: double.infinity,
                height: 160,
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
  Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),
SizedBox(width: 20,),
  Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),SizedBox(width: 20,),

                ],
                  ),
                  ),
                   Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 31),
                width: double.infinity,
                height: 160,
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                 Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),  Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),
                    ],
                  ),
                  ),

                   Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 31),
                width: double.infinity,
                height: 160,
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),  Stack(
            
  children: <Widget>[
    
    InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
        height: 150,
        width: 150,
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
              offset: Offset(0.0, -25.0),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(125, 25, 25, 1),
                  border: Border.all(color: Color.fromRGBO(125, 25, 25, 1), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Bandung",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-1.0, -15.0),
              child: Container(
                height: 40,
                width: 128,
                child: Text(
                  " JL. holis, caringin kota bandung, jawa barat",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1), ),
    
              ),
              child: Center(child: Text("Total : Rp. 30.000.000",style: TextStyle(fontSize: 11),)),
            ),
          ],
        ),
      ),
      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminSuper()));
                    },
    ),
  ],
),
                 
                    ],
                  ),
                  )
                ],
               ),
              )
            
              );
              
          
  }
}