import 'package:flutter/material.dart';
import 'models/models.dart';
import 'repositories.dart';

abstract class IImageRepository{
  Future<ImageModel> getRamdomImage() async{
  }
}
class ImageRepository extends IImageRepository{
  final ImageApiClient iac;

  ImageRepository({
    @required this.iac,
  });

  @override
  Future<ImageModel> getRamdomImage() async{
    return await iac.getRandomImage();
  }
}