import 'package:flutter/material.dart';
import 'package:weebird_app/presentation/widgets/user_info_details_widget.dart';

import '../../core/config/theme/app_theme.dart';
import 'appbar_widget.dart';

class UserInfo extends StatelessWidget {
  final userName;
  final email;
  final deptName;
  final mobile;

  const UserInfo({
    super.key,
    required this.userName,
    required this.email,
    required this.deptName,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              color: AppColorTheme.primary_light,
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.transparent,
                                // Make the background transparent
                                child: Image.asset(
                                  'assets/logo/user.png',
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                    UserInfoDetails(info: 'User Name', details: userName),
                    UserInfoDetails(info: 'Mobile No', details: mobile),
                    UserInfoDetails(info: 'Email', details: email),
                    UserInfoDetails(
                        info: 'Department Name', details: deptName),
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
