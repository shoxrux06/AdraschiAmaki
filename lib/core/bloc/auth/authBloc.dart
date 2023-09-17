import 'package:afisha_market/core/bloc/auth/authEvent.dart';
import 'package:afisha_market/core/bloc/auth/authState.dart';
import 'package:afisha_market/core/data/repository/auth_repository.dart';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthState()) {
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(isAuthenticating: true));
      try {
        emit(AuthState(status: AuthStatus.loading));
        final signInResponse =
            await _authRepository.signIn(event.context, event.signInRequest);
        signInResponse.when(
          success: (data) async {
            emit(
              state.copyWith(
                signInResponse: data,
                status: AuthStatus.success,
                isAuthenticated: true,
                isAuthenticating: false,
              ),
            );
            await LocalStorage.instance.setToken(data.token);
            await LocalStorage.instance.setUserId(data.user.id);
            await LocalStorage.instance.setUserName(data.user.username);
            await LocalStorage.instance.setUserPhone(data.user.phone);
          },
          failure: (failure) {
            emit(
              state.copyWith(
                  status: AuthStatus.error,
                  isErrorOccurred: true,
                  isAuthenticating: false
              ),
            );
          },
        );
      } catch (_) {
        emit(
          state.copyWith(
              status: AuthStatus.error,
              isErrorOccurred: true,
              isAuthenticating: false
          ),
        );
      }
    });
  }
}
