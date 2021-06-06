import 'package:flutter/material.dart';

class Fact{
  final String fact;
  //final String subCategory;

  Fact({
    @required this.fact,
    //@required this.subCategory,
  });

  static Fact fromJson(dynamic json) {
    return Fact(
      fact: json['fact'],
      //subCategory: json[1]['subcategory'],
    );
  }
}
