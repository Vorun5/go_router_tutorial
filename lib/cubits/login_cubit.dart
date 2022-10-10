import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.unauth());

  void login() {
    emit(const LoginState.auth());
  }

  void logout() {
    emit(const LoginState.unauth());
  }
}
