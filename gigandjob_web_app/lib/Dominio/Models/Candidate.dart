class Candidate {
  String name;
  String lastname;
  String phoneCode;
  String phoneNumber;
  String email;
  String birthDate;
  String password;
  double latitude;
  double longitude;

  Candidate(
      {required this.name,
      required this.lastname,
      required this.phoneCode,
      required this.phoneNumber,
      required this.email,
      required this.birthDate,
      required this.password,
      required this.latitude,
      required this.longitude}) {}

  Candidate.empty()
      : name = "",
        lastname = "",
        phoneCode = "",
        phoneNumber = "",
        email = "",
        birthDate = "",
        password = "",
        latitude = 0.0,
        longitude = 0.0;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "lastname": lastname,
      "phoneCode": phoneCode,
      "email": email,
      "birthdate": birthDate,
      "latitude": latitude,
      "longitude": longitude
    };
  }
}
