

import 'package:ewstore/commons/drawer_common/Drawer.dart' as prefix0;
import 'package:ewstore/screens/about_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
   
    Color color_primary = Color.fromRGBO(255, 198, 206, 1);
    Color color_secondary = Color.fromRGBO(255, 222, 227, 1);
    Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[                
        Scaffold(
          body: AboutScreen(),
          drawer: prefix0.CustomDrawer(),
        )
      ],
    );
  }
}