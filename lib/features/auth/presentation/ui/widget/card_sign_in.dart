import 'package:ez_learn/features/auth/presentation/state/bloc/auth_bloc.dart';
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_up.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/text_field_widget.dart';
import 'package:ez_learn/features/root/presentation/ui/screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../../../../../core/constant/strings/app_string.dart';
import 'button_auth_widget.dart';

class CardSignIn extends StatelessWidget {
  const CardSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordTextController = TextEditingController();
    final TextEditingController numberStudentTextController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    const bool hasAccount = true;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RootScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.all(const Radius.circular(24).w), side: const BorderSide(color: AppColors.primary)),
            elevation: 15,
            child: Padding(
              padding: REdgeInsetsDirectional.only(start: 20, end: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    AppString.signIn,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  46.verticalSpace,
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
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.password,
                    myController: passwordTextController,
                    valid: (String? Value) {
                      if (Value!.isEmpty || Value.length < 4) {
                        return AppString.passwordWrong;
                      }
                      return null;
                    },
                    isNumber: false,
                  ),
                  64.verticalSpace,
                  ButtonAuthWidget(
                    onTap: () {
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (!isValid) {
                        return;
                      }
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              password: passwordTextController.text,
                              univercityId: numberStudentTextController.text,
                            ),
                          );
                    },
                    colorbutton: AppColors.primary,
                    colorText: AppColors.white,
                    text: AppString.signIn,
                  ),
                  16.verticalSpace,
                  ButtonAuthWidget(
                    colorText: AppColors.primary,
                    colorbutton: AppColors.white,
                    text: AppString.signUp,
                    onTap: () {
                      if (hasAccount) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      }
                    },
                  ),
                  85.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
