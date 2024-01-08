import 'package:flutter/material.dart';

class WaitPage  extends StatelessWidget {
  const WaitPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
                    margin: EdgeInsets.only(left: 15, right: 25),
                    child: Image.asset('assets/images/logo.png'),
                    width: 425,
                    height: 325,
                  ),
                  Text("Mohon Tunggu")
        ],
      ),
    );
  }
}