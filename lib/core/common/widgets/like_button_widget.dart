import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({Key? key, this.onTap, this.size = 32, this.isLiked}) : super(key: key);

  final LikeButtonTapCallback? onTap;
  final double size;
  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size.r,
      onTap: onTap,
      isLiked: isLiked,
      circleColor: const CircleColor(
        start: AppColors.accentRed,
        end: Colors.red,
      ),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: AppColors.accentRed,
      ),
      likeBuilder: (bool isLiked) {
        return Container(
          width: size.r,
          height: size.r,
          // padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Container(
            width: size.r,
            height: size.r,
            alignment: Alignment.center,
            child: Center(
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? AppColors.primary : Colors.grey,
                size: (size / 1.6).r,
              ),
            ),
          ),
        );
      },
    );
  }
}
