import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar BuildAppBarDescription(
    BuildContext context,
    ) {
  return AppBar(
    toolbarHeight: 80.h,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    backgroundColor: AppColors.primary,
    centerTitle: true,
    title:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "مبادئ الذكاء الصنعي"  ,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontSize: 20.sp, color: AppColors.white),

        ),
        Text(
          'السنة الثالثة - الفصل الثاني',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20.sp,color: AppColors.white),
        ),
      ],
    ),


    // actions: [
    //   Padding(
    //     padding: REdgeInsetsDirectional.only(end: 22),
    //     child: Icon(Icons.arrow_forward),
    //   )
    // ],
  );
}
