class Product {
  final String code;
  final String name;
  final String price;
  final String category;
  final String image;
  final String description;
  final int stock;
  final double rating;
  final double originalPrice;
  final int discountPercent;
  final String offerText;
  final String packSize;
  final String moq;

  Product({
    required this.code,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    required this.stock,
    required this.rating,
    required this.originalPrice,
   required this.discountPercent,
   required this.offerText,
   required this.packSize,
   required this.moq,
  });
}
