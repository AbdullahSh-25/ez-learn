import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/quiz/presentation/cubit_quiz/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/constant/strings/app_string.dart';
import '../widget/question_widget.dart';

class AddQuestion extends StatelessWidget {
  AddQuestion({Key? key}) : super(key: key);
  final form = FormGroup({
    'question': FormControl<String>(),
    'answer1': FormControl<String>(),
    'answer2': FormControl<String>(),
    'answer3': FormControl<String>(),
    'answer4': FormControl<String>(),
    'hint': FormControl<String>(),
  });
  final TextEditingController questionController=TextEditingController();
  final TextEditingController answer1Controller=TextEditingController();
  final TextEditingController answer2Controller=TextEditingController();
  final TextEditingController answer3Controller=TextEditingController();
  final TextEditingController answer4Controller=TextEditingController();
  final TextEditingController hintController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: REdgeInsetsDirectional.only(top: 50,start: 20,end: 20,bottom: 5),
                child: ReactiveForm(
                  formGroup:form ,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.addQuestion,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        20.verticalSpace,
                        Text(
                          AppString.question,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 22.sp,
                              color: AppColors.primary
                          ),
                        ),
                        7.verticalSpace,
                        QuestionWidget(form: 'question', controller: questionController,),
                        7.verticalSpace,
                        Text(
                          AppString.options,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 22.sp,
                              color: AppColors.primary
                          ),
                        ),
                        QuestionWidget(
                            form: 'answer1',
                            controller: answer1Controller,
                            icon: context.read<QuizCubit>().isCheck[0]?
                            Icons.check_circle_rounded:Icons.circle_outlined,
                            onTap: (){  context.read<QuizCubit>().changePasswordVisibility(0);}),
                        QuestionWidget(
                            form: 'answer2',
                            controller: answer2Controller,
                            icon: context.read<QuizCubit>().isCheck[1]?
                            Icons.check_circle_rounded:Icons.circle_outlined,
                            onTap: (){  context.read<QuizCubit>().changePasswordVisibility(1);}),
                        QuestionWidget(
                            form: 'answer3',
                            controller: answer3Controller,
                            icon: context.read<QuizCubit>().isCheck[2]?
                            Icons.check_circle_rounded:Icons.circle_outlined,
                            onTap: (){  context.read<QuizCubit>().changePasswordVisibility(2);}),
                        QuestionWidget(
                            form: 'answer4',
                            controller: answer4Controller,
                            icon: context.read<QuizCubit>().isCheck[3]?
                            Icons.check_circle_rounded:Icons.circle_outlined,
                            onTap: (){  context.read<QuizCubit>().changePasswordVisibility(3);}),
                        7.verticalSpace,
                        Text(
                          AppString.hint,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 22.sp,
                              color: AppColors.primary
                          ),
                        ),
                        QuestionWidget(form: 'hint', controller: hintController,),
                        FractionallySizedBox(
                            widthFactor: 1,
                            child: ElevatedButton(onPressed: (){

                            }, child: Text(AppString.send)))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }}