import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/image_entity.dart';
import '../repositories/image_repositories.dart';

@lazySingleton
class GetImagessUseCase {
  final ImageRepository repository;
  GetImagessUseCase(this.repository);

  Future<Either<Failure, List<ImageEntity>>> call() async {
    return await repository.getUrls();
  }
}
