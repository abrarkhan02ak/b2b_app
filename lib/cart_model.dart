class CartItem {
  final String code;
  final String name;
  final String price;
  int quantity;

  CartItem({
    required this.code,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
