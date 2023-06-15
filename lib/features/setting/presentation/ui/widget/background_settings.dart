import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundSettings extends StatelessWidget {
  const BackgroundSettings({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
      image,
      height: 377.h,
      fit:BoxFit.cover ,
    );
  }
}
