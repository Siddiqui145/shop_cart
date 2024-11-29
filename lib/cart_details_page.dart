import 'package:flutter/material.dart';

class CartDetailsPage extends StatefulWidget {
  const CartDetailsPage({super.key});

  @override
  State<CartDetailsPage> createState() => _CartDetailsPageState();
}

class _CartDetailsPageState extends State<CartDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page", style: Theme.of(context).textTheme.titleLarge,),
      centerTitle: true,
      backgroundColor:Colors.pink.shade100),
    );
  }
}