import 'package:ez_learn/core/common/widgets/bottom_sheet.dart';
import 'package:ez_learn/features/auth/presentation/state/bloc/auth_bloc.dart';
import 'package:ez_learn/features/auth/presentation/ui/screen/sign_in.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/button_auth_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/dropdown_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/stack_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/text_button_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/text_field_widget.dart';
import 'package:ez_learn/features/root/presentation/ui/screen/root_screen.dart';
import 'package:ez_learn/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/config/theme/colors.dart';
import '../../../../../core/constant/strings/app_string.dart';

class CardSignUp extends StatelessWidget {
  const CardSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordTextController = TextEditingController();
    final TextEditingController passwordConfirmTextController = TextEditingController();
    final TextEditingController firstNameTextController = TextEditingController();
    final TextEditingController lasttNameTextController = TextEditingController();
    final TextEditingController numberStudentTextController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    int year = -1;
    var listYear = const [
      AppString.year1,
      AppString.year2,
      AppString.year3,
      AppString.year4,
      AppString.year5,
    ];
    String selectedAvatar = '';
    var avatarList = [Assets.imagesBoy1, Assets.imagesBoy2, Assets.imagesGirl1, Assets.imagesGirl2];

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess()) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RootScreen(),
              ));
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
              padding: REdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    AppString.signUp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      print('dmsaldaslndlkkas');
                      return StackWidget(
                        avatar: selectedAvatar,
                        onTap: () {
                          showCustomBottomSheet(
                            context: context,
                            child: Column(
                              children: [
                                Text(
                                  'الرجاء اختيار الأفاتار الخاص بك',
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int i = 0; i < avatarList.length; i++)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedAvatar = avatarList[i];
                                          });
                                        },
                                        child: CircularAvatar(
                                          avatar: avatarList[i],
                                          isSelected: selectedAvatar == avatarList[i],
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  22.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.name,
                    myController: firstNameTextController,
                    valid: (String? Value) {
                      if (Value!.isEmpty) {
                        return AppString.yourName;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.lastName,
                    myController: lasttNameTextController,
                    valid: (String? Value) {
                      if (Value!.isEmpty) {
                        return AppString.yourName;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
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
                  StatefulBuilder(
                    builder: (context, setState) => DropDownWidget(
                      items: listYear
                          .map((e) => DropdownMenuItem(
                                value: listYear.indexWhere((element) => element == e) + 1,
                                child: Text(e),
                              ))
                          .toList(),
                      value: year != -1 ? year : null,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            year = value;
                          });
                        }
                      },
                    ),
                  ),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.password,
                    myController: passwordTextController,
                    valid: (String? Value) {
                      if (Value!.isEmpty || Value!.length < 6) {
                        return AppString.passwordWrong;
                      }
                      return null;
                    },
                    isNumber: false,
                  ),
                  20.verticalSpace,
                  TextFormFieldWidget(
                    lable: AppString.passwordConfirm,
                    myController: passwordConfirmTextController,
                    valid: (String? Value) {
                      if (passwordTextController.text != Value) {
                        return AppString.confirmYourPasswordisWrong;
                      }
                    },
                    isNumber: false,
                  ),
                  38.verticalSpace,
                  ButtonAuthWidget(
                    onTap: () {
                      final isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) {
                        context.read<AuthBloc>().add(SignUpEvent(
                              firstName: firstNameTextController.text,
                              lastName: lasttNameTextController.text,
                              password: passwordTextController.text,
                              universityId: numberStudentTextController.text,
                              avatar: selectedAvatar,
                            ));
                      }
                    },
                    colorbutton: AppColors.primary,
                    colorText: AppColors.white,
                    child: state.status.isLoading()
                        ? Center(
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: const CircularProgressIndicator(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text(AppString.signUp,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 20.sp,
                                  color: AppColors.white,
                                )),
                  ),
                  14.verticalSpace,
                  TextButtonAuthWidget(
                    colorText: AppColors.primary,
                    text: AppString.haveAccount,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                    },
                    colorbutton: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircularAvatar extends StatelessWidget {
  final String avatar;
  final bool isSelected;

  const CircularAvatar({
    super.key,
    required this.avatar,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.r,
      height: 70.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: isSelected ? Border.all(color: AppColors.green, width: 2) : null,
      ),
      child: Image.asset(avatar),
    );
  }
}
