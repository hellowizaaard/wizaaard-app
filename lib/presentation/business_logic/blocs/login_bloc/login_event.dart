part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {

  final String employeeId;
  final String password;

  const LoginButtonPressed({required this.employeeId, required this.password});

  @override
  List<Object> get props => [employeeId, password];

  @override
  String toString() =>
      'LoginButtonPressed { Email Id: $employeeId, password: $password }';
}
