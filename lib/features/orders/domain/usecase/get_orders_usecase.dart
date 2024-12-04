import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/index.dart';
import '../../data/models/index.dart';
import '../repositories/orders_repository.dart';

@Injectable()
class GetOrdersUsecase extends UseCase<Future<Either<String, List<OrderItemResponseModel>>>, NoParams> {
  final OrdersRepository repository;

  GetOrdersUsecase(this.repository);

  @override
  Future<Either<String, List<OrderItemResponseModel>>> call({required NoParams params}) async {
    return await repository.getOrders();
  }
}
