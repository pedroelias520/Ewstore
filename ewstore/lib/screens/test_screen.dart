import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


Map<String, dynamic> levels = Map();
class TestScreen extends StatefulWidget {
  @override
  
  _TestScreenState createState() => _TestScreenState();  
}

Future getLevels() async {
  debugPrint("===========================");
  double firstLevel = 7;
  for(int i=0;i<31;i++){
    firstLevel = firstLevel * 1.2;   
    levels['Level ${i}'] = (firstLevel).toStringAsFixed(0);  
  }
  //var level = await Firestore.instance.collection("Commons").document("Levels").get();
  Firestore.instance.collection("Commons").document("Levels").setData(levels);
  //levels = level.data; 
  //debugPrint(levels['Level 21'].toString());
  debugPrint("Data updated");
  debugPrint("===========================");  
}

class _TestScreenState extends State<TestScreen> {
  @override  
  
  Widget build(BuildContext context) {
    getLevels();
    return Container(
      child: Text(levels['Level 21'].toString()),
    );
  }
}



