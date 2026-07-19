import 'product.dart';

class Order {
  final String orderId;
  final List<Product> products;
  final double totalAmount;
  final String status;

  Order({
    required this.orderId,
    required this.products,
    required this.totalAmount,
    required this.status,
  });
}
