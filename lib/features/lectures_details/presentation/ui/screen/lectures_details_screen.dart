import 'package:comment_tree/comment_tree.dart';
import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/comment/presentation/ui/screen/comment_screen.dart';
import 'package:ez_learn/features/subject_discription/presentation/ui/screen/subject_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/coustom_appbar_lecture.dart';
import '../widget/custom_component_details.dart';
import '../widget/text_span.dart';

class LecturesDetailsScreen extends StatelessWidget {
  const LecturesDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/lectureDetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsetsDirectional.only(top: 65.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomAppBar(
              text: 'نظرية المعلومات',
            ),
            7.verticalSpace,
            const Center(
              child: TextSpanWidget(
                text1: 'السنة الثالثة',
                text2: "الفصل الأول",
              ),
            ),
            35.verticalSpace,
            const CustomComponentDetails(),
            const Spacer(),
            Padding(
              padding: REdgeInsetsDirectional.only(end: 26),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SubjectDescription(),
                  ));
                },
                child: Container(
                  height: 52.h,
                  width: 52.w,
                  decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.2), borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: const Icon(Icons.book_rounded),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
