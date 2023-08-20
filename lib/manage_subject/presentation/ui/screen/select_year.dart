import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/lectures_details/presentation/ui/widget/coustom_appbar_lecture.dart';
import 'package:ez_learn/manage_subject/presentation/state/bloc/manage_subject_bloc.dart';
import 'package:ez_learn/manage_subject/presentation/ui/screen/selecte_subject.dart';
import 'package:ez_learn/manage_subject/presentation/ui/screen/semister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectScreen extends StatelessWidget {
  SelectScreen({super.key});

  final List<Map<String, String>> items = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        45.verticalSpace,
        const CustomAppBar(text: 'السنوات'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectSemister(year: index + 1),
                    ),
                  );
                },
                child: YearItem(
                  name: items[index]['year']!,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ManageSubjectBloc>().add(UpserSubjecct());
          },
          child: Text('إرسال'),
        ),
      ],
    );
  }
}

class YearItem extends StatelessWidget {
  const YearItem({
    super.key,
    required this.name,
  });

  final String name;

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
          Text(name),
        ],
      ),
    );
  }
}
