import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/screens/news/news_list/news_list_screen.dart';
import 'package:notes_app/screens/notes/notes_list/notes_list_screen.dart';
import 'package:notes_app/screens/settings/settings_screen.dart';
import 'package:notes_app/theme/colors.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [NotesListScreen(), NewsListScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: AppColors.white);
            } else {
              return IconThemeData(color: AppColors.white50);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white);
            }
            return TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.white50);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.accentGrey,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/notes.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/notes.svg', color: AppColors.white50),
              label: 'Notes',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.white50),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/profile.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/profile.svg', color: AppColors.white50),
              label: 'Profile',
            ),

          ],
        ),
      ),
    );
  }
}
