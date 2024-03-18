import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            height: 200,
            width: 200,
            color: Colors.amberAccent,
          ),
        ],
      ),
    );
  }
}
