// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../models/user_model.dart';

typedef SignInOrSignUpOrSignOut = Future<Unit> Function();

@LazySingleton(as: UserRepository)
class UserRepositoryImp implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> logIn(UserEntity user) async {
    UserModel userModel = UserModel(
      email: user.email,
      password: user.password,
      name: user.name,
    );
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.logIn(userModel);
        await localDataSource.cachingUserLogedIn(true);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(
      email: user.email,
      password: user.password,
      name: user.name,
    );
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signUp(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
    // return await (_getStatue(() async {
    //   return await remoteDataSource.signUp(userModel);
    // }));
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signOut();
        await localDataSource.cachingUserLogedIn(false);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  // Future<Either<Failure, Unit>> _getStatue(
  //     Future<Unit> Function() signInOrSignUpOrSignOut) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       signInOrSignUpOrSignOut;
  //       return const Right(unit);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }
}
