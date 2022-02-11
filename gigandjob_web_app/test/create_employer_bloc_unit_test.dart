import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:gigandjob_web_app/Dominio/Models/employer.dart';
import 'package:gigandjob_web_app/Dominio/Services/employer_service.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit_state.dart';
import 'package:mockito/annotations.dart';

import 'create_employer_bloc_unit_test.mocks.dart';

@GenerateMocks([EmployerService])
void main() {
  final repo = MockEmployerService();
  updateEmployer(Employer employer) => employer.name = "Michael";
  updateEmployerSuccesfully(Employer employer) {
    employer.name = "Michael";
    employer.description = "Some description";
    employer.comDesignation = "Some designation";
    employer.latitude = 54;
    employer.longitude = 54;
    employer.mail = "michael@email.com";
    employer.phone = "4241956647";
    employer.phoneArea = "58";
    employer.rif = "J-23123123";
    employer.state = "Active";
  }

  group('EmployerCubit', () {
    blocTest(
        'emits [EmployerCubitState] with errors when the update is invalid',
        build: () => EmployerCubit(repository: repo),
        act: (EmployerCubit bloc) => bloc.update(updateEmployer),
        expect: () => [
              predicate<EmployerCubitState>((state) => state.errors.isNotEmpty)
            ]);
    blocTest('emits [EmployerCubitState] when the update is invalid',
        build: () => EmployerCubit(repository: repo),
        act: (EmployerCubit bloc) => bloc.update(updateEmployer),
        expect: () => [isA<EmployerCubitState>()]);
    blocTest('emits [EmployerCubitState] when the update is valid',
        build: () => EmployerCubit(repository: repo),
        act: (EmployerCubit bloc) => bloc.update(updateEmployerSuccesfully),
        expect: () => [isA<EmployerCubitState>()]);
    blocTest('emits [EmployerCubitState] when the update is valid',
        build: () => EmployerCubit(repository: repo),
        act: (EmployerCubit bloc) => bloc.update(updateEmployerSuccesfully),
        expect: () =>
            [predicate<EmployerCubitState>((state) => state.errors.isEmpty)]);
  });
}
