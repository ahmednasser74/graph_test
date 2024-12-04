import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/index.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasource/data_source.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImp implements OrdersRepository {
  final OrdersDataSource ordersDataSource;
  OrdersRepositoryImp(this.ordersDataSource);

  @override
  Future<Either<String, List<OrderItemResponseModel>>> getOrders() async {
    try {
      final orders = await ordersDataSource.getOrders();
      return Right(orders);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
