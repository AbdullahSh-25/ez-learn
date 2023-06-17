import 'package:ez_learn/features/edit_profile/presentation/widget/photo_profile.dart';
import 'package:ez_learn/features/edit_profile/presentation/widget/text_fieldEdit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/strings/app_string.dart';
import 'dropdownEdit_widget.dart';


class InfoEditProfile extends StatelessWidget {
  const InfoEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameTextController = TextEditingController();
    final TextEditingController numberStudentTextController = TextEditingController();

    return Form(
      key: formKey,
      child: Padding(
        padding: REdgeInsetsDirectional.only(start: 20, end: 20),
        child: Column(
          children: [
            30.verticalSpace,
            const PhotoProfile(),
            15.verticalSpace,
            Text(
              "Batoul Darwish",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
            25.verticalSpace,
            TextFormFieldWidget(
              lable: AppString.name,
              myController: nameTextController,
              valid: (String? Value) {
                if (Value!.isEmpty) {
                  return AppString.yourName;
                }
                return null;
              },
            ),
            14.verticalSpace,
            TextFormFieldWidget(
              lable: AppString.numberStudent,
              myController: numberStudentTextController,
              valid: (String? Value) {
                if (Value!.isEmpty) {
                  return AppString.yourNumberStudent;
                }
                return null;
              },
              isNumber: true,
            ),
            14.verticalSpace,
            const DropdownWidget(
              hintText: 'السنة الدراسية'
              , typeDrop: false,
            ),
            14.verticalSpace,
            const DropdownWidget(
              hintText: "المواد المختارة",
              typeDrop: true,
            ),
            const Spacer(),
            FractionallySizedBox(
              widthFactor: 1,
              child: OutlinedButton(
                onPressed: () {}, child:const  Text(AppString.changePassword),
               ),
            ),
            15.verticalSpace,
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {}, child: const Text(AppString.saveModifcations),
              ),
            ),


          ],
        ),
      ),

    );

  }
}
