import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../auth/data/datasources/user_local_data_source.dart';
import '../../../../onboarding/data/datasources/onboarding_local_data_source.dart';

part 'splash_event.dart';

part 'splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc()
      : super(
          const SplashState(
            status: SplashStatus.initial,
            isAuth: false,
            isOnboarding: false,
            // remoteMessage: RemoteMessage(),
          ),
        ) {
    on<SplashEvent>(
      (event, emit) async {
        if (event is GetCachedSplashEvent) {
          final isAuth = await UserLocalDataSourceImpl().getCachedLogedIn();

          final isOnboarding =
              await OnboardingLocalDataSourceImpl().getCachedOnboarding();

          await Future.delayed(const Duration(seconds: 2));
          // final RemoteMessage? remoteMessage =
          //     await FirebaseMessaging.instance.getInitialMessage();
          emit(
            state.copyWith(
              status: SplashStatus.loaded,
              isAuth: isAuth,
              isOnboarding: isOnboarding,
              // remoteMessage: remoteMessage,
            ),
          );
        }
      },
    );
  }
}
