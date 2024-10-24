// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String url;
  final String imageName;
  const ImageEntity({
    required this.url,
    required this.imageName,
  });

  @override
  List<Object?> get props => [
        url,
        imageName,
      ];
}
