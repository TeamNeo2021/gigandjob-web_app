import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Models/employer.dart';
import 'package:gigandjob_web_app/Dominio/Repositories/employer_repository.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit_state.dart';

var _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class EmployerCubit extends Cubit<EmployerCubitState> {
  EmployerRepository repository;
  EmployerCubit({required this.repository, employer})
      : super(EmployerCubitState(employer: employer ?? Employer.empty())) {
    update((_) {});
  }

  update(void Function(Employer employer) updateFn) {
    var errors = <String, String>{};
    updateFn(state.employer);

    if (state.employer.name.trim().isEmpty) {
      errors["name"] = "The name cannot be empty";
    }
    if (state.employer.description.trim().isEmpty) {
      errors["description"] = "The description cannot be empty";
    }
    if (state.employer.latitude < -90 || state.employer.latitude > 90) {
      errors["latitude"] = "The latitude must be between [-90, 90]";
    }
    if (state.employer.longitude < -90 || state.employer.longitude > 90) {
      errors["longitude"] = "The longitude must be between [-90, 90]";
    }
    if (state.employer.mail.trim().isEmpty) {
      errors["mail"] = "The email cannot be empty";
    }
    if (state.employer.phoneArea.trim().isEmpty) {
      errors["phoneArea"] = "The phone area cannot be empty";
    }
    if (state.employer.rif.trim().isEmpty) {
      errors["rif"] = "The rif cannot be empty";
    }
    if (state.employer.phone.trim().isEmpty) {
      errors["phone"] = "The phone cannot be empty";
    }
    if (state.employer.comDesignation.trim().isEmpty) {
      errors["comDesignation"] = "The comercial designation cannot be empty";
    }
    if (state.employer.rif.length > 11) {
      errors["rif"] = "The rif cannot have more than 11 digits";
    }
    if (state.employer.phoneArea.length > 2) {
      errors["phoneArea"] = "The phone area cannot have more than two digits";
    }
    if (state.employer.name.length > 20) {
      errors["name"] = "The name cannot be greater than 20 characters";
    }
    if (!_emailRegex.hasMatch(state.employer.mail)) {
      errors["mail"] = "The email given is invalid";
    }
    if (state.employer.description.length > 500) {
      errors["description"] =
          "The description cannot be greater than 500 characters";
    }

    if (errors.isNotEmpty) {
      emit(state.invalidate(errors));
    } else {
      emit(state.idle());
    }
  }

  String? getError(String key) {
    return state.errors[key];
  }

  submit() async => Future.sync(() async {
        if (state.state != EmployerCubitStateChoice.posting &&
            state.state != EmployerCubitStateChoice.invalid) {
          emit(state.post());
          await repository.save(state.employer).whenComplete(() {
            emit(state.success());
          }).catchError((err) {
            emit(state.error(err));
            return "Failure";
          });
        }
      });

  isPosting() {
    return state.state == EmployerCubitStateChoice.posting;
  }
}
