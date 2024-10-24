part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {
  final UserEntity user;
  const LogInEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SignUpEvent extends AuthEvent {
  final UserEntity user;
  const SignUpEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
