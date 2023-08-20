import 'dart:convert';

import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/result_builder/result_builder.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/manage_subject/presentation/state/bloc/manage_subject_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSubject extends StatelessWidget {
  const SelectSubject({
    super.key,
    required this.year,
    required this.sem,
  });

  final int year;
  final int sem;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sems = [
      {
        "sem": "الفصل الأول",
      },
      {
        "sem": "الفصل الثاني",
      },
    ];

    final List<Map<String, String>> years = [
      {
        "year": "السنة الأولى",
      },
      {
        "year": "السنة الثانية",
      },
      {
        "year": "السنة الثالثة",
      },
      {
        "year": "السنة الرابعة",
      },
      {
        "year": "السنة الخامسة",
      },
    ];
    context.read<ManageSubjectBloc>().add(GetAllName(year: year, semester: sem));

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: BlocBuilder<ManageSubjectBloc, ManageSubjectState>(
            builder: (context, state) {
              return ResultBuilder(
                error: (message) => Center(
                  child: Text('حدث خطأ ما'),
                ),
                init: () => SizedBox(),
                loading: () => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: const Center(child: CircularProgressIndicator())),
                    ],
                  ),
                ),
                result: state.filteredSubjectsName,
                success: (data) {
                  if (data.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text('لا يوجد مواد'),
                          ),
                        ],
                      ),
                    );
                  }
                  var optional = data.where((element) => element.isOptional == true).toList();
                  var notOptional = data.where((element) => element.isOptional == false).toList();
                  var exMark = json.decode(optional[0].marks);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      45.verticalSpace,
                      const CustomAppBar(text: 'المواد'),
                      Center(
                        child: Text(
                          '${years[year]['year']}-${sems[sem]['sem']}',
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
                          itemCount: optional.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.read<ManageSubjectBloc>().add(AddSubjectId(id: optional[index].id));
                            },
                            child: Subjecttem(
                              name: optional[index].name,
                              markExpected: year == 3 && sem == 0 ? exMark['${index + 1}'] : null,
                              color: state.subjectIds.indexWhere((element) => element == optional[index].id) != -1 ? Colors.grey : Colors.white,
                            ),
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
                          itemCount: notOptional.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.read<ManageSubjectBloc>().add(AddSubjectId(id: notOptional[index].id));
                            },
                            child: Subjecttem(
                              name: notOptional[index].name,
                              color: state.subjectIds.indexWhere((element) => element == notOptional[index].id) != -1 ? Colors.grey : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
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
    required this.color,
  });

  final String name;
  final String? markExpected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
        ),
        color: color,
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
