import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/comment/presentation/ui/screen/comment_reply.dart';
import 'package:ez_learn/features/comment/presentation/ui/widget/comment_item.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            45.verticalSpace,
            const CustomAppBar(
              text: 'المحاضرة السابعة',
            ),
            3.verticalSpace,
            Center(
              child: Text(
                'التعليقات',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.r,
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyTreeView(),
                      ));
                    },
                    child: CommentItem(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
