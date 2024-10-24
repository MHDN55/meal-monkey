import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/image_entity.dart';

abstract class ImageRepository {
  Future<Either<Failure, List<ImageEntity>>> getUrls();
}
