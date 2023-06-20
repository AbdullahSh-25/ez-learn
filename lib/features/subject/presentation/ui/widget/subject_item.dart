import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    super.key,
    required this.subjectName,
    required this.subjectYear,
  });

  final String subjectName;
  final String subjectYear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.folder,
            size: 70.r,
            color: AppColors.primary,
          ),
          SizedBox(
            width: 10.r,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subjectName),
              Text(subjectYear),
            ],
          ),
        ],
      ),
    );
  }
}
