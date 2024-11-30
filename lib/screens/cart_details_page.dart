import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_cart/providers/product_provider.dart';

class CartDetailsPage extends ConsumerWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    


    return Scaffold(
      //backgroundColor: Colors.pink.shade100,
      //backgroundColor: Colors.pink.shade100,
      
      
      appBar: AppBar(title: Text("Cart Page", style: Theme.of(context).textTheme.titleLarge,),
      centerTitle: true,
      backgroundColor:Colors.white38),
      body: cartItems.isEmpty ? const Center(child:  Text("No Items in the Cart"),) : ListView.builder(itemCount: cartItems.length, itemBuilder: (context, index) {
        final product = cartItems[index];

        return ListTile(
          
          leading: Image.network(product.thumbnail),
          title: Text(product.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$${product.finalPrice.toStringAsFixed(2)}'
              ),
              Row(
                children: [
                  IconButton(onPressed: () {
                    ref.read(cartProvider.notifier).decreaseQuantity(product);
                  }, icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text("${product.quantity}"),
                  IconButton(onPressed: () {
                    ref.read(cartProvider.notifier).increaseQuantity(product);
                  }, icon: const Icon(Icons.add_circle_outline)),

                ],
              )

            ],
          ),
          
          trailing: IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text("Remove item"),
                content: Text("Are you sure you want to remove ${product.title} from the cart?"),
              actions: [
                TextButton(onPressed: () {Navigator.of(context).pop();}, child: const Text("Cancel"),),
                ElevatedButton(onPressed: () {
                  ref.read(cartProvider.notifier).removeFromCart(product);
                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${product.title} removed from cart!")));

                }, child: const Text("Remove"),),
              ],
              );

            });
            
          }, icon: const Icon(Icons.delete)),

        );
      }),
      bottomNavigationBar: 
      Container(padding: const EdgeInsets.all(16),color: Colors.white38,
      
      child: Row(//mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


        
        Text('Total: \$${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
       // const SizedBox(width: 50,),
        ElevatedButton(onPressed: () {
          
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Checkout Button Clicked")));
        },
        
        
         child: Text("Checkout ${ref.watch(cartProvider.notifier).totalQuantity}", style: const TextStyle(fontSize: 18, color: Colors.white),))
      ],
      ),

      
      ),
      );
    
  }
}
