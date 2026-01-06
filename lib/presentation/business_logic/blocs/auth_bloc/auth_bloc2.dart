
import 'package:bloc/bloc.dart';

import '../../../../data/session_manager/user_prefs_manager.dart';
import 'auth.dart';

class AuthBloc2 extends Bloc<AuthEvent2, AuthState2> {
  final UserPrefsManager prefsManager;

  AuthBloc2(this.prefsManager) : super(AuthInitialized()) {
    on<AppStarted>((event, emit) async {
      try {
        final bool firstIntro = await prefsManager.isFirstIntroPreview();
        final bool hasToken = await prefsManager.hasToken();
        final token = await prefsManager.getToken();
        final userName = await prefsManager.getUserName();
        final email = await prefsManager.getEmail();
        final deptName = await prefsManager.getDepartmentName();
        final mobile = await prefsManager.getMobile();
        // final projectCode = await prefsManager.getProjectCode();
        final bool notificationEnabled = await prefsManager.hasNotification();

        emit(AuthLoading2());

        if (firstIntro) {
          if (hasToken) {
            emit(AuthAuthorized(
              email: email,
              token: token,
              userName: userName,
              notificationEnabled: notificationEnabled,
              deptName: deptName,
              mobile: mobile
              // projectCode: projectCode,
            ));
          } else {
            emit(AuthUnAuthorized());

          }
        } else {
          emit(FirstIntroView());
        }
      } catch (e) {
        emit(AuthUnAuthorized());
      }
    });

    on<LoggedOut>((event, emit) async {
      prefsManager.deleteToken();

      // Navigator.of(context).pushAndRemoveUntil(
      //   Pages.login as Route<Object?>,
      //       (route) => false,
      // );

      emit(AuthUnAuthorized());
    });
  }

  void listen(Null Function(dynamic state) param0) {}
}
