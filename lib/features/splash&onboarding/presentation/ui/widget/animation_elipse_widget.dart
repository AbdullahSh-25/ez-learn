import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationElipse extends StatelessWidget {
  const AnimationElipse({Key? key, required this.animate,  required this.imageUrl, this.top, this.right, this.bottom, this.left}) : super(key: key);
 final bool animate;
 final String imageUrl;
 final double? top;
 final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 2400),
      top: animate ? top : -30,
      left: animate ? left : -30,
      right: animate? right:-30,
      bottom: animate?bottom:-30,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 2000),
        opacity: animate ? 1 : 0,
        child: SvgPicture.asset(imageUrl),
      ),
    );
  }
}
