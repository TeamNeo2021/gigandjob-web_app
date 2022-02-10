import 'dart:convert';
import 'dart:io';
import '../Models/Candidate.dart';
import '../Repositories/CandidateRepository.dart';
import 'package:http/http.dart' as http;

class CandidateService implements CandidateRepository {
  @override
  Future<String> save(Candidate candidate) async {
    var uri = Uri.parse("http://localhost:5000/Candidate");
    var response = await http.post(uri,
        body: jsonEncode(candidate),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    return response.body;
  }
}
