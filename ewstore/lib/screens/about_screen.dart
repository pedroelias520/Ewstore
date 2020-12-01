import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override

  Widget BackgoundColor() => Container(
    decoration:BoxDecoration(
      gradient: LinearGradient(colors: [Color.fromRGBO(255, 135, 151,1),Color.fromRGBO(255, 176, 186, 1)],begin: Alignment.topRight, end: Alignment.bottomLeft)
    ),
  );

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgoundColor(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Bem vindo"),
                centerTitle: true,                
              ),
            )
          ],
        ),        
      ],
    );
  }
}