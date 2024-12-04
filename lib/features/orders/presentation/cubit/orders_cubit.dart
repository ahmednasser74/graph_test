import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/index.dart';
import '../../data/models/index.dart';
import '../../domain/index.dart';

part 'orders_state.dart';

@Injectable()
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._getOrdersUsecase) : super(OrdersInitialState());
  final GetOrdersUsecase _getOrdersUsecase;

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await _getOrdersUsecase(params: NoParams());
    result.fold(
      (error) => emit(OrdersErrorState(error)),
      (orders) => emit(OrdersSuccessState(orders, ordersMetrics(orders))),
    );
  }

  OrdersMetricsData ordersMetrics(List<OrderItemResponseModel> orders) {
    double totalPrice = 0;
    int numOfReturns = 0;
    for (var order in orders) {
      if (order.status == OrderStatus.returned) {
        numOfReturns++;
      }
      totalPrice += double.tryParse(order.price.substring(1).replaceAll(',', '')) ?? 0;
    }
    return OrdersMetricsData(
      totalCount: orders.length,
      averagePrice: totalPrice / orders.length,
      numOfReturns: numOfReturns,
    );
  }
}
