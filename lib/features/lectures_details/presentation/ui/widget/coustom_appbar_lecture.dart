import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text}) : super(key: key);
   final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),

        ),

        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        50.horizontalSpace

      ],
    );
  }
}
