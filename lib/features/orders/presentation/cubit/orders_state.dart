part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrdersInitialState extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersSuccessState extends OrdersState {
  final List<OrderItemResponseModel> orders;
  OrdersMetricsData metrics;

  OrdersSuccessState(this.orders, this.metrics);

  @override
  List<Object?> get props => [orders];
}

class OrdersErrorState extends OrdersState {
  final String message;

  OrdersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
