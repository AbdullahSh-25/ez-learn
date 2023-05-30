import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextButtonAuthWidget extends StatelessWidget {
  const TextButtonAuthWidget({Key? key, required this.colorText, required this.colorbutton, required this.text, required this.onTap, }) : super(key: key);
  final Color colorText;
  final Color colorbutton;
  final String text;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    const bool hasAccount= true;

    return RSizedBox(
      child: TextButton(
        onPressed:onTap ,
        child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 20.sp,
              color: colorText,
            )
        ),
      ),
    );
  }
}
