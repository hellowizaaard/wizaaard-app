import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];

  get token => null;
}

class AuthInitialized extends AuthState {}

class AuthUnAuthorized extends AuthState {}

class AuthAuthorized extends AuthState {
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

class FirstIntroView extends AuthState {}

class AuthLoading extends AuthState {}
