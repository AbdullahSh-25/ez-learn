import 'package:ez_learn/core/common/injection/injection.dart';
import 'package:ez_learn/core/common/widgets/bottom_sheet.dart';
import 'package:ez_learn/features/auth/data/datasources/local/auth_local.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/card_sign_up.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/dropdown_widget.dart';
import 'package:ez_learn/features/auth/presentation/ui/widget/stack_widget.dart';
import 'package:ez_learn/features/edit_profile/presentation/ui/state/bloc/profile_bloc.dart';
import 'package:ez_learn/features/edit_profile/presentation/widget/photo_profile.dart';
import 'package:ez_learn/features/edit_profile/presentation/widget/text_fieldEdit.dart';
import 'package:ez_learn/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/strings/app_string.dart';

class InfoEditProfile extends StatelessWidget {
  const InfoEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController firstNameTextController = TextEditingController()..text = getIt<AuthLocal>().getUser()!.firstName;
    final TextEditingController lastNameTextController = TextEditingController()..text = getIt<AuthLocal>().getUser()!.lastName;
    final TextEditingController numberStudentTextController = TextEditingController()..text = getIt<AuthLocal>().getUser()!.universityId;

    var listYear = const [
      AppString.year1,
      AppString.year2,
      AppString.year3,
      AppString.year4,
      AppString.year5,
    ];

    int year = getIt<AuthLocal>().getUser()!.year;

    String selectedAvatar = getIt<AuthLocal>().getUser()!.avatarUrl;
    var avatarList = [Assets.imagesBoy1, Assets.imagesBoy2, Assets.imagesGirl1, Assets.imagesGirl2];

    return Form(
      key: formKey,
      child: Padding(
        padding: REdgeInsetsDirectional.only(start: 20, end: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                30.verticalSpace,
                StatefulBuilder(
                  builder: (context, setState) {
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

                25.verticalSpace,
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
                14.verticalSpace,
                TextFormFieldWidget(
                  lable: AppString.lastName,
                  myController: lastNameTextController,
                  valid: (String? Value) {
                    if (Value!.isEmpty) {
                      return AppString.lastName;
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
                14.verticalSpace,
                // const DropdownWidget(
                //   hintText: "المواد المختارة",
                //   typeDrop: true,
                // ),
                20.verticalSpace,

                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                            EditProfileEvent(
                              firstName: firstNameTextController.text,
                              lastName: lastNameTextController.text,
                              universityId: numberStudentTextController.text,
                              year: year,
                              avtarUrl: selectedAvatar,
                            ),
                          );
                    },
                    child: const Text(AppString.saveModifcations),
                  ),
                ),
                15.verticalSpace,
                FractionallySizedBox(
                  widthFactor: 1,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(AppString.changePassword),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
