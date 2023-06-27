import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ListLectures extends StatelessWidget {
  const ListLectures({Key? key, required this.title, required this.subTitle, required this.icon, }) : super(key: key);
  final String title;
  final String subTitle;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        leading:   Image.asset('assets/images/photo_2023-06-24_04-25-03.jpg',width: 90.w,height: 90.w,),

        // leading: SvgPicture.asset('assets/images/image 6.svg',width: 70.w,height: 56.w,),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize:20.sp ,
              color: AppColors.primary
          ),
        ),
        trailing:IconButton(
          icon: Icon(
            Icons.favorite_border ,
            color: AppColors.primary,
          ),
          onPressed: () {

          },
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
