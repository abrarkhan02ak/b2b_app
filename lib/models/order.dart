import 'product.dart';

class Order {
  final String orderId;
  final List<Product> products;
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
}
