import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';

class ImageApiClient {
  static const baseUrl = 'https://api.thecatapi.com/v1/images/search';
  final Dio dio;
  ImageApiClient({
    @required this.dio,
  });
  Future<ImageModel> getRandomImage() async {
    try {
      final response = await dio.get('$baseUrl');
      return ImageModel.fromJson(response.data);
    } catch (e) {
      throw Exception;
    }
  }
}