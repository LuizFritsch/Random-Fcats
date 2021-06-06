part of 'fact_bloc.dart';

@immutable
abstract class FactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestFact extends FactEvent{
  
}
