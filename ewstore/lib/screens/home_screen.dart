
import 'package:ewstore/commons/drawer_common/Drawer.dart' as prefix0;
import 'package:ewstore/screens/about_screen.dart';
import 'package:ewstore/screens/card_screen.dart';
import 'package:ewstore/screens/form_screen.dart';
import 'package:ewstore/screens/login_screen.dart';
import 'package:ewstore/screens/produtslist_screen.dart';
import 'package:ewstore/screens/profile_screen.dart';
import 'package:ewstore/screens/shopping_screen.dart';
import 'package:ewstore/screens/test_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
    
  _HomeScreenState createState() => _HomeScreenState();
}
    Color color_primary = Color.fromRGBO(83, 120, 149, 1);
    Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
    Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageView(                       
      children: <Widget>[         
        Scaffold(          
          drawer: prefix0.CustomDrawer(),
          body: ProfileScreen(),
        ),
         Scaffold(          
          drawer: prefix0.CustomDrawer(),
          body: FormScreen(),
        ),                
        Scaffold(          
          drawer: prefix0.CustomDrawer(),
          body: ProductList(),
        ),                                 
        Scaffold(          
          drawer: prefix0.CustomDrawer(),
          body: ShoppingCart(),          
        ), 
         Scaffold(          
          drawer: prefix0.CustomDrawer(),
          body: TestScreen(),
        ),       
      ],
    );
  }
}