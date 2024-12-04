import '../../../../core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/index.dart';

class OrderMetricsCard extends StatelessWidget {
  final OrdersMetricsData metrics;
  const OrderMetricsCard({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      gradientColors: const [
        AppColors.primaryColor,
        AppColors.primaryColor,
        AppColors.primaryLightColor,
        AppColors.primaryLightColor,
      ],
      gradientBegin: Alignment.topLeft,
      gradientEnd: Alignment.bottomRight,
      borderRadius: 12.sp,
      paddingAll: 20.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMetric("Total Orders", metrics.totalCount.toString()),
          _buildMetric("Average Price", "\$${metrics.averagePrice.toStringAsFixed(2)}"),
          _buildMetric("Returns", metrics.numOfReturns.toString()),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            label,
            weight: FontWeight.bold,
            color: AppColors.darkModeColor,
            size: 18.sp,
          ),
          AppText(
            value,
            weight: FontWeight.w600,
            color: AppColors.darkModeColor,
            size: 22.sp,
          ),
        ],
      ),
    );
  }
}
