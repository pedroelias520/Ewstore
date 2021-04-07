import 'dart:io';
import 'dart:ui';
import 'package:ewstore/screens/produtslist_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ewstore/screens/card_screen.dart';
import 'package:ewstore/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Color color_primary = Color.fromRGBO(83, 120, 149, 1);
  Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
  Color color_thirdary = Color.fromRGBO(254, 207, 161, 1);
  final emailInput = TextEditingController();
  final nameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final passwordConfirmInput = TextEditingController();
  final dateInput = TextEditingController();
  final cepInput = TextEditingController();
  File _image;

  Future getImage(verification) async {
    try {
      if (verification) {
        var img = await ImagePicker.pickImage(source: ImageSource.gallery);
        await setState(() {
          _image = img;
        });
        return _image;
      } else {
        var img = await ImagePicker.pickImage(source: ImageSource.camera);
        await setState(() {
          _image = img;
        });
        return _image;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: color_primary),
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0.0, -1.0),
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Selecionar Foto",
                      style: TextStyle(
                          color: Color.fromRGBO(130, 156, 176, 1),
                          fontFamily: 'MontserratB',
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromRGBO(130, 156, 176, 1), width: 2.5)),
                                                                
                          child: Container(
                            margin: EdgeInsets.all(30),
                            width: screenWidth / 3,
                            height: screenWidth / 3,
                            decoration: BoxDecoration(                                
                                image: DecorationImage(
                                    image: _image != null
                                        ? FileImage(
                                            _image) //Este Tipo não pode ser declarado com File.image pois há um comflito de tipos
                                        : AssetImage(
                                            "lib/assets/images/person.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                getImage(true);
              },
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: Container(
              height: screenHeight / 1.5,
              width: screenWidth,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  color: Color.fromRGBO(254, 207, 161, 1),
                  child: DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: color_secondary)),
                                    icon: Icon(
                                      Icons.person_pin,
                                      color: Colors.black,
                                    ),
                                    hintText: "Como quer ser conhecido",
                                    labelText: "Nome"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                    hintText: "Qual o seu email?",
                                    labelText: "Email"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: color_secondary)),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    hintText: "Escolha uma senha",
                                    labelText: "Senha"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: color_secondary)),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),                                    
                                    labelText: "Repita sua senha"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: color_secondary)),
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),                                    
                                    labelText: "Data de nascimento"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              width: screenWidth - 70,
                              child: TextFormField(
                                controller: nameInput,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide:
                                            BorderSide(color: color_secondary)),
                                    icon: Icon(
                                      Icons.vpn_key_sharp,
                                      color: Colors.black,
                                    ),
                                    hintText: "CEP",
                                    labelText: "CEP"),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 100,
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              margin: EdgeInsets.all(10),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                color: color_primary,
                                child: Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                      fontFamily: 'MontserratB',
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
          )
        ],
      ),
    );
  }
}
