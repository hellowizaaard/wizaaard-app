import 'package:equatable/equatable.dart';

abstract class AuthEvent2 extends Equatable {
  const AuthEvent2();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent2 {}

class LoggedOut extends AuthEvent2 {}
