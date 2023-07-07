import 'package:ez_learn/features/my_marks/presentation/ui/widget/rounded_symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({super.key, required this.symbol, required this.mark, required this.description});

  final String symbol;
  final String mark;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedSymbol(symbol: symbol),
        18.verticalSpace,
        Text(
          mark,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        15.verticalSpace,
        Text(
          description,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
