import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/core/common/config/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key, this.isNumber=false, required this.lable, required this.myController, required this.valid}) : super(key: key);
  final bool? isNumber;
  final String lable;
  final TextEditingController myController;
  final String? Function(String?) valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

        validator: valid,
        controller:myController ,
        keyboardType:isNumber!?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle:Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.primary,
              fontSize: 20.sp
          ) ,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all( const Radius.circular(20).w,) ,
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(66),
            borderSide: BorderSide.none,
          ),

        ));
  }
}
