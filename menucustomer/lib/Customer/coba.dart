import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menucustomer/Customer/meja.dart';
import 'package:menucustomer/Customer/menumakanan.dart';

void main() {
  runApp(coba());
}

class coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: MenuList(),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: () {
        if (isExpanded) {
          setState(() {
            isExpanded = false;
          });
        }
      },
      
    child: SingleChildScrollView(
        child: Stack(
          children:[ Column(
            children: [ Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(500, 10, 350, 0),
                child: Text("Urban Kitchen",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IconButton(onPressed: (){
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MenuMakanan()));
                }, icon: Icon(Icons.shopping_bag_outlined,size: 50,)),
              )
            ],
          ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(35, 50, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
                      
                        color: Color.fromRGBO(125, 25, 25, 1)
                      ),
                      height: 60,
                      width: 400,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                        child: Text("Makanan",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),)),
                    ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MenuMakanan()));
                      },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
                      
                        color: Color.fromRGBO(125, 25, 25, 1)
                      ),
                      height: 60,
                      width: 400,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(125, 8, 0, 0),
                        child: Text("Minuman",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),)),
                    ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MenuList()));
                      },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 50, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color.fromRGBO(125, 25, 25, 1)),
                      
                        color: Color.fromRGBO(125, 25, 25, 1)
                      ),
                      height: 60,
                      width: 400,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(170  , 8, 0, 0),
                        child: Text("Meja",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),)),
                    ),
                     onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Meja()));
                      },
                  ),
                ],
              ),
             Padding(
                padding: EdgeInsets.fromLTRB(70, 20, 70, 30),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,),
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                
                 itemBuilder: (BuildContext ctx,index){
                  return  InkWell(
                    
                    child: Stack(
                      children:[ GestureDetector(
                        onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
                        child: Container(
                          
                          width: 220,
                          height: 286,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1,color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                 blurRadius: 3,
                        offset: Offset(1, 2),
                        spreadRadius: 1,
                        color: Colors.black,
                              ), 
                            ]
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                child:
                                Image(image: AssetImage('assets/images/kopipanas.png'),),
                              ),
                              Container(
                                child: Text("Coffee",style: GoogleFonts.getFont(
                                  'Kavoon',
                                fontSize: 20,
                                )),
                              ),
                               Container(
                                child: Text("Rp. 50.000",style: GoogleFonts.getFont(
                                  'Inter',
                                fontSize: 20,
                                )),
                              ),
                            
                            ],
                          ),
                        ),
                      ),  ]
                      
                    ),
                     
                  );
                }),
              ), 
            
          
            ] 
          ),
           AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              
              left: 0,
              bottom: isExpanded ? 0 : -MediaQuery.of(context).size.height * 3 / 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 4,
                color: Color.fromRGBO(125, 25, 25, 1),
                child: Column(
                 children: [
                   Container(
                                width: 350,
                                height: 350,
                                child:
                                Image(image: AssetImage('assets/images/kopipanas.png'),),
                              ),
                               Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 70),
                                child: Text("Coffee",style: GoogleFonts.getFont(
                                  'Kavoon',
                                fontSize: 50,
                                color: Colors.white
                                )),
                              ),
                               Container(
                                 alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 70,top: 35),
                                child: Text("Coffee + Sendok",style: GoogleFonts.getFont(
                                  'Inter',
                                fontSize: 30,
                                 color: Colors.white
                                )),
                              ),
                               Container(
                                 alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 70,top: 35),
                                child: Text("Rp. 115.000",style: GoogleFonts.getFont(
                                  'Inter',
                                fontSize: 30,
                                 color: Colors.white
                                )),
                              ),
                 ],
                 
                ),
              ),
            ),
          ]
        ),

      ),
      
    );
  }
}