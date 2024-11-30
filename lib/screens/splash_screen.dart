import 'package:flutter/material.dart';
import 'package:shop_cart/screens/cart_interface.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartInterface()));
    });


    return Scaffold(
        //backgroundColor: Colors.teal,
        body: Center(
          child: SizedBox.expand(child: Image.asset("assets/images/splash.gif", fit: BoxFit.cover,)),

            //child: Text('ShopEasy', style: Theme.of(context).textTheme.bodyMedium),
        ),
    );
  }
}