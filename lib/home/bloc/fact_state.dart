part of 'fact_bloc.dart';

@immutable
abstract class FactState extends Equatable {  
  @override
  List<Object> get props => [];
}

class Initial extends FactState {}
class Loading extends FactState {}
class Loaded extends FactState {
  final ImageModel image;
  final Fact fact;
  Loaded({@required this.fact, @required this.image});
  @override
  List<Object> get props => [fact,image];
}
class Failure extends FactState {}