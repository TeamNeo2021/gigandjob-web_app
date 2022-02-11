import 'package:gigandjob_web_app/Dominio/Models/Candidate.dart';
import 'package:http/http.dart';

enum CandidateStateChoice { idle, posting, success, invalid, failure }

class CandidateState {
  Candidate candidate;
  CandidateStateChoice State;
  Map<String, String> errors;
  ClientException? submitError;

  CandidateState({required this.candidate})
      : State = CandidateStateChoice.idle,
        errors = {};

  CandidateState._(
      {required this.candidate,
      required this.State,
      required this.errors,
      this.submitError});

  invalidate(Map<String, String> errors) => CandidateState._(
      candidate: candidate, State: CandidateStateChoice.invalid, errors: {});

  post() => CandidateState._(
      candidate: candidate, State: CandidateStateChoice.posting, errors: {});

  success() => CandidateState._(
      candidate: candidate, State: CandidateStateChoice.success, errors: {});

  idle() => CandidateState._(
      candidate: candidate, State: CandidateStateChoice.idle, errors: {});

  error(ClientException err) => CandidateState._(
      candidate: candidate,
      State: CandidateStateChoice.failure,
      errors: errors,
      submitError: err);
}
