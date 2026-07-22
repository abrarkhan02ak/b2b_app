import 'models/order.dart';

String getOrderStatus(Order order) {
  final difference = DateTime.now().difference(order.date);

  if (difference.inHours < 2) {
    return "Order Placed";
  } else if (difference.inHours < 8) {
    return "Confirmed";
  } else if (difference.inHours < 24) {
    return "Packed";
  } else {
    return "Shipped";
  }
}
