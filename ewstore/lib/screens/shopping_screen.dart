import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ewstore/screens/card_screen.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

Color color_primary = Color.fromRGBO(83, 120, 149, 1);
Color color_secondary = Color.fromRGBO(31, 59, 100, 1);
Color color_thirdary = Color.fromRGBO(254, 254, 254, 1);

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int xp_total = 300;
    double points = 150;
    return Stack(
      children: [
        Align(
          alignment: Alignment(0.0, -0.8),
          child: Container(
            width: screenWidth - 50,
            height: screenHeight / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(254, 207, 162, 1),
                  Color.fromRGBO(251, 221, 205, 1)
                ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment(-0.7, -0.7),
                    child: Text(
                      "Seu carrinho",
                      style: TextStyle(fontFamily: 'MontserratB', fontSize: 30),
                    )),
                Align(
                    alignment: Alignment(-0.7, 0.0),
                    child: Text("Total:",
                        style: TextStyle(
                            fontFamily: 'MontserratM', fontSize: 18))),
                Align(
                    alignment: Alignment(-0.1, 0.0),
                    child: Text("${xp_total}",
                        style: TextStyle(
                            fontFamily: 'MontserratB', fontSize: 18))),
                Align(
                    alignment: Alignment(-0.7, 0.5),
                    child: Text("Pontos:",
                        style: TextStyle(
                            fontFamily: 'MontserratM', fontSize: 18))),
                Align(
                    alignment: Alignment(-0.1, 0.5),
                    child: Text("${points} XP",
                        style: TextStyle(
                            fontFamily: 'MontserratB', fontSize: 18))),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0,0.6),
                  child: Container(
                    height: screenHeight/1.6,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.blue, width: 2.0)
            ),
            child: DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.1,
              maxChildSize: 0.6,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 2.0)),
                      height: screenHeight / 2 - 30,
                      width: screenWidth - 50,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _ProdutcCart(context);
                        },
                        padding: EdgeInsets.all(2.0),
                        itemCount: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 20),
                      child: Container(
                        width: screenWidth / 1.5,
                        child: Divider(
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.8, 0.0),
                      child: Stack(
                        children: [
                          Container(
                            child: Text(
                              "Formas de Pagamento",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: "MontserratB"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Cartão de Crédito"),
                            leading: Radio(
                                value: null, groupValue: null, onChanged: null),
                          ),
                          ListTile(
                            title: Text("Na entrega"),
                            leading: Radio(
                                value: null, groupValue: null, onChanged: null),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Cartão de Crédito"),
                            leading: Radio(
                                value: null, groupValue: null, onChanged: null),
                          ),
                          ListTile(
                            title: Text("Na entrega"),
                            leading: Radio(
                                value: null, groupValue: null, onChanged: null),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: Container(
            height: 50,
            width: screenWidth,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      "Finalizar Compra",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "MontserratB",
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Icon(
                      Icons.verified,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              onPressed: () {},
              color: color_primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ],
    );
  }

  Widget _ProdutcCart(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //Firestore.instance.collection("Users").where("tipo",isEqualTo: 'Paciente').snapshots()
        stream: Firestore.instance
            .collection('Users')
            .document()
            .collection("Card")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          double lenght =
              snapshot.data.documents.length.truncateToDouble() * 200;
          if (snapshot.hasError) return new Text('Error :${snapshot.error}');
          if (!snapshot.hasData) return Center(child: new Text('Não há dados'));
          if (snapshot.data == null)
            return Center(child: new Text('Espere ...'));
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
                      margin: EdgeInsets.all(5),
                      color: Color.fromRGBO(62, 57, 98, 1),
                      child: Container(
                        height: 120,
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new NetworkImage(
                                        document['image'].toString()),
                                    repeat: ImageRepeat.noRepeat,
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              width: 80,
                              height: 80,
                              margin: EdgeInsets.all(10.0),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      document['price'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'UbuntuM',
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      document['qtd'],
                                      style: TextStyle(
                                          fontFamily: 'UbuntuM',
                                          color:
                                              Color.fromRGBO(124, 124, 188, 1)),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      document['size'],
                                      style: TextStyle(
                                        fontFamily: 'UbuntuM',
                                        color: Color.fromRGBO(124, 124, 188, 1),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      document['type'],
                                      style: TextStyle(
                                        fontFamily: 'UbuntuM',
                                        color: Color.fromRGBO(124, 124, 188, 1),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      document['xp'],
                                      style: TextStyle(
                                        fontFamily: 'UbuntuM',
                                        color: Color.fromRGBO(124, 124, 188, 1),
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                            ),
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
