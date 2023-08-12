import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/like_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.title,
    required this.date,
    required this.isFavourite,
  });

  final String title;
  final String date;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 124.w,
            height: 88.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 144.w,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 152.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date),
                      LikeButtonWidget(
                        size: 40.r,
                        isLiked: isFavourite,
                        onTap: (isLiked) async {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
