import 'package:ewstore/commons/drawer_common/Drawer_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(          
          child: ListView(
        children: <Widget>[
          DrawerTile(Icons.home, "Home", 0),
          DrawerTile(Icons.add, "Pedidos", 1),
          DrawerTile(Icons.shopping_cart, "Carrinho", 2)
        ],        
      ),
    );
  }
}