import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListNotification extends StatelessWidget {
  const ListNotification({Key? key, required this.title, required this.subTitle, required this.time}) : super(key: key);
final String title;
final String subTitle;
final String time;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('assets/images/Group 47932.svg',width: 56.w,height: 56.w,),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize:18.sp ,
          color: AppColors.primary
        ),
      ),
      trailing: Text(
        time,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primary),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
