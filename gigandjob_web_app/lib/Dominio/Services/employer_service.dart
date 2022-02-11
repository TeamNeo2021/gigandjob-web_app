import 'dart:convert';
import '../Models/employer.dart';
import '../Repositories/employer_repository.dart';
import 'package:http/http.dart' as http;

class EmployerService implements EmployerRepository {
  @override
  Future<String> save(Employer employer) async {
    var uri = Uri.parse("http://localhost:5000/employers");
    var response = await http.post(uri, body: employer.toJson());

    return utf8.decode(response.bodyBytes);
  }
}
