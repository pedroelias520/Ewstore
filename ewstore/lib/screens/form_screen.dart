import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);
final emailInput = TextEditingController();
final nameInput = TextEditingController();
final passwordInput = TextEditingController();
final passwordConfirmInput = TextEditingController();
final dateInput = TextEditingController();
final cepInput = TextEditingController();

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Align(),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: Container(
            height: screenHeight / 1.5,
            width: screenWidth - 20,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              color: Colors.white38,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(                
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          
                          Container(
                            width: screenWidth - 70,
                            child: TextFormField(
                              controller: nameInput,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: color_primary, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: color_secondary)),
                                  icon: Icon(Icons.person_pin),
                                  hintText: "Como quer ser conhecido",
                                  labelText: "Name"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          
                          Container(
                            width: screenWidth - 70,
                            child: TextFormField(
                              controller: nameInput,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: Colors.blue)),
                                  icon: Icon(Icons.email),
                                  hintText: "Qual o seu email?",
                                  labelText: "Email"),
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(
                      child: Column(
                        children: [
                          
                          Container(
                            width: screenWidth - 70,
                            child: TextFormField(
                              controller: nameInput,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: color_primary, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: color_secondary)),
                                  icon: Icon(Icons.lock),
                                  hintText: "Qual o seu email",
                                  labelText: "Senha"),
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(                     
                      child: Column(
                        children: [                        
                          Container(
                            width: screenWidth - 70,
                            child: TextFormField(
                              controller: nameInput,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: color_primary, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: color_secondary)),
                                  icon: Icon(Icons.date_range),
                                  hintText: "Sua senha",
                                  labelText: "Data de nascimento"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(                     
                      child: Column(
                        children: [                        
                          Container(
                            width: screenWidth - 70,
                            child: TextFormField(
                              controller: nameInput,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: color_primary, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(color: color_secondary)),
                                  icon: Icon(Icons.date_range),
                                  hintText: "CEP",
                                  labelText: "CEP"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
