import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/Strings/failures.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/lon_in_usecase.dart';
import '../../../domain/usecases/sign_out_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInInUseCase logIn;
  final SignUpUseCase signUp;
  final SignOutUseCase signOut;
  AuthBloc({
    required this.logIn,
    required this.signUp,
    required this.signOut,
  }) : super(
          const AuthState(
            status: AuthStatus.initial,
            message: "",
          ),
        ) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is LogInEvent) {
          emit(state.copyWith(status: AuthStatus.loading));

          final failureOrDoneMessage = await logIn(event.user);

          emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
        } else if (event is SignUpEvent) {
          emit(state.copyWith(status: AuthStatus.loading));

          final failureOrDoneMessage = await signUp(event.user);

          emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
        } else if (event is SignOutEvent) {
          emit(state.copyWith(status: AuthStatus.loading));

          final failureOrDoneMessage = await signOut();

          emit(_eitherDoneMessageOrErrorState(failureOrDoneMessage));
        }
      },
    );
  }

  AuthState _eitherDoneMessageOrErrorState(Either<Failure, Unit> either) {
    return either.fold(
      (failure) => state.copyWith(
        message: _mapFailureToMessage(failure),
        status: AuthStatus.failure,
      ),
      (_) => state.copyWith(
        status: AuthStatus.loaded,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure _:
        return OFFLINE_FAILURE_MESSAGE;
      case UserNotFoundFailure _:
        return USER_NOT_FOUND_MESSAGE;
      case WrongPasswordFailure _:
        return WRONG_PASSWORD_MESSAGE;
      case WeakPasswordFailure _:
        return WEAK_PASSWORD_MESSAGE;
      case EmailInUseFailure _:
        return EMAIL_IN_USE_MESSAGE;
      default:
        return "Unexpected Error , please try again later .";
    }
  }
}
