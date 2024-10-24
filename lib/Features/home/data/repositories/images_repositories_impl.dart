// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/image_entity.dart';
import '../../domain/repositories/image_repositories.dart';
import '../datasources/images_remote_data_source.dart';
import '../models/image_model.dart';

@LazySingleton(as: ImageRepository)
class UrlsRepositoryImpl implements ImageRepository {
  final ImagesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UrlsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<ImageEntity>>> getUrls() async {
    if (await networkInfo.isConnected) {
      try {
        final List<ImageModel> remoteImages = await remoteDataSource.getUrls();

        return Right(remoteImages);
      } on ServerException {
        Left(ServerFailure());
      } catch (e) {
        print("=========================================$e");
      }
    }
    return Left(ServerFailure());
  }
}
