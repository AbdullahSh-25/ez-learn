import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowComponents extends StatelessWidget {
  const RowComponents({Key? key, required this.icon, required this.text, this.onTap}) : super(key: key);
  final IconData icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: REdgeInsetsDirectional.only(start: 21, end: 21),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white, border: Border.all(color: AppColors.primary)),
        height: 83.h,
        child: Row(
          children: [
            Icon(icon, size: 50.r),
            15.horizontalSpace,
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
