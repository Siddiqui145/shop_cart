import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_cart/cart_details_page.dart';
import 'package:shop_cart/providers/product_provider.dart';

class CartInterface extends ConsumerStatefulWidget {
  const CartInterface({super.key});


  @override
  _CartInterfaceState createState() => _CartInterfaceState();
}

class _CartInterfaceState extends ConsumerState<CartInterface> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(productsProvider(currentPage));


    return Scaffold(
      appBar: AppBar(title: Text("Catalogue", style: Theme.of(context).textTheme.titleLarge,),
      backgroundColor: Colors.pink.shade100,
      centerTitle: true,
      actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const  CartDetailsPage()));
      }, icon: const Icon(Icons.shopping_cart))],),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: productList.when(data: (products) => GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2/3,crossAxisSpacing: 20,mainAxisSpacing: 20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 5,
            child: Padding(padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Expanded(child: Image.network(product.image,fit: BoxFit.cover,),),
              const SizedBox(height: 8,),
              Text(product.title, textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 8,),
              Text("\$${product.price.toStringAsFixed(2)}",style: TextStyle(color: Colors.pink.shade400, fontWeight: FontWeight.bold),),
             const SizedBox(height: 8,),
             ElevatedButton(onPressed: () {}, child: const Text("Add to Cart")),
              ],
            ),),
            
          );
        },
        
        ),
        loading: () => const Center(child: CircularProgressIndicator(),),
        error: (error, stackTrace) => Center(child: Text('Error: $error'),),
      ),
      ),
    
    );
  }
}