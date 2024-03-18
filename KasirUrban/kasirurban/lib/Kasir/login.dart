import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginKasir extends StatefulWidget {
  const LoginKasir({super.key});

  @override
  State<LoginKasir> createState() => _LoginKasirState();
}

class _LoginKasirState extends State<LoginKasir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 640,
            height: 832,
            decoration: BoxDecoration(
                border: Border.all(),
                image: DecorationImage(
                    image: AssetImage("assets/images/bgred3.jpeg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 500,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Image.asset("assets/images/jplogoblue.png"),
                ),
                Container(
                    height: 200,
                    width: 300,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(
                      "lorem ipsum blaaaaaaaaaaaaaaaaaaa",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: 640,
            height: 832,
            color: Colors.indigo,
            child: Column(
              children: [
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
