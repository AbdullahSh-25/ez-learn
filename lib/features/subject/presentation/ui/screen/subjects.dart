import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/widgets/custom_page_route.dart';
import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/core/result_builder/result_builder.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/screen/lectures_details_screen.dart';
import 'package:ez_learn/features/notification/ui/screen/notification.dart';
import 'package:ez_learn/features/subject/presentation/state/bloc/subject_bloc.dart';
import 'package:ez_learn/features/subject/presentation/ui/widget/subject_item.dart';
import 'package:ez_learn/generated/assets.dart';
import 'package:ez_learn/manage_subject/presentation/ui/screen/manage_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listYear = const [
      AppString.year1,
      AppString.year2,
      AppString.year3,
      AppString.year4,
      AppString.year5,
    ];
    var sem = const [
      'الفصل الأول',
      'الفصل الثاني',
    ];
    return BlocProvider.value(
      value: getIt<SubjectBloc>()..add(GetMySubject()),
      child: SafeArea(
        // don't delete the comments
        child: //0 == 0
            // ? Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text('لم تقم باختيار مواد بعد'),
            //         ElevatedButton(
            //           onPressed: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => ManageSubject(),
            //             ));
            //           },
            //           child: const Text('اختر الآن'),
            //         ),
            //       ],
            //     ),
            //   )
            // :
            ReactiveForm(
          formGroup: FormGroup({
            'search': FormControl<String>(),
          }),
          child: BlocBuilder<SubjectBloc, SubjectState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 0),
                    () {
                      context.read<SubjectBloc>().add(GetMySubject());
                    },
                  );
                },
                child: ResultBuilder(
                  error: (message) => Center(child: Text('عذرا حدث خطأ ما')),
                  init: () => SizedBox(),
                  loading: () => Center(child: CircularProgressIndicator()),
                  result: state.mySubject,
                  success: (data) => data.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('لم تقم باختيار مواد بعد'),
                              SizedBox(
                                height: 5.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ManageSubject(),
                                  ));
                                },
                                child: const Text('اختر الآن'),
                              ),
                            ],
                          ),
                        )
                      : Column(
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
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r)),
                                        child: Image.asset(getIt<AuthLocal>().getUser()!.avatarUrl),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'مرحبا ${getIt<AuthLocal>().getUser()!.firstName}',
                                            style: Theme.of(context).textTheme.labelLarge,
                                          ),
                                          Text(
                                            listYear[getIt<AuthLocal>().getUser()!.year],
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
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
                                decoration: InputDecoration(
                                  fillColor: AppColors.whiteGrey,
                                  hintText: 'بحث...',
                                  hintStyle: const TextStyle(
                                    color: AppColors.primary,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: AppColors.yellow,
                                  ),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
                                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StatefulBuilder(
                                    builder: (context, setState) => GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(CustomPageRoute(
                                          child: const LecturesDetailsScreen(),
                                        ));
                                      },
                                      child: SubjectItem(
                                        subjectName: data[index].name,
                                        subjectYear: '${listYear[data[index].year - 1]} - ${sem[data[index].semester]}',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
