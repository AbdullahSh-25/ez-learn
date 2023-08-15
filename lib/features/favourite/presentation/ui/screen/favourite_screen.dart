import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/favourite/presentation/ui/screen/lectures_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'VideoPage.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: REdgeInsetsDirectional.only(top: 50, start: 10, end: 10),
          child: Column(
            children: [
              Container(
                height: 45.h,
                decoration: BoxDecoration(color: AppColors.whiteBlue, borderRadius: BorderRadius.circular(10.0)),
                child: TabBar(
                  indicatorPadding: REdgeInsetsDirectional.only(start: 35, end: 35),
                  indicatorWeight: 4,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.primary,
                  tabs: const [
                    Tab(
                      text: 'المحاضرات',
                    ),
                    Tab(
                      text: 'الفيديوهات',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: const Center(
                        child: LecturesPages(),
                      ),
                    ),
                    Container(
                      child: const Center(
                        child: VideoPage(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
