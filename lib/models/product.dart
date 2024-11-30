
class Product {

  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final int price;
  final int discountPercentage;
  final String image;
  int quantity;



Product({
  required this.id,
  required this.title,
  required this.description,
  required this.discountPercentage,
  required this.price,
  required this.thumbnail,
  required this.image,
  this.quantity = 1,
});  

factory Product.fromJson(Map<String,dynamic> json) {
  return Product(id: json['id'], 
  title: json['title'], 
  description: json['description'],
   discountPercentage: json['discountPercentage'].toInt(), 
   price: json['price'].toInt(),
    thumbnail: json['thumbnail'], 
    image: json['images'][0],);
}

double get finalPrice => price - (price * discountPercentage/100);
}