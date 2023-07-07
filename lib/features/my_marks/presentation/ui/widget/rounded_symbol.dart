import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedSymbol extends StatelessWidget {
  const RoundedSymbol({super.key, required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.r,
      height: 60.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: const Color(0xffE0E5F4),
      ),
      child: Center(
        child: Text(
          symbol,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
