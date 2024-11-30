

import 'package:dio/dio.dart';
import 'package:shop_cart/models/product.dart';

class ProductRepository{
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts({int page= 1, int limit=10}) async {
    final response = await dio.get('https://dummyjson.com/products', queryParameters: {'limit':limit,'skip':(page - 1) * limit},);

    return (response.data['products'] as List).map((product) => Product.fromJson(product)).toList();
  }

}