import 'package:flutter/material.dart';
import 'package:urbankitchen/AdminCabang/ProfilAdminCabang.dart';
import 'package:urbankitchen/AdminCabang/UpdateMakanan.dart';
import 'package:urbankitchen/AdminCabang/UpdateMinuman.dart';

class UpdateCemilan extends StatelessWidget {
  const UpdateCemilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Padding(
          padding: EdgeInsets.fromLTRB(60,0,0,0),
          child: Text("Cemilan",style:TextStyle(color: Colors.white) ),
        ),
        
        backgroundColor: Color.fromRGBO(125, 25, 25, 1),
         leading: BackButton(
          
          onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminCabang()), (route) => false);},
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
                child: Center(child: Text("Makanan",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateMakanan()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Minuman",style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateMinuman()));
                    },
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(15,0,0,0),
            child: InkWell(
              child: Container(
                height: 48 ,
                width: 100,
                child: Center(child: Text("Cemilan",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                decoration: BoxDecoration(
            border: Border.all(width: 2,color: Color.fromRGBO(125, 25, 25, 1) ),
            borderRadius: BorderRadius.circular(10),
            
               color: Color.fromRGBO(125, 25, 25, 1),
                ),
                
              ),
               onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateCemilan()));
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
          "Senin,17-12-1712"
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
    child: Text("Update Bahan Cemilan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
   ),
    
          
        Container(
             margin: EdgeInsets.fromLTRB(0, 30, 0,0),
          height: 240,
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
           child: Row(
            
             children: [ Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Text(
                
                "Pemasukan    : Rp.30.000.000",
                style: TextStyle( fontSize: 10),
               ),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline_sharp))
          ],
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
           child: Row(
            
             children: [ Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Text(
                
                "Pemasukan    : Rp.30.000.000",
                style: TextStyle( fontSize: 10),
               ),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline_sharp))
          ],
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
           child: Row(
            
             children: [ Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Text(
                
                "Pemasukan    : Rp.30.000.000",
                style: TextStyle( fontSize: 10),
               ),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline_sharp))
          ],
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
           child: Row(
            
             children: [ Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Text(
                
                "Pemasukan    : Rp.30.000.000",
                style: TextStyle( fontSize: 10),
               ),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline_sharp))
          ],
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
           child: Row(
            
             children: [ Padding(
               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
               child: Text(
                
                "Pemasukan    : Rp.30.000.000",
                style: TextStyle( fontSize: 10),
               ),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline_sharp))
          ],
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
           child: Container(
            
           child: 
             IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_sharp))
          
           ),
           
           ),
           ],
          ),
        ),
      
         ),
        
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          "Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            backgroundColor: Color.fromRGBO(125, 25, 25, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style:
                        
                            TextButton.styleFrom(primary: Color.fromRGBO(125, 25, 25, 1),),
                        onPressed: () {
                            Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminCabang()));
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
     
      ],
     ),
        
       ),
                  ], 
                  
        ),
      ),
    );
  }
}