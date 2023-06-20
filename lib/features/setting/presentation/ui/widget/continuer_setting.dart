import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/features/edit_profile/presentation/ui/screen/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_row_widget.dart';

class CountinuerSetting extends StatelessWidget {
  const CountinuerSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 652.h,
      width: 360.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(topLeft: const Radius.circular(55).w, topRight: const Radius.circular(55).w),
      ),
      child: Column(
        children: [
          68.verticalSpace,
          Text(
            "batoul darwish-4496",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          45.verticalSpace,
          CustomRowWidget(
            text: AppString.myProfile,
            icon: Icons.account_circle_sharp,
            onTap: () {
              Navigator.of(context).pushNamed(EditProfile.routeName);
            },
          ),
          15.verticalSpace,
          const CustomRowWidget(text: AppString.resourceManger, icon: Icons.save),
          15.verticalSpace,
          const CustomRowWidget(text: AppString.myEmoticons, icon: Icons.school),
          15.verticalSpace,
          const CustomRowWidget(text: AppString.logOut, icon: Icons.logout),
        ],
      ),
    );
  }
}
