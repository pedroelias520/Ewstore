import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.yellow),
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
}
