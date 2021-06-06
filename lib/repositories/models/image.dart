import 'package:flutter/material.dart';

class ImageModel{
  final String url;

  ImageModel({
    @required this.url,
  });

  static ImageModel fromJson(dynamic json) {
    return ImageModel(
      url: json[0]['url'],
    );
  }
}
