
import 'package:riverpod/riverpod.dart';
import 'package:shop_cart/api_service.dart';
import 'package:shop_cart/models/product.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productsProvider = FutureProvider.family<List<Product>,int>((ref, page) {
  final repository = ref.read(productRepositoryProvider);

  return repository.fetchProducts(page: page);

});

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>> ((ref) {
  return CartNotifier();

});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier(): super([]);

  void addToCart(Product product){
    state=[...state, product];
    
  }
  
  void removeFromCart(Product product){
    state = state.where((item) => item.id!= product.id).toList();
  }

  void increaseQuantity (Product product){
    state = state.map((item) {
      if (item.id == product.id){
        return Product(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity + 1,
          description: item.description,
          discountPercentage: item.discountPercentage,
          thumbnail: item.thumbnail,
          image: item.image,
        );
      }

      return item;

    }).toList();
  }

  void decreaseQuantity(Product product){
    state = state.map((item) {
      if (item.id == product.id && item.quantity > 1){
        return Product(
          id: item.id,
          title: item.title,
          price: item.price,
          quantity: item.quantity - 1,
          description: item.description,
          discountPercentage: item.discountPercentage,
          thumbnail: item.thumbnail,
          image: item.image,
        );
      }

      

      return item;

    }).toList();
  }

  
  

  int get totalQuantity => state.fold(0, (sum,product) => sum + product.quantity);
  double get totalPrice => state.fold(0, (sum, product) => sum + product.finalPrice * product.quantity);
  
}