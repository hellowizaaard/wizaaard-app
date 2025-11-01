import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../config/theme/app_theme.dart';

class BottomTabbedView extends StatefulWidget {
  final List<Widget> screen;

  BottomTabbedView({super.key, required this.screen});

  @override
  State<BottomTabbedView> createState() => _BottomTabbedViewState(screens: screen);
}
class _BottomTabbedViewState extends State<BottomTabbedView> {
  int _selectedIndex = 0;
  final List<Widget> screens;

  _BottomTabbedViewState({required this.screens});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              haptic: true,

              backgroundColor: Colors.white,
              color: Color(0xff999999),
              activeColor: AppColorTheme.white,
              //iconSize: 24,
              // tab button border
              tabBorderRadius: 12,
              tabBackgroundColor: AppColorTheme.gray,
              gap: 4,
              selectedIndex: _selectedIndex,

              tabs: [
                GButton(
                  icon: Icons.circle,
                  leading: SvgPicture.asset(
                      'assets/icons/ic_home.svg',
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 0 ? Colors.white : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    height: 24,
                    width: 24),
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Image.asset(
                      'assets/icons/ic_resume.svg',
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                      height: 24,
                      width: 24),
                  text: 'Resume',
                ),
                 GButton(
                  icon: Icons.circle,
                  leading: Image.asset('assets/icons/ic_notification.svg',
                      color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                      height: 24,
                      width: 24),
                  text: 'Notification',
                ),
                 GButton(
                   icon: Icons.circle,
                   leading: Image.asset(
                       'assets/icons/ic_settings.svg',
                       color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                       height: 24,
                       width: 24),
                  text: 'Settings',
                ),
              ],
              onTabChange: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
