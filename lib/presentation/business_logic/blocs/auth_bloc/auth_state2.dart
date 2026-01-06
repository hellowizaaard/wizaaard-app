import 'package:equatable/equatable.dart';

abstract class AuthState2 extends Equatable {
  @override
  List<Object> get props => [];

  get token => null;
}

class AuthInitialized extends AuthState2 {}

class AuthUnAuthorized extends AuthState2 {}

class AuthAuthorized extends AuthState2 {
  final String token;
  final String userName;
  final bool notificationEnabled;
  final String email;
  final String deptName;
  final String mobile;
  // final String projectCode;

  AuthAuthorized({
    required this.token,
    required this.userName,
    required this.notificationEnabled,
    required this.email,
    required this.deptName,
    required this.mobile,
    // required this.projectCode,
  });

  @override
  List<Object> get props =>
      [token, userName, deptName, email];

  @override
  String toString() =>
      'LoggedIn { token: $token, user status:, user name: $userName}';
}

class FirstIntroView extends AuthState2 {}

class AuthLoading2 extends AuthState2 {}
