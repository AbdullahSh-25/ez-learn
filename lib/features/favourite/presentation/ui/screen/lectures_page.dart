
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/List_Lectures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LecturesPages extends StatelessWidget {
  const LecturesPages({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            RSizedBox(
              width: double.infinity,
              height: 700.h,
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) =>   const ListLectures(
                    title: "نظرية المعلومات ",
                    subtitle:'المحاضرة الثانية',
                    isFavourite: true,
                    image: 'assets/images/photo_2023-06-24_04-25-03.jpg',
                  )

              ),
            ),

          ],
        ),
      ),
    );
  }
}