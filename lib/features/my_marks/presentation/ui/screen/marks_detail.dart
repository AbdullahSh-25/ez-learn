import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/item_content.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/mark_detail_item.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/mark_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarksDetail extends StatelessWidget {
  const MarksDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 17.r, right: 17.r, bottom: 8.r),
            child: Column(
              children: [
                const CustomAppBar(text: 'علاماتي'),
                18.verticalSpace,
                Row(
                  children: [
                    const Expanded(
                      child: MarkItem(
                        child: ItemContent(
                          symbol: 'A+',
                          mark: '81',
                          description: 'الفصل الأول',
                        ),
                      ),
                    ),
                    18.horizontalSpace,
                    const Expanded(
                      child: MarkItem(
                        child: ItemContent(
                          symbol: 'A+',
                          mark: '81',
                          description: 'الفصل الثاني',
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 15.r),
                    child: const MarkDetailItem(
                      mark: '75',
                      subjectName: 'البرمجة التفرعية',
                      theoreticalMark: '50',
                      practicalMark: '25',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
