import 'package:ez_learn/features/notification/ui/widget/List_notification.dart';
import 'package:flutter/material.dart';

import '../widget/appBar_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: BuildAppBarItem(context),
        body: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index) => const ListNotification(
              title: '#السنة الرابعة',
              subTitle:'#نظم_رقمية (العملي) - ملف_داعم2_معدلة' ,
          time: 'منذ ساعة',
            )
        ),
      ),
    );
  }
}
