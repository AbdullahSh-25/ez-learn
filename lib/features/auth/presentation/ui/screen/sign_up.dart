import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/background_image.dart';
import '../widget/card_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUp';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(image: 'assets/images/Group47933.svg'),
          Padding(
            padding: REdgeInsetsDirectional.only(top: 70, bottom: 70, start: 25, end: 25),
            child: const CardSignUp(),
          ),
        ],
      ),
    );
  }
}
