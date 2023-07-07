

import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar BuildAppBarItem(
BuildContext context,
    ){
  return AppBar(
    toolbarHeight: 80.h,
    shape:   const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)
        )),
    backgroundColor: AppColors.primary,
    centerTitle: true,
   title:  Text(
     AppString.notification,
     style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20.sp,color: AppColors.white),
   ),
    // actions: [
    //   Padding(
    //     padding:REdgeInsetsDirectional.only(end: 22),
    //     child: Icon(Icons.arrow_forward),
    //   )
    // ],
  );
}