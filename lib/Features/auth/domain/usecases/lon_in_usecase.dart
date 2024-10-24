import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class LogInInUseCase {
  final UserRepository repository;

  LogInInUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await repository.logIn(user);
  }
}
