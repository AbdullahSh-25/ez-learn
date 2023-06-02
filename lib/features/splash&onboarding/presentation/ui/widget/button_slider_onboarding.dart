import 'package:ez_learn/features/auth/presentation/ui/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../controller/cubit/onboarding_bloc.dart';

class ButtonSliderOnBoarding extends StatelessWidget {
  ButtonSliderOnBoarding({Key? key, this.goToLogin = false}) : super(key: key);

  bool goToLogin = false;

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            if(goToLogin) {
              Navigator.of(context).pushNamed(SignInScreen.routeName);
            } else {
              OnBoardingCubit.get(context).next(context);
            }
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: 35,
          )),
    );
  }
}
