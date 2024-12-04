import 'package:injectable/injectable.dart';

import '../../../../core/index.dart';
import '../models/index.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

abstract class OrdersDataSource {
  Future<List<OrderItemResponseModel>> getOrders();
}

@Injectable(as: OrdersDataSource)
class OrdersDataSourceImpl implements OrdersDataSource {
  @override
  Future<List<OrderItemResponseModel>> getOrders() async {
    try {
      String jsonString = await rootBundle.loadString(Assets.json.orders);
      final List<dynamic> orderList = json.decode(jsonString);
      final orders = orderList.map((order) => OrderItemResponseModel.fromJson(order)).toList();
      return orders;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
