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
  final bool isAdmin;
  final String userName;
  final String designation;
  final String employeeId;
  final bool notificationEnabled;
  final String email;
  final String deptName;
  final String mobile;
  final String role;
  // final String projectCode;

  AuthAuthorized({
    required this.token,
    required this.isAdmin,
    required this.userName,
    required this.employeeId,
    required this.notificationEnabled,
    required this.designation,
    required this.email,
    required this.deptName,
    required this.mobile,
    required this.role
    // required this.projectCode,
  });

  @override
  List<Object> get props =>
      [token, isAdmin, userName, designation, deptName, email, employeeId, role];

  @override
  String toString() =>
      'LoggedIn { token: $token, user status: $isAdmin, user name: $userName}';
}

class FirstIntroView extends AuthState {}

class AuthLoading extends AuthState {}
