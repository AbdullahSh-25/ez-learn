import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/row_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomComponentDetails extends StatelessWidget {
  const CustomComponentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: 21,end: 21),
      child: Column(
         children:  [
           const RowComponents(
             icon: Icons.folder,
             text: AppString.lecture1,
           ),
           18.verticalSpace,
           const RowComponents(
             icon: Icons.folder,
             text: AppString.lecture2,
           ),
           18.verticalSpace,
           const RowComponents(
             icon: Icons.ondemand_video_rounded,
             text: AppString.vedio,
           ),
           18.verticalSpace,
           const RowComponents(
             icon: Icons.quiz,
             text: AppString.Quize,
           ),
           18.verticalSpace,
           const RowComponents(
             icon: Icons.calendar_today,
             text: AppString.Questions,
           ),
         ],
      ),
    );
  }
}
