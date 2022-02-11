import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_web_app/Dominio/Repositories/employer_repository.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit.dart';
import 'package:gigandjob_web_app/Views/create_employer/bloc/employer_cubit_state.dart';

import '../../Widgets/layout.dart';

const double spacingX = 24;
const double spacingY = 24;

class _CreateEmployerView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EmployerCubit>(context);
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final emailController = TextEditingController();
    final locationController = TextEditingController();
    final phoneAreaController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final comercialDesignationController = TextEditingController();
    final rifController = TextEditingController();

    nameController.addListener(() => bloc.update((employer) {
          employer.name = nameController.text;
        }));
    descriptionController.addListener(() => bloc.update((employer) {
          employer.description = descriptionController.text;
        }));
    emailController.addListener(() => bloc.update((employer) {
          employer.mail = emailController.text;
        }));
    locationController.addListener(() => bloc.update((employer) {
          employer.location = locationController.text;
        }));
    phoneAreaController.addListener(() => bloc.update((employer) {
          employer.phoneArea = phoneAreaController.text;
        }));
    phoneNumberController.addListener(() => bloc.update((employer) {
          employer.phone = phoneNumberController.text;
        }));
    comercialDesignationController.addListener(() => bloc.update((employer) {
          employer.comDesignation = comercialDesignationController.text;
        }));
    rifController.addListener(() => bloc.update((employer) {
          employer.rif = rifController.text;
        }));

    return BlocConsumer<EmployerCubit, EmployerCubitState>(
        bloc: bloc,
        listener: (context, state) {
          if (state.state == EmployerCubitStateChoice.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Employer created succesfully!"),
              action: SnackBarAction(
                label: "Go back",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
          } else if (state.state == EmployerCubitStateChoice.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Could not create employer: ${state.submitError!.message}"),
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
                          "Employer information",
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
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
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
                          maxLines: null,
                          controller: descriptionController,
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
                          maxLength: 500,
                          minLines: 4,
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.multiline,
                          validator: (_) => bloc.getError("description"),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            labelText: "Description",
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
                          controller: emailController,
                          validator: (_) => bloc.getError("mail"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
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
                                  enabled: state.state !=
                                      EmployerCubitStateChoice.posting,
                                  controller: phoneAreaController,
                                  maxLength: 2,
                                  validator: (_) => bloc.getError("phoneArea"),
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
                                  enabled: state.state !=
                                      EmployerCubitStateChoice.posting,
                                  validator: (_) => bloc.getError("phone"),
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
                          controller: locationController,
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
                          validator: (_) => bloc.getError("location"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Location",
                            prefixIcon: Icon(Icons.add_location),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 9,
                          controller: rifController,
                          validator: (_) => bloc.getError("rif"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            counterText: "",
                            labelText: "RIF",
                            prefix: Text("J-"),
                            prefixIcon: Icon(Icons.corporate_fare),
                          )),
                      const SizedBox(
                        height: spacingY,
                      ),
                      TextFormField(
                          enabled:
                              state.state != EmployerCubitStateChoice.posting,
                          controller: comercialDesignationController,
                          validator: (_) => bloc.getError("comDesignation"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Comercial Designation",
                            prefixIcon: Icon(Icons.wallet_giftcard),
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
                          onPressed:
                              state.state != EmployerCubitStateChoice.posting
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

class CreateEmployerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CreateEmployerView();
  }
}
