import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../widgets/appbar_widget.dart';
import '../bottom_tab_view/admin_tabbed_view.dart';
import '../room/room_screen.dart';
import '../settings/settings_view.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  final String userName;
  final String designation;
  final String email;
  final String deptName;
  final String employeeId;
  final String mobile;
  final String role;

  const MainScreen({
    super.key,
    required this.userName,
    required this.designation,
    required this.email,
    required this.deptName,
    required this.employeeId,
    required this.mobile,
    required this.role,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    const HomeScreen(),

    const RoomScreen(),
    const SettingsView(),
  ];



  @override
  void initState() {
    super.initState();
    // Log an analytics event when MainScreen is shown after user logs in
    _logMainScreenEvent();
    // Fetch the initial notification count

  }

  void _logMainScreenEvent() {
    // MainScreen.analytics.logEvent(
    //   name: 'main_screen_viewed',
    //   parameters: <String, dynamic>{
    //     'user_logged_in': true,
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child:
             buildAppBarHome(
              context,
              badgeCount: 9,
              userName: widget.userName,
              designation: widget.designation,
              email: widget.email,
              deptName: widget.deptName,
              employeeId: widget.employeeId,
              mobile: widget.mobile,
              role: widget.role,
            )

        ),

      body:AdminTabbedView(screen: screens)

    );
  }
}
