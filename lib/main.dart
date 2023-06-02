import 'package:ez_learn/core/common/config/theme/theme.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/screen/splash.dart';
import 'package:ez_learn/features/root/presentation/ui/screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/notification/ui/screen/notification.dart';
import 'features/splash&onboarding/presentation/ui/screen/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: RootScreen(),
        ),
      ),
    );
  }
}
