import 'package:flutter/material.dart';

import '../../features/orders/data/models/index.dart';
import '../../features/orders/presentation/index.dart';

class Routes {
  static const String splashScreen = '/splashScreen', ordersGraphScreen = '/ordersGraphScreen', ordersMetricsScreen = '/ordersMetricsScreen';

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    try {
      return switch (routeSettings.name) {
        splashScreen => _screenInit(const SplashScreen(), routeSettings),
        ordersGraphScreen => _screenInit(OrdersGraphScreen(orders: routeSettings.arguments as List<OrderItemResponseModel>), routeSettings),
        ordersMetricsScreen => _screenInit(const OrdersMetricsScreen(), routeSettings),
        _ => throw UnimplementedError('Given Named Route is not implemented yet'),
      };
    } catch (error) {
      throw UnimplementedError('Something went wrong while navigation check routes file ${error.toString()}');
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(Widget screen, RouteSettings? settings) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen, settings: settings);
  }
}
