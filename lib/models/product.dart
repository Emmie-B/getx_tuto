// create a product class with id, name , description, and price
// 
class Product {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final String? category;
  final double? rating;
  final bool? isFavourite;
  final bool? isPopular;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.category,
      this.rating,
      this.isFavourite,
      this.isPopular});
}
