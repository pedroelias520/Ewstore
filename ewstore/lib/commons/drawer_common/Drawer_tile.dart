import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  DrawerTile(this.iconData, this.title, this.page);

  final int page;
  final String title;
  final IconData iconData;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){debugPrint("Toquei no botão");},
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding (
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Icon(iconData, size: 40, color: Color.fromRGBO(255, 135, 151, 1)),            
            ),
            Text (title, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}