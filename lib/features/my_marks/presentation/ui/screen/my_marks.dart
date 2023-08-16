import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/screen/marks_detail.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/item_content.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/mark_item.dart';
import 'package:ez_learn/features/my_marks/presentation/ui/widget/rounded_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMarks extends StatelessWidget {
  const MyMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBlue2 ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 17.r, right: 17.r, bottom: 8.r),
            child: Column(
              children: [
                const CustomAppBar(text: 'علاماتي'),
                18.verticalSpace,
                MarkItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const RoundedSymbol(symbol: 'B+'),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'المعدل الكلي',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Text(
                        '81',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: MarkItem(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MarksDetail(),
                          ));
                        },
                        child: const ItemContent(
                          symbol: 'A+',
                          mark: '81',
                          description: 'السنة الأولى',
                        ),
                      ),
                    ),
                    18.horizontalSpace,
                    Expanded(
                      child: MarkItem(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MarksDetail(),
                          ));
                        },
                        child: const ItemContent(
                          symbol: 'A+',
                          mark: '81',
                          description: 'السنة الثانية',
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: MarkItem(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MarksDetail(),
                          ));
                        },
                        child: const ItemContent(
                          symbol: 'C-',
                          mark: '81',
                          description: 'السنة الثالثة',
                        ),
                      ),
                    ),
                    18.horizontalSpace,
                    Expanded(
                      child: MarkItem(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MarksDetail(),
                          ));
                        },
                        child: const ItemContent(
                          symbol: 'S+',
                          mark: '81',
                          description: 'السنة الرابعة',
                        ),
                      ),
                    ),
                  ],
                ),
                18.verticalSpace,
                MarkItem(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MarksDetail(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const RoundedSymbol(symbol: 'B+'),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'السنة الخامسة',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Text(
                        '81',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
