import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/widgets/like_button_widget.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/features/supported_vidieos/presentation/ui/screen/view_video.dart';
import 'package:ez_learn/features/supported_vidieos/presentation/ui/widget/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

import '../widget/video_itemPage.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.r, left: 10.r, right: 10.r),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 10.r),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewVideo()));
                    },
                    child:  VideoItemPage(
                      title: 'الدارات الكهربائية',
                      subtitle: 'عملي_الجلسة الثالثة',
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
