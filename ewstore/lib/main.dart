import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:ewstore/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  try{
    Firestore.instance.collection('Teste').add({'teste':'teste'});
  }catch(e){
    debugPrint("===========================");
    debugPrint('Error to add on Firestore');
    debugPrint(e.toString());
    debugPrint("===========================");
  }


} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


