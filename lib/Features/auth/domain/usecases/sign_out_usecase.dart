import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/user_repository.dart';

@lazySingleton
class SignOutUseCase {
  final UserRepository repository;

  SignOutUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.signOut();
  }
}
