
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/List_Lectures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/appBar_lectures.dart';

class LecturesPages extends StatelessWidget {
  const LecturesPages({Key? key}) : super(key: key);
  static const routerName = '/LecturesPages';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            45.verticalSpace,
             const CustomAppBar( text: 'نظرية المعلومات',),
            3.verticalSpace,
            Center(
              child: Text('محاضرات النظري', style: Theme.of(context).textTheme.titleMedium,),
            ),
            RSizedBox(
              width: double.infinity,
              height: 700.h,
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) =>  ListLectures(
                    title: "نظرية المعلومات ",
                    subTitle:'المحاضرة الثانية',
                    icon: Icon(
                      Icons.favorite,
                    ),
                  )

              ),
            ),

          ],
        ),
      ),
    );
  }
}