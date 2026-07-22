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

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      code: map['code'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
}
