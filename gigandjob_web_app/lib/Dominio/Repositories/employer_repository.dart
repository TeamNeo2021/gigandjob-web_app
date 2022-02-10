import 'package:gigandjob_web_app/Dominio/Models/employer.dart';

abstract class EmployerRepository {
  Future<String> save(Employer employer);
}