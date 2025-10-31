import 'package:flutter/material.dart';

import '../../data/session_manager/user_prefs_manager.dart';
import '../../main.dart';
import '../../presentation/views/auth/login_screen.dart';
import '../../presentation/views/settings/change_password_form.dart';
import '../../presentation/widgets/no_screen_found.dart';
import 'app_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
   // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    final UserPrefsManager userPrefsManager = UserPrefsManager();
    // final ChangePasswordRepository repository = ChangePasswordRepository();
    // final ResetPasswordRepository resetRepository = ResetPasswordRepository();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MyApp(),
        );

      case Pages.home:
        return MaterialPageRoute(
          builder: (context) => MyApp(),
        );

      case Pages.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            userPrefsManager: userPrefsManager,
            key: UniqueKey(),
          ),
        );

      case Pages.no_screen:
        return MaterialPageRoute(
          builder: (context) => NotFoundScreen(
            key: UniqueKey(),
          ),
        );


      // case Pages.participant:
      //   final args = settings.arguments as RoomData?;

      //   if (args != null) {
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return ParticipantSearch(filteredUsers: [], roomData: args, onUsersSelected: ,);
      //       },
      //     );
      //   }
      //   return _errorRoute();





      case Pages.change_pass:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordForm(
            key: UniqueKey(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => NotFoundScreen());
  }
}
