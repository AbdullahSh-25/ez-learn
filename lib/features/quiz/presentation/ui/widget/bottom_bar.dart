import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/custom_page_route.dart';
import 'package:ez_learn/features/quiz/presentation/ui/screen/add_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/strings/app_string.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: 20,end: 20,top:15,bottom:10),
      child: Row(
        children: [
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                child: OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).push(CustomPageRoute(
                        child:  AddQuestion()
                      ));
                    }
                    , child: const Text(AppString.addQuestion)
                ),
              )),
          20.horizontalSpace,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]
              ),
              child: OutlinedButton(
                onPressed: (){},
                child:const Text(AppString.startQuiz),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
