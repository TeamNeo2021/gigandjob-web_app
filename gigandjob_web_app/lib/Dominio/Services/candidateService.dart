import 'dart:convert';
import '../Models/Candidate.dart';
import '../Repositories/CandidateRepository.dart';
import 'package:http/http.dart' as http;

class CandidateService implements CandidateRepository {
  @override
  Future<String> save(Candidate candidate) async {
    var uri = Uri.parse("http://localhost:3000/candidates");
    var response = await http.post(uri, body: candidate.toJson());
    return utf8.decode(response.bodyBytes);
  }
}
