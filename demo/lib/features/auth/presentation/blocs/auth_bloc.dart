import 'package:demo/features/auth/data/datasources/auth_service.dart';
import 'package:demo/features/auth/domain/user.dart';
import 'package:demo/features/auth/presentation/blocs/auth_event.dart';
import 'package:demo/features/auth/presentation/blocs/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  
  AuthBloc() : super(InitialAuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingAuthState());
      await Future.delayed(Duration(milliseconds: 1000));
      try {
        User user = await AuthService().login(event.username, event.password);
        emit(SuccessAuthState(user: user));
      } catch (e) {
        emit(FailureAuthState(message: e.toString()));
      }
    });
  }
  
}