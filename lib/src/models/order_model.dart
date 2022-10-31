import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';

class OrderModel {
  String id;
  DateTime orderDate;
  List<CartItemModel> items;
  DateTime overdueDate;
  String status;
  String copyPaste;
  double total;

  OrderModel({
    required this.copyPaste,
    required this.orderDate,
    required this.items,
    required this.id,
    required this.overdueDate,
    required this.status,
    required this.total,
  });
}
