part of 'login_cubit.dart';

enum AuthStatus {
  unknow,
  auth,
  unauth,
}

class LoginState extends Equatable {
  final AuthStatus status;

  const LoginState._({this.status = AuthStatus.unknow});

  const LoginState.auth() : this._(status: AuthStatus.auth);

  const LoginState.unauth() : this._(status: AuthStatus.unauth);

  @override
  List<Object?> get props => [status];
}
