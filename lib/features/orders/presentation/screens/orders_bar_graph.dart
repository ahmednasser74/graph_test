import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/index.dart';
import '../../../../core/src/base_screen.dart';
import '../../data/models/index.dart';

class OrdersGraphScreen extends BaseStatefulWidget {
  const OrdersGraphScreen({super.key, required this.orders});
  final List<OrderItemResponseModel> orders;

  @override
  BaseState<OrdersGraphScreen> createState() => _OrdersGraphScreenState();
}

class _OrdersGraphScreenState extends BaseState<OrdersGraphScreen> {
  final List<FlSpot> spots = <FlSpot>[];

  @override
  void initState() {
    super.initState();
    getSpots(widget.orders);
  }

  @override
  String? get appBarTitle => 'Orders Graph';

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SizedBox(
        width: spots.length * 100,
        child: LineChart(
          LineChartData(
            minX: spots.isNotEmpty ? spots.first.x : 0,
            maxX: spots.isNotEmpty ? spots.last.x : 0,
            minY: 0,
            maxY: spots.last.y + 2,
            // baselineX: 0,
            // baselineY: 0,
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                axisNameSize: 40,
                axisNameWidget: AppText('Date', size: 14.sp),
                sideTitles: SideTitles(
                  showTitles: true,
                  minIncluded: false,
                  maxIncluded: false,
                  // reservedSize: 32,
                  // interval: 1,
                  getTitlesWidget: (value, meta) {
                    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: AppText(
                        DateFormat('dd/MM').format(dateTime),
                        size: 10.sp,
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                axisNameWidget: AppText('Orders Count', size: 14.sp),
                axisNameSize: 20,
                sideTitles: SideTitles(
                  showTitles: true,
                  minIncluded: false,
                  maxIncluded: false,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: AppText(
                        meta.formattedValue,
                        size: 8,
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                barWidth: 1.5,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: true),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // colors: [Color(0xFF006D77), Color(0xFF83C5BE), Color(0xFF83C5BE)],
                  colors: [AppColors.primaryColor, AppColors.primaryLightColor, AppColors.primaryColor],
                ),
                curveSmoothness: 0.1,
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getSpots(List<OrderItemResponseModel> orders) {
    Map<String, int> ordersPerDay = {};

    for (var order in orders) {
      DateTime registeredDate = DateFormat('yyyy-MM-dd').parse(order.registered);
      String formattedDate = DateFormat('yyyy-MM-dd').format(registeredDate);
      if (ordersPerDay.containsKey(formattedDate)) {
        ordersPerDay[formattedDate] = ordersPerDay[formattedDate]! + 1;
      } else {
        ordersPerDay[formattedDate] = 1;
      }
    }

    ordersPerDay.forEach((date, count) {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(date);
      double x = dateTime.millisecondsSinceEpoch.toDouble();
      double y = count.toDouble();
      spots.add(FlSpot(x, y));
    });

    spots.sort((a, b) => a.x.compareTo(b.x));
  }
}
