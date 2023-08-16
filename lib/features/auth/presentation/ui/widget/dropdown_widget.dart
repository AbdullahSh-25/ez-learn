import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:ez_learn/features/auth/presentation/ui/controller/dropdown_bloc/dropdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../controller/dropdown_bloc/dropdown_event.dart';
import '../controller/dropdown_bloc/dropdown_state.dart';

class DropDownWidget extends StatelessWidget {
  final void Function(int?)? onChanged;
  final List<DropdownMenuItem<int>>? items;
  final int? value;

  const DropDownWidget({
    Key? key,
    this.onChanged,
    this.items,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: REdgeInsetsDirectional.only(end: 10, start: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1.0),
        borderRadius: BorderRadius.circular(8).w,
      ),
      child: DropdownButton(
        style: TextStyle(color: AppColors.primary, fontSize: 20.sp),
        dropdownColor: AppColors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        iconEnabledColor: AppColors.primary,
        underline: const SizedBox(),
        hint: Text(AppString.yearStudying, style: TextStyle(color: AppColors.primary, fontSize: 20.sp)),
        value: value,
        onChanged: onChanged ?? (_) {},
        items: items,
      ),
    );
  }
}
