import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSubject extends StatelessWidget {
  const SelectSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.verticalSpace,
              const CustomAppBar(text: 'المواد'),
              Center(
                child: Text(
                  'السنة الثالثة-الفصل الأول',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text('المواد الاختيارية'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 3,
                  itemBuilder: (context, index) => Subjecttem(
                    markExpected: index == 0
                        ? "80"
                        : index == 1
                            ? "60"
                            : "75",
                    name: index == 0
                        ? "هندسة البرمجيات"
                        : index == 1
                            ? "الذكاء الصنعي"
                            : "شبكات متفدمة",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text('المواد الإجبارية'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 3,
                  itemBuilder: (context, index) => Subjecttem(
                    name: index == 0
                        ? "نظرية المعلومات"
                        : index == 1
                            ? "نظرية المخططات"
                            : "خوارزميات",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Subjecttem extends StatelessWidget {
  const Subjecttem({
    super.key,
    required this.name,
    this.markExpected,
  });

  final String name;
  final String? markExpected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(15.r),
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
              Text(name),
              SizedBox(
                height: 5.h,
              ),
              if (markExpected != null)
                Row(
                  children: [
                    Text(
                      'علامتك المتوقعة: ',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.red),
                    ),
                    Text(markExpected!),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
