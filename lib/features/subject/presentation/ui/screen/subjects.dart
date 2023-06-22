import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/notification/ui/screen/notification.dart';
import 'package:ez_learn/features/subject/presentation/ui/widget/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';


class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: FormGroup({
          'search': FormControl<String>(),
        }),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.r,
                left: 21.r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32.r,
                        height: 32.r,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r), color: Colors.blue),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مرحبا Rabiea-za',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            'السنة الخامسة-الفصل الثاني',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(NotificationScreen.routerName);
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, right: 11.r, left: 11.r, bottom: 17.r),
              child: ReactiveTextField(
                formControlName: 'search',
                decoration: const InputDecoration(
                  fillColor: AppColors.whiteBlue,
                  hintText: 'بحث...',
                  hintStyle: TextStyle(
                    color: AppColors.primary,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.yellow,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // todo: navigate to subject detail screen
                    },
                    child: const SubjectItem(
                      subjectName: 'أمن المعلومات',
                      subjectYear: 'السنة الرابعة - الفصل الثاني',
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
