// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import 'core/network/network_info.dart' as _i10;
import 'Features/auth/data/datasources/user_local_data_source.dart' as _i9;
import 'Features/auth/data/datasources/user_remote_data_source.dart' as _i13;
import 'Features/auth/data/repositories/user_repository_impl.dart' as _i16;
import 'Features/auth/domain/repositories/user_repository.dart' as _i15;
import 'Features/auth/domain/usecases/lon_in_usecase.dart' as _i17;
import 'Features/auth/domain/usecases/sign_out_usecase.dart' as _i18;
import 'Features/auth/domain/usecases/sign_up_usecase.dart' as _i19;
import 'Features/auth/presentation/blocs/bloc/auth_bloc.dart' as _i20;
import 'Features/home/data/datasources/images_remote_data_source.dart' as _i8;
import 'Features/home/data/repositories/images_repositories_impl.dart' as _i12;
import 'Features/home/domain/repositories/image_repositories.dart' as _i11;
import 'Features/home/domain/usecases/get_images_use_case.dart' as _i14;
import 'Features/splash/presentation/blocs/splash/splash_bloc.dart' as _i3;
import 'injection_injectable_package.dart' as _i21;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.SplashBloc>(() => _i3.SplashBloc());
  gh.lazySingleton<_i4.InternetConnection>(
      () => registerModule.internetConnection);
  gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.prefs1);
  gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.sharedPreferences);
  gh.lazySingleton<_i7.GlobalKey<_i7.NavigatorState>>(
      () => registerModule.navigatorKey);
  gh.lazySingleton<_i8.ImagesRemoteDataSource>(
      () => _i8.ImagesRemoteDataSourceImpl());
  gh.lazySingleton<_i9.UserLocalDataSource>(
      () => _i9.UserLocalDataSourceImpl());
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(gh<_i4.InternetConnection>()));
  gh.lazySingleton<_i11.ImageRepository>(() => _i12.UrlsRepositoryImpl(
        remoteDataSource: gh<_i8.ImagesRemoteDataSource>(),
        networkInfo: gh<_i10.NetworkInfo>(),
      ));
  gh.lazySingleton<_i13.UserRemoteDataSource>(() =>
      _i13.UserRemoteDataSourceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i14.GetImagessUseCase>(
      () => _i14.GetImagessUseCase(gh<_i11.ImageRepository>()));
  gh.lazySingleton<_i15.UserRepository>(() => _i16.UserRepositoryImp(
        localDataSource: gh<_i9.UserLocalDataSource>(),
        remoteDataSource: gh<_i13.UserRemoteDataSource>(),
        networkInfo: gh<_i10.NetworkInfo>(),
      ));
  gh.lazySingleton<_i17.LogInInUseCase>(
      () => _i17.LogInInUseCase(repository: gh<_i15.UserRepository>()));
  gh.lazySingleton<_i18.SignOutUseCase>(
      () => _i18.SignOutUseCase(repository: gh<_i15.UserRepository>()));
  gh.lazySingleton<_i19.SignUpUseCase>(
      () => _i19.SignUpUseCase(repository: gh<_i15.UserRepository>()));
  gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
        logIn: gh<_i17.LogInInUseCase>(),
        signUp: gh<_i19.SignUpUseCase>(),
        signOut: gh<_i18.SignOutUseCase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i21.RegisterModule {}
