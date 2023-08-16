import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';

class MarkItem extends StatelessWidget {
  const MarkItem({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.whiteBlue2,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
