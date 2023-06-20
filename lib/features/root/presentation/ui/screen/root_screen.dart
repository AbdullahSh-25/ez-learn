import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/favourite/presentation/ui/screen/favourite_screen.dart';
import 'package:ez_learn/features/root/presentation/state/root_provider.dart';
import 'package:ez_learn/features/setting/presentation/ui/screen/setting._screen.dart';
import 'package:ez_learn/features/subject/presentation/ui/screen/subjects.dart';
import 'package:ez_learn/home/presentation/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static const routeName = '/root';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _pages = [
    // const HomeScreen(),
    const SubjectScreen(),
    const FavouriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider<RootProvider>(
        create: (context) => RootProvider(),
        child: Consumer<RootProvider>(
          builder: (context, value, child) => Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: value.pageController,
              children: _pages,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(color: AppColors.primary),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  onTap: (index) => value.selectPage(index),
                  backgroundColor: AppColors.white,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: AppColors.grey,
                  currentIndex: value.seletedPageIndex,
                  showUnselectedLabels: true,
                  items: const [
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.home),
                    //   label: 'الرئيسية',
                    // ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book_sharp),
                      label: 'المواد',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'المفضلة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'الإعدادات',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
