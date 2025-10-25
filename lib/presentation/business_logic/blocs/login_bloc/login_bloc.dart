import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../../data/session_manager/user_prefs_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final UserPrefsManager prefsManager;

  // final AuthBloc authBloc;

  LoginBloc(this.userRepository, this.prefsManager) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      try {
        emit(LoginLoading());

        if (event.employeeId.isEmpty || event.password.isEmpty) {
          emit(EmptyEntry());
        } else {
          final data =
              await userRepository.userLogin(event.employeeId, event.password);
          if (data.statusCode == 200) {
            prefsManager.setUserInfo(data.user!);
            emit(LoginSuccess(token: data.user!.apiToken));
          } else {
            emit(LoginFailure(error: data.message));
          }

          // authBloc.add(LoggedIn(token: token));
        }
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
