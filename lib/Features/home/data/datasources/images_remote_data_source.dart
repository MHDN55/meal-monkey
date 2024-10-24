import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/image_model.dart';

abstract class ImagesRemoteDataSource {
  Future<List<ImageModel>> getUrls();
}

@LazySingleton(as: ImagesRemoteDataSource)
class ImagesRemoteDataSourceImpl implements ImagesRemoteDataSource {
  @override
  Future<List<ImageModel>> getUrls() async {
    final List<ImageModel> imagesList = [];

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("images").get();

    final queryAfterMap = querySnapshot.docs;

    for (var doc in queryAfterMap) {
      imagesList.add(ImageModel.fromJson(doc.data()));
    }

    return imagesList;
  }
}
 