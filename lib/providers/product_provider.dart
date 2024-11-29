
import 'package:riverpod/riverpod.dart';
import 'package:shop_cart/api_service.dart';
import 'package:shop_cart/product.dart';

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
    state = state.where((item) => item.id!= product.id).toList();
  }

  double get totalPrice => state.fold(0, (sum, product) => sum + product.finalPrice);
  
}