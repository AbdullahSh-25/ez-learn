import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/manage_subject/presentation/state/bloc/manage_subject_bloc.dart';
import 'package:ez_learn/manage_subject/presentation/ui/screen/select_year.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageSubject extends StatelessWidget {
  const ManageSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectScreen(),
    );
  }
}
