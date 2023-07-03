import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key, required this.number, required this.text, required this.average}) : super(key: key);
 final int number;
 final String text;
 final  String average;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteBlue2,
      shadowColor: AppColors.primary,
      elevation:2.0,
      child: ListTile(
        leading: RSizedBox(
          height: 50,
          width: 85,
          child: Row(
            children: [
              Text(
                  '#$number',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primary,
                ),
              ),
              10.horizontalSpace,
              Image.asset('assets/images/Group 47900.png')
            ],
          ),
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.primary),
        ),
        trailing: Text(
          average,
    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.primary),
      ),)
    );
  }
}
