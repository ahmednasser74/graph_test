import 'package:equatable/equatable.dart';

class OrdersMetricsData extends Equatable {
  const OrdersMetricsData({
    required this.totalCount,
    required this.averagePrice,
    required this.numOfReturns,
  });

  final int totalCount;
  final double averagePrice;
  final int numOfReturns;

  @override
  List<Object?> get props => [];
}
