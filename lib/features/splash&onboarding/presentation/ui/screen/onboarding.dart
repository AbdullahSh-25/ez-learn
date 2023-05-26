import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/config/theme/style.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/data/datasource/onboarding_datasource_static.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/controller/cubit/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/cubit/onboarding_bloc.dart';
import '../widget/button_slider_onboarding.dart';
import '../widget/slider_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit ,OnBoardingState>(
        builder: (context, state) {
          return   Scaffold(
           floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding:REdgeInsetsDirectional.only(top: 100,bottom: 70),
              child: CustomSliderOnBoarding(),
            ),
            floatingActionButton:Visibility(
              replacement:const ButtonSliderOnBoarding(),
              visible: state.currentPage==2,
              child: Row(
              children: [
                const ButtonSliderOnBoarding(),
               18.horizontalSpace,
                Text(
                    AppString.startLearning,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            ) ,
          );
        },
      ),
    );

  }
}
