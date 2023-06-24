import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/appBar_description.dart';
import '../widget/description_widget.dart';

class SubjectDescription extends StatelessWidget {
  const SubjectDescription({Key? key}) : super(key: key);
  static const routeName = '/SubjectDescription';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BuildAppBarDescription(context),
      body: DescriptionWidget(
          image: Image.asset("assets/images/photo_2023-06-24_04-25-03.jpg"),
          text: "يعرض المقرر أساسيات الذكاء الصنعي كمدخل"
              "بين مقررات الهندسة المعلوماتية بشكل عام,"
              "الذكاء الصنعي بشكل خاص"
              " يبين أفرع الذكاء الصنعي من نظم خبيرة,شبكات"
              " تقنية تعلم الآلة و السلوك البشري"
              " إضافة إلى تطبيقات الذكاء الصنعي في مجالات "
              "الصوت والصورة و سواها"),
    );
  }
}
