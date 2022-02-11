import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gigandjob_web_app/Dominio/Models/employer.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit_state.dart';
import 'package:gigandjob_web_app/Views/create_employer/create_employer_view.dart';
import 'package:mocktail/mocktail.dart';

import 'create_employer_bloc_unit_test.mocks.dart';

class MockEmployerCubit extends MockCubit<EmployerCubitState>
    implements EmployerCubit {}

void main() {
  group("CreateEmployerView", () {
    final cubit = EmployerCubit(repository: MockEmployerService());
    final state = EmployerCubitState(employer: Employer.empty());
    testWidgets("CreateEmployerView has a MaterialButton",
        (WidgetTester tester) async {
      final widget = CreateEmployerView();

      await tester.pumpWidget(BlocProvider<EmployerCubit>(
        create: (_) => cubit,
        child: MaterialApp(
          title: 'CreateEmployerView Test',
          home: Scaffold(body: widget),
        ),
      ));
      final button = find.byType(MaterialButton).first;

      expect(button, findsOneWidget);
    });

    testWidgets(
        "CreateEmployerView's name text field is invalid with empty employer name",
        (WidgetTester tester) async {
      final widget = CreateEmployerView();

      await tester.pumpWidget(
          BlocProvider<EmployerCubit>(
            create: (_) => cubit,
            child: MaterialApp(
              title: 'CreateEmployerView Test',
              home: Scaffold(body: widget),
            ),
          ),
          const Duration(minutes: 2));

      await tester.ensureVisible(find.byType(MaterialButton));
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      await expectLater(find.text("The name cannot be empty"), findsOneWidget);
    });

    testWidgets(
        "CreateEmployerView's description text field is invalid with empty employer description",
        (WidgetTester tester) async {
      final widget = CreateEmployerView();

      await tester.pumpWidget(
          BlocProvider<EmployerCubit>(
            create: (_) => cubit,
            child: MaterialApp(
              title: 'CreateEmployerView Test',
              home: Scaffold(body: widget),
            ),
          ),
          const Duration(minutes: 2));

      await tester.ensureVisible(find.byType(MaterialButton));
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      await expectLater(
          find.text("The description cannot be empty"), findsOneWidget);
    });

    testWidgets(
        "CreateEmployerView's email text field is invalid with empty employer email",
        (WidgetTester tester) async {
      final widget = CreateEmployerView();

      await tester.pumpWidget(
          BlocProvider<EmployerCubit>(
            create: (_) => cubit,
            child: MaterialApp(
              title: 'CreateEmployerView Test',
              home: Scaffold(body: widget),
            ),
          ),
          const Duration(minutes: 2));

      await tester.ensureVisible(find.byType(MaterialButton));
      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      await expectLater(
          find.text("The email given is invalid"), findsOneWidget);
    });
  });
}
