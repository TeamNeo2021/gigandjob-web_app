/*import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Repositories/CandidateRepository.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateBloc.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateStates.dart';

//import '../../Widgets/layout.dart';

const double spacingX = 24;
const double spacingY = 24;

class _CreateCandidateView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CandidateCubit>(context);
    final nameController = TextEditingController();
    final lastnameController = TextEditingController();
    final phoneCodeController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final emailController = TextEditingController();
    final birthDateController = TextEditingController();
    final passwordController = TextEditingController();
    final latitudeController = TextEditingController();
    final longitudeController = TextEditingController();

    nameController.addListener(() => bloc.update((candidate) {
          candidate.name = nameController.text;
        }));

    lastnameController.addListener(() => bloc.update((candidate) {
          candidate.lastname = lastnameController.text;
        }));

    phoneCodeController.addListener(() => bloc.update((candidate) {
          candidate.phoneCode = phoneCodeController.text;
        }));

    phoneNumberController.addListener(() => bloc.update((candidate) {
          candidate.phoneNumber = phoneNumberController.text;
        }));

    emailController.addListener(() => bloc.update((candidate) {
          candidate.email = emailController.text;
        }));

    birthDateController.addListener(() => bloc.update((candidate) {
          candidate.birthDate = birthDateController.text;
        }));

    passwordController.addListener(() => bloc.update((candidate) {
          candidate.password = passwordController.text;
        }));

    latitudeController.addListener(() => bloc.update((candidate) {
          candidate.latitude = double.parse(latitudeController.text);
        }));

    longitudeController.addListener(() => bloc.update((candidate) {
          candidate.longitude = double.parse(longitudeController.text);
        }));

    return BlocConsumer<CandidateCubit, CandidateState>(
        bloc: bloc,
        listener: (context, state) {
          if (state.State == CandidateStateChoice.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Candidate created succesfully!"),
              action: SnackBarAction(
                label: "Go back",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
          } else if (state.State == CandidateStateChoice.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Could not create candidate: ${state.submitError!.message}"),
            ));
          }
        },
        builder: (context, state) => SingleChildScrollView(
  }
}
*/