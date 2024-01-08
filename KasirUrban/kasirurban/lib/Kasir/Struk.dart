import 'package:flutter/material.dart';

class Struk extends StatefulWidget {
  const Struk({super.key});

  @override
  State<Struk> createState() => _StrukState();
}

class _StrukState extends State<Struk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                 
                    Container(
                    
                            width: 220,
                            height: 220,
                            child:
                            Image(image: AssetImage('assets/images/logo.png'),),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 200,bottom: 20),
                                child: Container(
                                  height: 70,
                                  child: Text("Urban Kitchen",style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                              
                                  ),),
                                ),
                              ),
                             Padding(
                               padding: EdgeInsets.only(left: 200),
                               child: Transform.translate(
                                           offset: Offset(-1.0, -15.0),
                                           child: Container(
                                             height: 40,
                                           width: 400,
                                             child: Text(
                                               " JL. holis, caringin kota bandung, jawa barat",
                                               textAlign: TextAlign.center,
                                               style: TextStyle(color: Colors.black, fontSize: 20),
                                             ),
                                           ),
                                         ),
                             ),
                            ],
                          )
                 
              ],
            ),
            Container(
              height: 1,
              width: 1150,
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.black)
              ),
            ),
             Padding(
               padding: EdgeInsets.only(top: 5),
               child: Container(
                height: 1,
                width: 1150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                ),
                         ),
             ),
             Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Waktu Pemesanan",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 20),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 550),
                     child: Container(
                      child: Text("16:50AM",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                ],
               ),
             ), Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Nomor Meja",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 100),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 550),
                     child: Container(
                      child: Text("A5",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                   
                ],
               ),
             ),
              Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Nama Pelanggan",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 40),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 550),
                     child: Container(
                      child: Text("Asep Stroberi",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                ],
               ),
             ),
               Padding(
                 padding: EdgeInsets.only(top: 30),
                 child: Container(
                             height: 1,
                             width: 1150,
                             decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                             ),
                           ),
               ),
             Padding(
               padding: EdgeInsets.only(top: 5),
               child: Container(
                height: 1,
                width: 1150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                ),
                         ),
             ),
              Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Pancake Urban",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 320),
                     child: Container(
                      child: Text("3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 290),
                     child: Container(
                      child: Text("Rp. 120.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                ],
               ),
             ),
              Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Ayam Urban",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 355),
                     child: Container(
                      child: Text("3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 290),
                     child: Container(
                      child: Text("Rp. 240.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                ],
               ),
             ),
              Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Urban's Iced Coffee",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 255),
                     child: Container(
                      child: Text("3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 290),
                     child: Container(
                      child: Text("Rp. 360.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                ],
               ),
             ),
              Padding(
                 padding: EdgeInsets.only(top: 30),
                 child: Container(
                             height: 1,
                             width: 1150,
                             decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                             ),
                           ),
               ),
             Padding(
               padding: EdgeInsets.only(top: 5),
               child: Container(
                height: 1,
                width: 1150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                ),
                         ),
             ),
             Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Total",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 100),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 350),
                     child: Container(
                      child: Text("9",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                    Padding(
                     padding: EdgeInsets.only(left: 290),
                     child: Container(
                      child: Text("Rp. 999.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                   
                ],
               ),
             ),
               Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Cash",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 100),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
               
                    Padding(
                     padding: EdgeInsets.only(left: 670),
                     child: Container(
                      child: Text("Rp. 999.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                   
                ],
               ),
             ),
              Padding(
               padding:EdgeInsets.only(left: 100,top: 50),
               child: Row(
                children: [
                  Container(
                    child: Text("Change",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: 55),
                     child: Container(
                      child: Text(":",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
               
                    Padding(
                     padding: EdgeInsets.only(left: 670),
                     child: Container(
                      child: Text("Rp. 1.000",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                                     ),
                   ),
                   
                ],
               ),
             ),
             Padding(
                 padding: EdgeInsets.only(top: 30),
                 child: Container(
                             height: 1,
                             width: 1150,
                             decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                             ),
                           ),
               ),
             Padding(
               padding: EdgeInsets.only(top: 5),
               child: Container(
                height: 1,
                width: 1150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black)
                ),
                         ),
             ),
              Padding(
                     padding: EdgeInsets.only(top: 20,bottom: 20),
                     child: Container(
                      child: Center(child: Text("Terima Kasih Telah Berkunjung",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),)),
                                     ),
                   ),
          ],
        ),
      ),
    );
  }
}