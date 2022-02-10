part of 'candidatelist_bloc.dart';

@immutable
abstract class CandidatelistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CandidateFetched extends CandidatelistEvent {}
