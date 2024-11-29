class Product {

  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price;
  final int discountPercentage;



Product({
  required this.id,
  required this.title,
  required this.description,
  required this.discountPercentage,
  required this.price,
  required this.thumbnail,
});  

factory Product.fromJson(Map<String,dynamic> json) {
  return Product(id: json['id'], title: json['title'], description: json['description'], discountPercentage: json['discountPercentage'], price: json['price'], thumbnail: json['thumbnail']);
}

double get finalPrice => price - (price * discountPercentage/100);
}