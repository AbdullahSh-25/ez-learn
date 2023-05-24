import 'package:ez_learn/core/common/config/theme/colors.dart';
import 'package:ez_learn/features/favourite/presentation/ui/screen/favourite_screen.dart';
import 'package:ez_learn/features/setting/presentation/ui/screen/setting._screen.dart';
import 'package:ez_learn/features/subject/presentation/ui/screen/subjects.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const RootScreen(),
      'title': 'الرئيسية',
    },
    {
      'page': const SubjectScreen(),
      'title': 'المواد',
    },
    {
      'page': const FavouriteScreen(),
      'title': 'المفضلة',
    },
    {
      'page': const SettingScreen(),
      'title': 'الإعدادات',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'المواد'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'المفضلة'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الإعدادات'
          ),
        ],
      ),
    );
  }
}
