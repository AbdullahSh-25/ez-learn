import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.image}) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return  ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child:  SvgPicture.asset(
      image,
      height: 800.h,
        fit: BoxFit.cover,
    ),
    );
    //   Center(
    //   child: SvgPicture.asset(
    //   image,
    //     height: 800.h,
    //   ),
    // );

  }
}
