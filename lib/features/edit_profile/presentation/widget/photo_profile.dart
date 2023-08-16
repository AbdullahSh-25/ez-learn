import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoProfile extends StatelessWidget {
  final String avatar;

  const PhotoProfile({
    Key? key,
    required this.avatar,
  }) : super(key: key);

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
              size: 90,
              color: AppColors.outlineBlack,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: REdgeInsetsDirectional.only(end: 55, top: 55),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r,
                  border: Border.all(color: AppColors.primary),
                ),
                child: const Icon(
                  Icons.create,
                  size: 25,
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
