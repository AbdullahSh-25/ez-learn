import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/features/quiz/presentation/ui/widget/bottom_bar.dart';
import 'package:ez_learn/features/quiz/presentation/ui/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  REdgeInsetsDirectional.only(top: 55,start: 19,end: 19),
        child: Column(
          children: [
            const CustomAppBar(
              text: 'نظرية المعلومات',
            ),
            Text(
              AppString.Quize,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Image.asset('assets/images/Group 3090.png',),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      const ListTileWidget(
                        number: 1,
                        average: '30/40',
                        text: 'الأول على الدفعة',
                      ),
                itemCount: 11,
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
