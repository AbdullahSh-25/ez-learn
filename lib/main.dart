import 'package:bot_toast/bot_toast.dart';
import 'package:ez_learn/core/common/config/theme/theme.dart';
import 'package:ez_learn/core/common/helper/colored_print.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/root/presentation/ui/screen/root_screen.dart';
import 'package:ez_learn/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/splash&onboarding/presentation/ui/screen/onboarding.dart';
import 'manage_subject/presentation/state/bloc/manage_subject_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      builder: (context, child) => BlocProvider.value(
        value: ManageSubjectBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: getIt<AuthLocal>().getUser() != null ? const RootScreen() : const OnBoardingScreen(),
          builder: (context, child) {
            return BotToastInit()(
              context,
              Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
