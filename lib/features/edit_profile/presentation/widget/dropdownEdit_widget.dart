import 'package:ez_learn/core/constant/strings/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/config/theme/colors.dart';
import '../ui/controller/dropdownEdit_bloc/dropdown_bloc.dart';
import '../ui/controller/dropdownEdit_bloc/dropdown_event.dart';
import '../ui/controller/dropdownEdit_bloc/dropdown_state.dart';




class DropdownWidget extends StatelessWidget {
  const DropdownWidget({Key? key, required this.hintText, required this.typeDrop}) : super(key: key);
  final String hintText;
  final bool typeDrop;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownBloc, DropdownChangeSelectState>(
      builder: (context, state) {
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
              hint: Text(hintText,
                  style: TextStyle(color: AppColors.primary, fontSize: 20.sp)),
              value:typeDrop?state.subject: state.yearStudy,
              onChanged: (value) {
                typeDrop?
                context
                    .read<DropdownBloc>()
                    .add(DropDownChangeSelect2Event(value))
                    :
                context
                    .read<DropdownBloc>()
                    .add(DropDownChangeSelect1Event(value))  ;
              },
              items:typeDrop?
              DropdownBloc.get(context).listItem2.map((String subject) {
                return DropdownMenuItem(
                  value: subject,
                  child: Text("$subject"),
                );
              }).toList()
                  :
              DropdownBloc.get(context).listItem1.map((String subject) {
                return DropdownMenuItem(
                  value: subject,
                  child: Text("$subject"),
                );
              }).toList()
          ),
        );
      },
    );
  }
}
