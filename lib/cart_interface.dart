import 'package:flutter/material.dart';
import 'package:shop_cart/cart_details_page.dart';

class CartInterface extends StatefulWidget {
  const CartInterface({super.key});

  @override
  State<CartInterface> createState() => _CartInterfaceState();
}

class _CartInterfaceState extends State<CartInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalogue", style: Theme.of(context).textTheme.titleLarge,),
      backgroundColor: Colors.pink.shade100,
      centerTitle: true,
      actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const  CartDetailsPage()));
      }, icon: const Icon(Icons.shopping_cart))],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2/3,crossAxisSpacing: 20,mainAxisSpacing: 20),
        children: const [

        ],),
      ),
      
    
    );
  }
}