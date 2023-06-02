import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../controller/cubit/onboarding_bloc.dart';

class ButtonSliderOnBoarding extends StatelessWidget {
  const ButtonSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RSizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            OnBoardingCubit.get(context).next(context) ;
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: 35,
          )
      ),
    );
  }
}
