import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 120, 149, 1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(83, 120, 149, 1).withOpacity(0.4),
                        BlendMode.dstATop),
                    image: AssetImage('lib/assets/images/womens.png'),
                    fit: BoxFit.fill)),
          ),
          Align(
            alignment: Alignment(-0.7, -0.9),
            child: Text(
              "Welcome",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'MontserratB'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 150),
            child: Column(
              children: [
                Text(
                  "E",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 150,
                      fontFamily: 'CreamCake'),
                ),
                Text(
                  "Ewstore",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: 'CreamCake'),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: Container(
              width: screenWidth,
              height: (screenHeight / 2) + 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment(-0.6, 1.0),
                    child: Container(
                      child: Text(
                        'Log in',
                        style:
                            TextStyle(fontFamily: 'MontserratB', fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: screenWidth / 2 + 120,
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email,
                            color: Color.fromRGBO(83, 120, 149, 1)),
                        labelText: "Login",
                        enabled: true,
                        focusColor: Color.fromRGBO(83, 120, 149, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: screenWidth / 2 + 120,
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Color.fromRGBO(83, 120, 149, 1),
                        ),
                        labelText: "Senha",
                        enabled: true,
                        focusColor: Color.fromRGBO(83, 120, 149, 1),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu a senha',
                      style: TextStyle(fontFamily: 'MontserratB'),
                    ),
                  ),
                  Container(
                    width: screenWidth / 2 + 120,
                    child: RaisedButton(
                      color: Color.fromRGBO(83, 120, 149, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontserratB',
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta?',
                        style: TextStyle(fontFamily: 'MontserratM'),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Crie uma',
                            style: TextStyle(
                                fontFamily: 'MonteserratM',
                                color: Color.fromRGBO(83, 120, 149, 1)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
