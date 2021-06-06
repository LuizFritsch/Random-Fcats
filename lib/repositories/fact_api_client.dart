import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';

class FactApiClient {
  static const max_length_fact = 50;
  static const baseUrl = 'https://catfact.ninja/fact?max_length=$max_length_fact';
  final Dio dio;
  FactApiClient({
    @required this.dio,
  });
  Future<Fact> getRandomFact() async {
    try {
      final response = await dio.get('$baseUrl/');
      return Fact.fromJson(response.data);
    } catch (e) {
      throw Exception;
    }
  }
}