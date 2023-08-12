import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 47.r,
            height: 47.r,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: Color(0xff24C5CEE6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(
                      0xff36000000,
                    ),
                    offset: Offset(
                      2.0,
                      2.0,
                    ),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عبد الحي',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'السؤال رقم 9 مو واضح كتير ممكن شرح الو ويعطيكن العافية ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '35 رداً- عرض الردود',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: const Color(0xffEA5455),
                            ),
                      ),
                      Text(
                        'منذ 13 دقيقة',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: const Color(0xffEA5455),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
