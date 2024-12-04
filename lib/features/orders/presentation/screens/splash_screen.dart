import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/index.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      // ignore: use_build_context_synchronously
      () => context.pushNamedReplacement(Routes.ordersMetricsScreen),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    return Center(
      child: Assets.images.appIcon.image(height: .5.sh, width: .5.sw),
    );
  }
}
