import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../repositories/repositories.dart';
import '../../repositories/models/models.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final IFactRepository factRepository;
  final IImageRepository imageRepository;
  FactBloc({@required this.factRepository, this.imageRepository})
      : super(Initial());

  @override
  Stream<FactState> mapEventToState(
    FactEvent event,
  ) async* {
    if (event is RequestFact) {
      yield* _mapRequestedFact(event);
    }
  }

  Stream<FactState> _mapRequestedFact(FactEvent jokeEvent) async* {
    yield Loading();
    try {
      Fact fact = await factRepository.getRamdomFact();
      ImageModel image = await imageRepository.getRamdomImage();
      yield Loaded(fact: fact, image: image);
    } catch (_) {
      yield Failure();
    }
  }
}
