import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/index.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/index.dart';

class OrdersMetricsScreen extends BaseStatefulWidget {
  const OrdersMetricsScreen({super.key});

  @override
  BaseState<OrdersMetricsScreen> createState() => _OrdersMetricsScreenState();
}

class _OrdersMetricsScreenState extends BaseState<OrdersMetricsScreen> {
  final ordersCubit = di<OrdersCubit>()..getOrders();

  @override
  String? get appBarTitle => 'Orders Metrics';

  @override
  Widget getBody(BuildContext context) {
    return BlocProvider(
      create: (_) => ordersCubit,
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrdersSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderMetricsCard(metrics: state.metrics),
                  24.heightBox,
                  _navToGraphButton(context, state),
                ],
              ),
            );
          }
          if (state is OrdersErrorState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  TextButton _navToGraphButton(BuildContext context, OrdersSuccessState state) {
    return TextButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText('View Orders Graph', color: context.primaryColor, size: 18.sp),
          12.widthBox,
          Icon(Icons.bar_chart, color: context.primaryColor, size: 30.sp),
        ],
      ),
      onPressed: () => context.pushNamed(
        Routes.ordersGraphScreen,
        arguments: state.orders,
      ),
    );
  }
}
