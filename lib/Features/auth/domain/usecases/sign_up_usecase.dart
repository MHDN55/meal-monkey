import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await repository.signUp(user);
  }
}
