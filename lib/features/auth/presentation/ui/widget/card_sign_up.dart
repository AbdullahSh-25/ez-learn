
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_in.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/button_auth_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/dropdown_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/stack_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/text_button_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../../../../../core/constant/strings/app_string.dart';
class CardSignUp extends StatelessWidget {
  const CardSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordTextController = TextEditingController();
    final TextEditingController passwordConfirmTextController = TextEditingController();
    final TextEditingController nameTextController = TextEditingController();
    final TextEditingController numberStudentTextController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();



     return Form(
          key: formKey,
          child: Card(
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(24).w),
                side: const BorderSide(color: AppColors.primary)
            ),
            elevation: 15,
            child: Padding(
              padding: REdgeInsetsDirectional.only(start: 20,end: 20,bottom: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    AppString.signUp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const StackWidget(),
                  22.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.name,
                    myController:nameTextController,
                    valid:   (String? Value){
                      if(Value!.isEmpty ){
                        return AppString.yourName;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.numberStudent,
                    myController: numberStudentTextController,
                    valid:   (String? Value){
                      if(Value!.isEmpty ){
                        return AppString.yourNumberStudent;
                      }
                      return null;
                    },
                    isNumber: true,
                  ),
                  20.verticalSpace,
                  const DropDownWidget(),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.password,
                    myController: passwordTextController,
                    valid:   (String? Value){
                      if(Value!.isEmpty || Value!.length < 6){
                        return AppString.passwordWrong;
                      }
                      return null;
                    },
                    isNumber: true,
                  ),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.passwordConfirm,
                    myController: passwordConfirmTextController,
                    valid:   (String? Value){
                      if (passwordTextController.text != Value) {
                        return AppString.confirmYourPasswordisWrong;
                      }
                    },
                    isNumber: true,
                  ),
                  38.verticalSpace,
                  ButtonAuthWidget(
                    onTap: (){},
                    colorbutton: AppColors.primary,
                    colorText: AppColors.white,
                    text: AppString.signUp,
                  ),
                  14.verticalSpace,
                  TextButtonAuthWidget(
                    colorText: AppColors.primary,
                    text: AppString.haveAccount,
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                    },
                    colorbutton: AppColors.primary,

                  ),
                ],
              ),
            ),
          ),
        );

  }
}
