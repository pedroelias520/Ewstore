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
          ],
        ),
      ),
    );
  }
}
