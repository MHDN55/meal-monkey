import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends ImageEntity {
  const ImageModel({required super.url, required super.imageName});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
