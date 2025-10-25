import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:weebird_app/presentation/widgets/user_info.dart';

import '../../config/theme/app_theme.dart';

PreferredSize buildAppBarHome(
  BuildContext context, {
  required String userName,
  required String designation,
  required String email,
  required String deptName,
  required String employeeId,
  required String mobile,
  required String role,
  required int badgeCount,
}) {
  // final bool isDoubleDigit = badgeCount.length >= 2;
  // final double endPosition = isDoubleDigit ? -3 : 0;
  // final double edgepadding = isDoubleDigit ? 3 : 6;
  return PreferredSize(
      preferredSize:
          const Size.fromHeight(70.0), // Set the preferred height here
      child: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: badgeCount > 0
                ? badges.Badge(
                    position: badges.BadgePosition.topEnd(
                        top: -4, end: -2), // Position the badge at the top-end
                    badgeContent: Text(
                      badgeCount.toString(),
                      style: TextStyle(color: Colors.white),
                    ), // Ensure text is visible
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.red,
                      padding:
                          EdgeInsets.all(4), // Adjust padding for the badge
                      borderRadius: BorderRadius.circular(
                          12), // Adjust radius for circle shape
                      elevation: 0,
                    ),
                    child: IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        size: 30,
                      ),
                      color: AppColorTheme.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                    ),
                    color: AppColorTheme.white,
                  ),
          ),
        ],
        leading: Container(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfo(
                        userName: userName,
                        designation: designation,
                        email: email,
                        deptName: deptName,
                        employeeId: employeeId,
                        mobile: mobile,
                        // projectCode: projectCode,
                      )));
            },
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                // Make the background transparent
                child: Image.asset(
                  'assets/logo/user.png',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft, // Align title to the left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: AppColorTheme.appTheme.primaryColor,
      ));
}

PreferredSize buildAppBar(BuildContext context, {required String title}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      // Set the preferred height here
      child: AppBar(
        elevation: 2,
        shadowColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          // Customize the color here
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColorTheme.white),
        ),
        backgroundColor: AppColorTheme.primary,
      ));
}
