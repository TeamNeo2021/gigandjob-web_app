import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Repositories/CandidateRepository.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateBloc.dart';
import 'package:gigandjob_web_app/Views/create_candidate/bloc/candidateStates.dart';
import 'package:intl/intl.dart';

import '../../Widgets/layout.dart';

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
          print(candidate.name);
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
          candidate.latitude = latitudeController.text;
          print(candidate.latitude);
        }));

    longitudeController.addListener(() => bloc.update((candidate) {
          candidate.longitude = longitudeController.text;
          print(candidate.longitude);
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
                child: Container(
              margin: const EdgeInsets.all(48),
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 16,
                        spreadRadius: 16,
                        color: Color(0x1A000000))
                  ]),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: spacingY / 2,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Candidate information",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          maxLength: 20,
                          controller: nameController,
                          enabled: state.State != CandidateStateChoice.posting,
                          validator: (_) => bloc.getError("name"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "Name",
                            prefixIcon: Icon(Icons.person),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          maxLength: 20,
                          controller: lastnameController,
                          enabled: state.State != CandidateStateChoice.posting,
                          validator: (_) => bloc.getError("lastname"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "lastname",
                            prefixIcon: Icon(Icons.person),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 1,
                              child: TextFormField(
                                  textAlign: TextAlign.end,
                                  enabled: state.State !=
                                      CandidateStateChoice.posting,
                                  controller: phoneCodeController,
                                  maxLength: 2,
                                  validator: (_) => bloc.getError("phoneCode"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(),
                                    labelText: "Area Code",
                                    prefix: Text("+"),
                                    prefixIcon: Icon(Icons.location_city),
                                  ))),
                          const SizedBox(
                            width: spacingX,
                          ),
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                  maxLength: 10,
                                  enabled: state.State !=
                                      CandidateStateChoice.posting,
                                  validator: (_) =>
                                      bloc.getError("phoneNumber"),
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(),
                                    labelText: "Phone Number",
                                    prefixIcon: Icon(Icons.phone),
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          enabled: state.State != CandidateStateChoice.posting,
                          controller: emailController,
                          validator: (_) => bloc.getError("email"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        enabled: state.State != CandidateStateChoice.posting,
                        controller: birthDateController,
                        validator: (_) => bloc.getError("birthDate"),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Birth Date",
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            birthDateController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(birthDateController
                                .text); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          obscureText: true,
                          maxLength: 20,
                          controller: passwordController,
                          enabled: state.State != CandidateStateChoice.posting,
                          validator: (_) => bloc.getError("password"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.password),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          maxLength: 20,
                          controller: latitudeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          enabled: state.State != CandidateStateChoice.posting,
                          validator: (_) => bloc.getError("latitude"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "Latitude",
                            prefixIcon: Icon(Icons.location_pin),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          maxLength: 20,
                          controller: longitudeController,
                          enabled: state.State != CandidateStateChoice.posting,
                          validator: (_) => bloc.getError("longitude"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "longitude",
                            prefixIcon: Icon(Icons.location_pin),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      MaterialButton(
                          minWidth: double.infinity,
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                          color: Colors.blue,
                          disabledColor: Colors.grey,
                          onPressed: state.State != CandidateStateChoice.posting
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    await bloc.submit();
                                  }
                                }
                              : null),
                      const SizedBox(
                        height: spacingY / 2,
                      ),
                    ],
                  )),
            )));
  }
}

class CreateCandidateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var repository = RepositoryProvider.of<CandidateRepository>(context);

    return BlocProvider(
      create: (ctx) => CandidateCubit(repository: repository),
      child: GigAndJobLayout(
          title: "Create an employer", child: _CreateCandidateView()),
    );
  }
}
