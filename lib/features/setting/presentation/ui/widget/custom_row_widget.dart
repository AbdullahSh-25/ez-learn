import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({Key? key, required this.text,  required this.icon, }) : super(key: key);
  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(top: 15,end: 28,start: 35),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Icon(icon,size: 30.w,),
            RSizedBox(width: 23.0.w),
            Text(
             text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20.sp,
            ),
            ),
            const Spacer(),
             Icon(
              Icons.arrow_forward_ios,
              size: 25.0.w,
            ),
          ],
        ),
      ),
    );







  }
}
