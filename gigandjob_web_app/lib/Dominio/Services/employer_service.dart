import 'dart:convert';
import 'dart:io';
import '../Models/employer.dart';
import '../Repositories/employer_repository.dart';
import 'package:http/http.dart' as http;

class EmployerService implements EmployerRepository {
  @override
  Future<String> save(Employer employer) async {
    var uri = Uri.parse("https://salvacion-git-job.herokuapp.com/employers");
    var response = await http.post(uri,
        body: jsonEncode(employer),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    return utf8.decode(response.bodyBytes);
  }
}
