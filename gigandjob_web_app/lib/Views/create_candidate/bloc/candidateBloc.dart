import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Models/Candidate.dart';
import 'package:gigandjob_web_app/Dominio/Repositories/CandidateRepository.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateStates.dart';

var _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class CandidateCubit extends Cubit<CandidateState> {
  CandidateRepository repository;
  CandidateCubit({required this.repository, candidate})
      : super(CandidateState(candidate: candidate ?? Candidate.empty())) {
    update((_) {});
  }

  update(void Function(Candidate employer) updateFn) {
    var errors = <String, String>{};
    updateFn(state.candidate);

    if (state.candidate.name.trim().isEmpty) {
      errors["name"] = "The name cannot be empty";
    }
    if (state.candidate.lastname.trim().isEmpty) {
      errors["lastname"] = "The last name cannot be empty";
    }
    if (state.candidate.phoneCode.trim().isEmpty) {
      errors["phoneCode"] = "The phone code cannot be empty";
    }
    if (state.candidate.phoneNumber.trim().isEmpty ||
        (state.candidate.phoneNumber.length < 7 ||
            state.candidate.phoneNumber.length > 7)) {
      errors["phoneNumber"] =
          "The phone number cannot be empty or  lenght has to be 7 digits";
    }
    if (state.candidate.email.trim().isEmpty) {
      errors["email"] = "The email cannot be empty";
    }
    if (state.candidate.birthDate.trim().isEmpty ||
        ((DateTime.now().year -
                DateTime.parse(state.candidate.birthDate).year) <
            18)) {
      errors["birthDate"] = "The birth date cannot be empty";
    }
    if (state.candidate.password.trim().isEmpty) {
      errors["password"] = "The password date cannot be empty";
    }
    if (state.candidate.latitude.trim().isEmpty ||
        (double.parse(state.candidate.latitude) >= 90 ||
            double.parse(state.candidate.latitude) <= -90)) {
      errors["latitude"] = "The latitude cannot be >90 or <-90";
    }
    if (state.candidate.longitude.trim().isEmpty ||
        (double.parse(state.candidate.longitude) >= 90 ||
            double.parse(state.candidate.longitude) <= -90)) {
      errors["longitude"] = "The longitude cannot be >90 or <-90";
    }
    if (!_emailRegex.hasMatch(state.candidate.email)) {
      errors["mail"] = "The email given is invalid";
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
        if (state.State != CandidateStateChoice.posting &&
            state.State != CandidateStateChoice.invalid) {
          emit(state.post());
          await repository.save(state.candidate).whenComplete(() {
            emit(state.success());
          }).catchError((err) {
            print(err);
            emit(state.error(err));
            return "Failure";
          });
        }
      });

  isPosting() {
    return state.State == CandidateStateChoice.posting;
  }
}
