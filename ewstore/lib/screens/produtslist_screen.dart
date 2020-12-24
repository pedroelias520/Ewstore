
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/commons/drawer_common/Drawer.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);
String username = "Pedro";
String level = '11';

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color_primary, color_secondary],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.8),
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment(-0.8, 0.7),
                    child: Row(
                      children: [
                        Text(
                          'Level',
                          style: TextStyle(
                              fontFamily: 'MontserratB', fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            level,
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'MontserratB'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0))),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0))),
                          ),
                        )
                      ],
                    ),
                  ),
                  width: screenWidth / 1.2,
                  height: screenHeight / 5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(254, 207, 162, 1),
                            Color.fromRGBO(251, 221, 205, 1)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)))),
            ),
            Align(
              alignment: Alignment(0.0, -0.9),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Olá, ",
                                    style: TextStyle(
                                        fontFamily: 'MontserratM',
                                        fontSize: 30),
                                  ),
                                  Text(
                                    username,
                                    style: TextStyle(
                                        fontFamily: 'MontserratB',
                                        fontSize: 30),
                                  )
                                ],
                              ),
                              Text(
                                "Melhor forma de comprar roupas",
                                style: TextStyle(fontFamily: 'MontserratM'),
                              )
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.person,
                        size: 80,
                      )
                    ],
                  ),
                  width: screenWidth / 1.2,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(35.0)))),
            ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child: Container(
                  height: screenHeight - (screenHeight / 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: ListView.builder(itemBuilder: (context, index) {
                    return _ProductsCard(context);
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget _ProductsCard(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('Produts')            
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('ERROR: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: Column(
                  children: [
                    Text(
                      'Carregando produtos',
                      style: TextStyle(fontFamily: 'MontserratB', fontSize: 25, color: Colors.white)
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              );
            default:              
              return new SizedBox(
                  height: screenHeight / 4,
                  child: ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          debugPrint(document['name'].toString());
                      return GestureDetector(                        
                        child: Card(                                                                              
                          margin: EdgeInsets.all(5),
                          color: Colors.white,
                          child: Container(
                            width: screenWidth / 3,
                            height: screenHeight / 8,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            document['image'].toString()),
                                        repeat: ImageRepeat.noRepeat,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Stack(
                                        children: [
                                          Align(
                                            child: AutoSizeText(
                                              document['name'].toString(),
                                              style: TextStyle(
                                                  fontFamily: 'MontserratB',
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Align(
                                            child: AutoSizeText(
                                                document['price'].toString()),
                                          ),
                                          RaisedButton(
                                            color: Color.fromRGBO(254, 207, 162, 1),
                                            onPressed: (){},
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)))                                            
                                        ],
                                      ),
                                    )),
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
