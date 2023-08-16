import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAuthWidget extends StatelessWidget {
  const ButtonAuthWidget({Key? key, required this.colorText, required this.colorbutton, required this.child, required this.onTap}) : super(key: key);
  final Color colorText;
  final Color colorbutton;
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 49,
      child: MaterialButton(
        elevation: 5.0,
        color: colorbutton,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
