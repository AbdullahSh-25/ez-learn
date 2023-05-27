import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/controller/cubit/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/datasource/onboarding_datasource_static.dart';
import '../controller/cubit/onboarding_state.dart';



class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit ,OnBoardingState>(builder: (context, state) =>
        PageView.builder(
          reverse: true,
          controller: OnBoardingCubit.get(context).pageController,
        onPageChanged: (val){
          OnBoardingCubit.get(context).onPageChanged(val);
        },
        itemCount: OnBoardingList.length,
        itemBuilder: (context,i)=>Column(
          children: [
            Image.asset(
              OnBoardingList[i].image!,
               fit:BoxFit.fill
            ),
           45.verticalSpace,
            Text(
             OnBoardingList[i].title!,
              textAlign:TextAlign.center ,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.textColor),
            ),
            25.verticalSpace,
            Text(
              OnBoardingList[i].body!,
              textAlign:TextAlign.center ,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
              ),
            ),
          ],
        )
    ) ,
    );
  }
}
