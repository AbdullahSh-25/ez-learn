import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/like_button_widget.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/features/supported_vidieos/presentation/ui/screen/view_video.dart';
import 'package:ez_learn/features/supported_vidieos/presentation/ui/widget/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class SupportedViedieos extends StatelessWidget {
  const SupportedViedieos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 65.r, left: 12.r, right: 12.r),
        child: Column(
          children: [
            const CustomAppBar(text: 'نظرية المعلومات'),
            Center(
              child: Text(
                'الفيديوهات',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 10.r),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewVideo()));
                    },
                    child: const VideoItem(
                      title: ' هاد عنوان مابعرف اش اكتب هاد عنوان مابعرف اش اكتب',
                      date: '2025-12-7',
                      isFavourite: true,
                    ),
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
