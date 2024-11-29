import 'package:flutter/material.dart';
import 'package:shop_cart/cart_interface.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartInterface()));
    });


    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Text('ShopEasy', style: Theme.of(context).textTheme.bodyMedium),
        ),
    );
  }
}