import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 120, 149, 1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(-0.7,-0.9),
            child: Text(
              "Bem-vindo",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Align(
            alignment: Alignment(0.0,0.3),
              child: Column(
                children: [
                  Text(
                    "E",
                    style: TextStyle(color: Colors.white, fontSize: 120, fontFamily: 'Arial'),
                  ),
                  Text(
                    "Ewstore",
                    style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Arial'),
                  )
                ],
              ),
            ),
          Align(
            alignment: Alignment(0.0,1.0),
            child: Container(
              width: screenWidth,
              height: (screenHeight / 2)  + 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(),
            ),
          )
        ],
      ),
    );
  }
}
