import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/order.dart';

List<Order> orders = [];

Future<void> saveOrders() async {
  final prefs = await SharedPreferences.getInstance();

  final data =
      orders.map((e) => jsonEncode(e.toMap())).toList();

  await prefs.setStringList('orders', data);
}

Future<void> loadOrders() async {
  final prefs = await SharedPreferences.getInstance();

  final data = prefs.getStringList('orders');

  if (data == null) return;

  orders = data
      .map((e) => Order.fromMap(jsonDecode(e)))
      .toList();
}
Future<void> updateOrderStatus(
  Order order,
  String newStatus,
) async {
  order.status = newStatus;
  await saveOrders();
}
