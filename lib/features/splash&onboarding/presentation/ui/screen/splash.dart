import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/screen/onboarding.dart';
import 'package:ez_learn/features/splash&onboarding/presentation/ui/widget/animation_elipse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() { animate = true; });
    await Future.delayed(const Duration(milliseconds: 4500));
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context){
        return  const OnBoardingScreen();
      }));



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          AnimationElipse(
            animate: animate,
            imageUrl: "assets/images/Ellipse 6.svg",
            top: 0,left: 0,
          ),
          AnimationElipse(
            animate: animate,
            bottom:100 ,
              imageUrl: "assets/images/Ellipse 7 (2).svg"

          ),
          AnimationElipse(
          animate: animate,
            bottom: 0 ,
            right: 0 ,
           imageUrl:  "assets/images/Ellipse 7 (1).svg"
          ),
          AnimationElipse(
            animate: animate,
            top: 100 ,
            right:  0 ,
              imageUrl: "assets/images/Ellipse 7.svg"
            ),
          Center(child: SvgPicture.asset('assets/images/EZ.svg')),
        ],
      ),
    );
  }
}