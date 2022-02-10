part of 'candidatelist_bloc.dart';

enum CandidateStatus { initial, success, failure }

class CandidateState extends Equatable {
  const CandidateState({
    this.status = CandidateStatus.initial,
    this.candidates = const <Candidate>[],
    this.hasReachedMax = false,
  });

  final CandidateStatus status;
  final List<Candidate> candidates;
  final bool hasReachedMax;

  CandidateState copyWith({
    CandidateStatus? status,
    List<Candidate>? candidates,
    bool? hasReachedMax,
  }) {
    return CandidateState(
      status: status ?? this.status,
      candidates: candidates ?? this.candidates,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''CandidateState { status: $status, hasReachedMax: $hasReachedMax, posts: ${candidates.length} }''';
  }

  @override
  List<Object> get props => [status, candidates, hasReachedMax];
}
