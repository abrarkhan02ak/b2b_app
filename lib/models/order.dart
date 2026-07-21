import '../cart_model.dart';

class Order {
  final String orderId;
  final List<CartItem> products;
  final double totalAmount;
  final String status;

  final String shopName;
  final String ownerName;
  final String mobile;
  final String address;
  final DateTime date;

  Order({
    required this.orderId,
    required this.products,
    required this.totalAmount,
    required this.status,
    required this.shopName,
    required this.ownerName,
    required this.mobile,
    required this.address,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'products': products.map((e) => e.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status,
      'shopName': shopName,
      'ownerName': ownerName,
      'mobile': mobile,
      'address': address,
      'date': date.toIso8601String(),
    };
  }
factory Order.fromMap(Map<String, dynamic> map) {
  return Order(
    orderId: map['orderId'],
    products: (map['products'] as List)
        .map((e) => CartItem.fromMap(e))
        .toList(),
    totalAmount: map['totalAmount'],
    status: map['status'],
    shopName: map['shopName'],
    ownerName: map['ownerName'],
    mobile: map['mobile'],
    address: map['address'],
    date: DateTime.parse(map['date']),
  );
}
}
