import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:ewstore/screens/login_screen.dart';
import 'package:ewstore/screens/produtslist_screen.dart';
import 'package:flutter/material.dart';
import 'package:ewstore/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';


void main() {
  
  runApp(MyApp());   
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
          child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(        
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}



