import 'package:ez_learn/features/auth/presentation/ui/widget/background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/background_settings.dart';
import '../widget/continuer_setting.dart';
import '../widget/photo_profile.dart';


class SettingScreen extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[
          const BackgroundSettings(image: 'assets/images/Group 47935.svg'),
          Padding(
            padding: REdgeInsetsDirectional.only(top: 190,start: 1,end: 1),
            child: CountinuerSetting(),
          ),
          Padding(
            padding: REdgeInsetsDirectional.only(top: 120,start: 140),
            child:  const PhotoProfile()),




           ],
         ),
    );



  }
}




