import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../../../../../core/constant/strings/app_string.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.form, required this.controller, this.icon, this.onTap, }) : super(key: key);
 final String form;
 final TextEditingController controller;
final IconData? icon;
final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool t=true;
    if(icon==Icons.check_circle_rounded){
      t=false;
    }
    return   Padding(
      padding: EdgeInsets.only(right: 11.r, left: 11.r, bottom: 17.r),
      child: Container(
        decoration: BoxDecoration(
            boxShadow:  <BoxShadow>[
              BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 13.0,
                  offset: Offset(0.0, 0.75)
              )
            ],

        ),
        child: ReactiveTextField(
          formControlName: form,
          decoration:  InputDecoration(
            fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8).r,
    borderSide: const BorderSide(
      color: AppColors.primary,
    )),
            prefixIcon: IconButton(onPressed:onTap ,icon: Icon(icon,color:t? AppColors.grey:Colors.green,)),

          ),
          controller:controller,

        ),
      ),
    );
  }
}
