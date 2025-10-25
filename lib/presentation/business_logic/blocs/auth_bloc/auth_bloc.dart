
import 'package:bloc/bloc.dart';

import '../../../../data/session_manager/user_prefs_manager.dart';
import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserPrefsManager prefsManager;

  AuthBloc(this.prefsManager) : super(AuthInitialized()) {
    on<AppStarted>((event, emit) async {
      try {
        final bool firstIntro = await prefsManager.isFirstIntroPreview();
        final bool hasToken = await prefsManager.hasToken();
        final token = await prefsManager.getToken();
        final userName = await prefsManager.getUserName();
        final designation = await prefsManager.getDesignation();
        final employeeId = await prefsManager.getEmployeeId();
        final email = await prefsManager.getEmail();
        final deptName = await prefsManager.getDepartmentName();
        final mobile = await prefsManager.getMobile();
        final role = await prefsManager.getLoginType();
        // final projectCode = await prefsManager.getProjectCode();
        final bool notificationEnabled = await prefsManager.hasNotification();

        emit(AuthLoading());

        if (firstIntro) {
          print('first intro is $firstIntro');
          if (hasToken) {
            print('has intro is $firstIntro');
            emit(AuthAuthorized(
              email: email,
              token: token,
              userName: userName,
              designation: designation,
              employeeId: employeeId,
              notificationEnabled: notificationEnabled,
              deptName: deptName,
              mobile: mobile,
              role: role
              // projectCode: projectCode,
            ));
          } else {
            print('auth intro is $firstIntro');
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
