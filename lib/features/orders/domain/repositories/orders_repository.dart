import 'package:dartz/dartz.dart';

import '../../data/models/index.dart';

abstract class OrdersRepository {
  Future<Either<String, List<OrderItemResponseModel>>> getOrders();
}
