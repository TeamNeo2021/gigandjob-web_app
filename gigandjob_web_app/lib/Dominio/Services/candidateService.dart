import 'dart:convert';
import '../Models/Candidate.dart';
import '../Repositories/CandidateRepository.dart';
import 'package:http/http.dart' as http;

class CandidateService implements CandidateRepository {
  @override
  Future<String> save(Candidate candidate) async {
    var uri = Uri.parse("http://localhost:5000/Candidate/");
    var response = await http.post(uri, body: jsonEncode(candidate.toJson()));
    print(candidate.toJson());
    return utf8.decode(response.bodyBytes);
  }
}
