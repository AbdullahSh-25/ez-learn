import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/like_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ListLectures extends StatelessWidget {
  const ListLectures({Key? key,
    required this.title,
    required this.isFavourite,
    required this.subtitle, required this.image, }) :super(key: key);

  final String title;
  final String subtitle;
  final bool isFavourite;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: REdgeInsetsDirectional.only(start: 10,end: 10,top: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          color: AppColors.whiteBlue2,
          child: ListTile(
            leading:   Image.asset(image,width: 110.w,height: 90.h,),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize:20.sp ,
                  color: AppColors.primary
              ),
            ),
            trailing:IconButton(
              icon: LikeButtonWidget(
                size: 26.r,
                isLiked: isFavourite,
                onTap: (isLiked) async {},
              ),
              onPressed: () { },

            ),
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
