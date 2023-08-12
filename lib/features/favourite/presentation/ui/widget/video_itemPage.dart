import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/like_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItemPage extends StatelessWidget {
  const VideoItemPage({
    super.key,
    required this.title,
    required this.date,
    required this.isFavourite, required this.subtitle,
  });

  final String title;
  final String subtitle;
  final String date;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      decoration: BoxDecoration(
        color:AppColors.whiteBlue2,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 88.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.r),
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
                      Text(subtitle),
                      Text(date),

                      LikeButtonWidget(
                        size: 35.r,
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
