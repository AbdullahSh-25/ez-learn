import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key, required this.image, required this.text}) : super(key: key);
  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: REdgeInsetsDirectional.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RSizedBox(
                width:double.infinity,
                height:260,
                child: image,
              ),
              50.verticalSpace,
              Padding(
                padding: REdgeInsetsDirectional.only(start: 13,end: 13),
                child: Text(text,style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 20.sp, color: AppColors.outlineBlack),),
              ),


            ],
          ),
        ),
      ),


    );
  }
}
