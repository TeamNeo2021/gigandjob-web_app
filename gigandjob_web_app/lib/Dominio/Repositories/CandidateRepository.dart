import 'package:gigandjob_web_app/Dominio/Models/Candidate.dart';

abstract class CandidateRepository {
  Future<String> save(Candidate candidate);
}
