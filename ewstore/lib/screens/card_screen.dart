import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/commons/drawer_common/Drawer.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);
Color base_color = Color.fromRGBO(254, 207, 161, 1);

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String name = "Vestido Vermelho com bolinhas";
    String descricao =
        "Um vestido vermelho e bonito para ocasiões simples e bem barato para quem quer ficar estiloso sem gastar muito";
    String image =
        "https://firebasestorage.googleapis.com/v0/b/ewstore-75a23.appspot.com/o/483-4833177_primary-shirt-polyvore-moodboard-filler-pretty-outfits-clothes.png?alt=media&token=df0954c8-1019-4105-b9e3-1bc798f0bf7f";
    List<String> tamanho = ['P', 'M', 'G', 'GG'];
    bool liked = true;
    String xp = "1000";
    double price = 15.00;

    void _toogleLike() {
      setState(() {
        if (liked) {
          liked = false;
          debugPrint("${liked}: False");
        } else {
          liked = true;
          debugPrint("${liked}: Verdadeiro");
        }
      });
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
              body: Align(
                alignment: Alignment(0.0, 1.0),
                child: Container(
                  height: screenHeight / 2 + 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      color: base_color),
                  child: Stack(
                    children: [                                    
                      Align(
                        alignment: Alignment(0.0, -2.0),
                        child: Container(
                          width: screenWidth,
                          height: screenWidth - 100,
                          child: Image.network(image),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 0.0),
                        child: Container(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(-0.3, -0.2),
                                child: Container(
                                  width: screenWidth - 60,
                                  height: 70,
                                  child: AutoSizeText(
                                    name,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'MontserratB',
                                        fontSize: 25,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.3, 0.1),
                                child: Container(
                                  width: screenWidth - 60,
                                  height: 50,
                                  child: AutoSizeText(
                                    descricao,
                                    maxLines: 5,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: 'MontserratM',
                                        fontSize: 16,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Align(
                          alignment: Alignment(0.0, 0.38),
                          child: Row(
                            children: [
                              for (var i in tamanho)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0.0, right: 15.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      width: 45,
                                      height: 45,
                                      child: FlatButton(
                                          onPressed: () {},
                                          child: AutoSizeText(
                                            "${i}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'MontserratB'),
                                          ))),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment(0.8, 0.35),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: _toogleLike,
                            icon: (liked
                                ? Icon(
                                    Icons.favorite_rounded,
                                    size: 40,
                                    color: Colors.black54,
                                  )
                                : Icon(
                                    Icons.favorite_border_rounded,
                                    size: 40,
                                    color: Colors.black54,
                                  )),
                          )),
                      Align(
                        alignment: Alignment(1.0, 1.0),
                        child: Container(
                          height: 70,
                          width: screenWidth / 2,
                          decoration: BoxDecoration(
                              color: color_primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0))),
                          child: Center(
                            child: FlatButton(
                              child: AutoSizeText(
                                "Adicionar ao carrinho",
                                style: TextStyle(
                                    fontFamily: "MontserratM", color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.7, 0.68),
                        child: Text(
                          "+ ${xp} xp",
                          style: TextStyle(
                              fontFamily: "MontserratB",
                              fontSize: 20,
                              color: Colors.black54),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.75, 0.95),
                        child: Text(
                          "${price.toString()} RS",
                          style: TextStyle(
                              fontFamily: "MontserratB",
                              fontSize: 35,
                              color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ),
              )),
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
  }
}
