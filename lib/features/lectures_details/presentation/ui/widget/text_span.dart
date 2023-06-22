import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSpanWidget extends StatelessWidget {
  const TextSpanWidget({Key? key, required this.text1, required this.text2}) : super(key: key);
final String text1;
final String text2;
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(

        style: Theme.of(context).textTheme.titleMedium,
      children: <TextSpan>[
        TextSpan(text:text1),
        const TextSpan(text:"-"),
        TextSpan(text:text2),
      ]
    )

    );
  }
}
