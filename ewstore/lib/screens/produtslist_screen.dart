import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/commons/drawer_common/Drawer.dart';
import 'package:ewstore/models/user_model.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);
String username = "Pedro";
String level = '11';
int currentUserPoints = 1194;
Map<String,dynamic> currentUserLevel =  Map();

class _ProductListState extends State<ProductList> {
  Widget BackgoundColor() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(255, 135, 151, 1),
          Color.fromRGBO(255, 176, 186, 1)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ScopedModelDescendant<UserModel>(builder: (context, builder, model) {
      if(model.isLodding){
          return Center(child: CircularProgressIndicator()); 
      }
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color_primary, color_secondary],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
            child: Scaffold(
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(80.0))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80.0))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)))),
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
                                      style:
                                          TextStyle(fontFamily: 'MontserratM'),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)))),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.0),
                    child: Container(
                        height: screenHeight - (screenHeight / 3),
                        child: _ProductsCard(context)),
                  )
                ],
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
              )
            ],
          ),
        ],
      );
    });
  }
}

Widget _ProductsCard(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  List<DocumentSnapshot> ProductList;
  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Produts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('ERROR: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: Column(
                children: [CircularProgressIndicator()],
              ),
            );
          default:
            ProductList = snapshot.data.documents;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 1),
                itemCount: ProductList.length,
                padding: EdgeInsets.only(left: 50, right: 50, top: 35),
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Container(
                                height: screenHeight / 4,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 200),
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment(-1.5, 0.0),
                                        child: AutoSizeText(
                                          ProductList[index]['name'],
                                          style: TextStyle(
                                              fontFamily: 'MontserratB'),
                                          maxLines: 2,
                                          wrapWords: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment(-1.0, 0.0),
                                              child: Text(
                                                "${ProductList[index]['price']} RS",
                                                style: TextStyle(
                                                    fontFamily: 'MontserratM'),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(1.0, 0.0),
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                child: RaisedButton(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                80.0)),
                                                    child: Text(
                                                      '+',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'MontserratM',
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    color: Color.fromRGBO(
                                                        254, 207, 162, 1),
                                                    onPressed: () {}),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.0, -5.8),
                                child: Container(
                                    height: 120,
                                    width: 120,
                                    child: Image.network(
                                      ProductList[index]['image'],
                                      scale: 1.0,
                                    )),
                              )
                            ],
                          ),
                        )),
                  );
                });
        }
      });
}
