import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Positioned(
          top: 2.0,
          right: 3,
          child: Container(
            height: 109.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(70).r,
              border: Border.all(color: AppColors.primary, width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.person,
                size: 75,
                color: AppColors.outlineBlack,
              ),
            ),
          ),
        ),
      ],
    );



  }
}
