import 'package:gigandjob_web_app/Dominio/Models/employer.dart';
import 'package:http/http.dart';

enum EmployerCubitStateChoice { idle, posting, success, invalid, failure }

class EmployerCubitState {
  Employer employer;
  EmployerCubitStateChoice state;
  Map<String, String> errors;
  ClientException? submitError;

  EmployerCubitState({required this.employer})
      : state = EmployerCubitStateChoice.idle,
        errors = {};
  EmployerCubitState._(
      {required this.employer,
      required this.state,
      required this.errors,
      this.submitError});

  EmployerCubitState invalidate(Map<String, String> errors) =>
      EmployerCubitState._(
          employer: employer,
          state: EmployerCubitStateChoice.invalid,
          errors: errors);

  EmployerCubitState post() => EmployerCubitState._(
      employer: employer, state: EmployerCubitStateChoice.posting, errors: {});

  EmployerCubitState success() => EmployerCubitState._(
      employer: employer, state: EmployerCubitStateChoice.success, errors: {});

  EmployerCubitState idle() => EmployerCubitState._(
      employer: employer, state: EmployerCubitStateChoice.idle, errors: {});

  EmployerCubitState error(ClientException err) => EmployerCubitState._(
      employer: employer,
      state: EmployerCubitStateChoice.failure,
      errors: errors,
      submitError: err);
}
