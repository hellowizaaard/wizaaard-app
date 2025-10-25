import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../config/theme/app_theme.dart';

class AdminTabbedView extends StatefulWidget {
  final List<Widget> screen;

  AdminTabbedView({super.key, required this.screen});

  @override
  State<AdminTabbedView> createState() => _AdminTabbedViewState(screens: screen);
}

class _AdminTabbedViewState extends State<AdminTabbedView> {
  int _selectedIndex = 0;
  final List<Widget> screens;

  _AdminTabbedViewState({required this.screens});

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
              color: Color(0xfff8696BB),
              activeColor: AppColorTheme.primary,
              //iconSize: 24,
              // tab button border

              tabBorderRadius: 12,
              tabBackgroundColor: AppColorTheme.primary_light,
              gap: 4,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.table_bar_outlined,
                  text: 'Meeting',
                ),
                GButton(
                  icon: Icons.meeting_room,
                  text: 'Rooms',
                ),
                GButton(
                  icon: Icons.settings,
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
