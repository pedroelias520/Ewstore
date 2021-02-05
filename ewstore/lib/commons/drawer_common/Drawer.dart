import 'package:ewstore/commons/drawer_common/Drawer_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(          
          child: ListView(
        children: <Widget>[
          DrawerTile(Icons.home_outlined, "Home", 0),
          DrawerTile(Icons.shopping_bag_outlined, "Produtos", 1),
          DrawerTile(Icons.shopping_cart_outlined, "Carrinho de compras", 2),
          DrawerTile(Icons.person_outline_outlined, "Perfil", 2)
        ],        
      ),
    );
  }
}