import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/screens/card_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
  
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);

class _ProfileScreenState extends State<ProfileScreen> {
  @override



  String person_name = 'Pedro Elias';
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Align(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment(0.0, -1.0),
                    image: new NetworkImage(
                        "https://static.wikia.nocookie.net/marvelmovies/images/0/0e/Endgame_Character_Posters_01.jpg/revision/latest?cb=20190326174327",
                        scale: 0.8),
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.fitWidth),
                color: Colors.transparent),
            width: screenWidth,
          ),
        ),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            height: screenHeight / 2,
            width: screenWidth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0.0, -0.8),
                  child: Container(
                    height: 120,
                    width: screenWidth - 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -1.0),
                          child: Text(
                            "Rank",
                            style: TextStyle(
                                fontFamily: 'MontserratM', fontSize: 30),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.8, -1.0),
                          child: Text(
                            "Score",
                            style: TextStyle(
                                fontFamily: 'MontserratM', fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.5, -0.2),
          child: Text(
            "Bem-vindo",
            style: TextStyle(
                fontFamily: 'MontserratM', color: Colors.white, fontSize: 20),
          ),
        ),
        Align(
          alignment: Alignment(-0.5, -0.10),
          child: Text(
            person_name,
            style: TextStyle(
                fontFamily: 'MontserratB', color: Colors.white, fontSize: 30),
          ),
        ),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: Container(            
            height: screenHeight / 2 - 150,
            width: screenWidth - 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _TicketCard(context);
              },
              padding: EdgeInsets.all(0.0),
              itemCount: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget _TicketCard(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //Firestore.instance.collection("Users").where("tipo",isEqualTo: 'Paciente').snapshots()
        stream: Firestore.instance
            .collection('Users')
            .document("7iiERIG56izN5Ftqy9I2")
            .collection("Tickets")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          double lenght =
              snapshot.data.documents.length.truncateToDouble() * 200;
          if (snapshot.hasError) return new Text('Error :${snapshot.error}');
          if (!snapshot.hasData) return Center(child: new Text('Não há dados'));
          if (snapshot.data == null)
            return Center(child: new CircularProgressIndicator());
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Row(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            default:
              return new SizedBox(
                height: lenght,
                child: ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                  return GestureDetector(
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: color_primary,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          new BoxShadow(color: Colors.transparent)
                        ]),
                        height: 80,
                        child: Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment(-0.6, 0.0),
                                child: Text(
                                  document['name'],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white, fontFamily: 'MontserratB'),
                                )),
                            Align(
                                alignment: Alignment(0.6, 0.0),
                                child: Icon(
                                  Icons.card_giftcard,
                                  size: 50,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }).toList()),
              );
          }
        });
  }
}
