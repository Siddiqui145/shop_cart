import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_cart/screens/cart_details_page.dart';
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
    final cartItems = ref.watch(cartProvider);


    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(title: const Text("Catalogue", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), ),
      backgroundColor: Colors.white38,
      
      centerTitle: true,
      actions: [IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const  CartDetailsPage()));
      }, icon: const Icon(Icons.shopping_cart, color: Colors.black,),
      

      ),
      if (cartItems.isNotEmpty)
      Positioned(
        right: -4,
        top: -4,
        child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Text('${cartItems.length}',style: const TextStyle(color: Colors.white, fontSize: 12),),
      ))
      ],),

      body: Padding(
        padding: const EdgeInsets.all(4.0),
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
              Text("\$${product.price.toStringAsFixed(2)}",style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),),
              const SizedBox(width: 4,),
              Text("${product.discountPercentage} % OFF",style: TextStyle(color: Colors.green.shade100),),
              Text("\$${product.finalPrice.toStringAsFixed(2)}",style: TextStyle(color: Colors.pink.shade400, fontWeight: FontWeight.bold),),
             const SizedBox(height: 8,),
             ElevatedButton(onPressed: () {
              ref.read(cartProvider.notifier).addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.title} added to Cart!",textAlign: TextAlign.center,),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green.shade400,),);
              
             }, child: const Text("Add to Cart")),
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