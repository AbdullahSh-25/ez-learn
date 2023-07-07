import 'package:ez_learn/features/my_marks/presentation/ui/widget/mark_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkDetailItem extends StatelessWidget {
  const MarkDetailItem({
    super.key,
    required this.mark,
    required this.subjectName,
    required this.theoreticalMark,
    required this.practicalMark,
  });

  final String mark;
  final String subjectName;
  final String theoreticalMark;
  final String practicalMark;

  @override
  Widget build(BuildContext context) {
    return MarkItem(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subjectName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                mark,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'النظري $theoreticalMark',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'العملي $practicalMark',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
