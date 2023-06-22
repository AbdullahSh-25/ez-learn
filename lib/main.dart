import 'package:ez_learn/core/common/config/theme/theme.dart';
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_in.dart';
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_up.dart';
import 'package:ez_learn/features/edit_profile/presentation/ui/screen/edit_profile.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/screen/splash.dart';
import 'package:ez_learn/features/root/presentation/ui/screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/lectures_details/presentation/ui/screen/lectures_details_screen.dart';
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
        routes: {
          OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
          SignInScreen.routeName: (context) => SignInScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          RootScreen.routeName: (context) => const RootScreen(),
          EditProfile.routeName: (context) => const EditProfile(),
          NotificationScreen.routerName: (context) => const NotificationScreen(),
          LecturesDetailsScreen.routeName:(context)=> const LecturesDetailsScreen()
        },
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: LecturesDetailsScreen(),
        ),
      ),
    );
  }
}
