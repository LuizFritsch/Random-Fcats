import 'fact_api_client.dart';
import 'package:flutter/material.dart';
import 'models/models.dart';

abstract class IFactRepository{
  Future<Fact> getRamdomFact() async{
  }
}
class FactRepository extends IFactRepository{
  final FactApiClient fac;

  FactRepository({
    @required this.fac,
  });

  @override
  Future<Fact> getRamdomFact() async{
    return await fac.getRandomFact();
  }
}