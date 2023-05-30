import 'package:ez_learn/core/common/config/theme/theme.dart';import 'package:ez_learn/features/auth/presentation/ui/screen/sign_in.dart';
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      builder: (context, child) =>
          MaterialApp(
              home: const SignUpScreen(),
              builder: (context, child) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: child!,
                );
              },
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
            ),
          );

  }
}



