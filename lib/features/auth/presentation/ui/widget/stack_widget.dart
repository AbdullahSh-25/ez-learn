import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(67).r,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: const Icon(
              Icons.person,
              size: 55,
              color: AppColors.outlineBlack,
            ),
          ),
          InkWell(
            onTap: (){},
            child: Padding(
              padding: REdgeInsetsDirectional.only(end: 40, top: 35),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r,
                  border: Border.all(color: AppColors.primary),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 24,
                  color: AppColors.whiteBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
