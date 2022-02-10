// ignore_for_file: file_names

/*class Candidate {
  final String candidateId;
  final String name;
  final String lastname;
  final String state;
  final String phone;
  final String email;
  final DateTime birthdate;
  final num latitude;
  final num longitude;

  const Candidate({
    required this.candidateId,
    required this.lastname,
    required this.state,
    required this.phone,
    required this.email,
    required this.birthdate,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      candidateId: json['candidateId'],
      lastname: json['lastname'],
      state: json['state'],
      phone: json['phone'],
      email: json['email'],
      birthdate: json['birthdate'],
      name: json['name'],
      latitude: json['location.latitude'],
      longitude: json['location.longitude'],
    );
  }

  factory Candidate.fromDocument(dynamic doc) {
    return Candidate(
      candidateId: doc['candidateId'],
      lastname: doc['lastname'],
      state: doc['state'],
      phone: doc['phone'],
      email: doc['email'],
      birthdate: doc['birthdate'],
      name: doc['name'],
      latitude: doc['location.latitude'],
      longitude: doc['location.longitude'],
    );
  }
}*/

import 'package:equatable/equatable.dart';

abstract class Candidate extends Equatable {
  const Candidate(
      {required this.candidateId,
      required this.name,
      required this.lastname,
      required this.state,
      required this.phone,
      required this.email,
      required this.birthdate});

  final String candidateId;
  final String name;
  final String lastname;
  final String state;
  final String phone;
  final String email;
  final DateTime birthdate;

  @override
  List<Object> get props =>
      [candidateId, name, lastname, state, phone, email, birthdate];
}
