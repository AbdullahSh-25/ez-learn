

import 'package:ez_learn/features/edit_profile/presentation/widget/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/information_EditProfile.dart';
import '../controller/dropdownEdit_bloc/dropdown_bloc.dart';



class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const routeName = '/editProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BuildAppBarItem(context),
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 25, end: 25,bottom: 20),
        child: BlocProvider(
            create:(context) => DropdownBloc() ,
            child: const InfoEditProfile()),
      ),

    );
  }
}
