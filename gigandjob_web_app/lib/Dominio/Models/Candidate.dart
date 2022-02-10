class Candidate {
  String name;
  String lastname;
  String phoneCode;
  String phoneNumber;
  String email;
  String birthDate;
  String password;
  String latitude;
  String longitude;

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
        latitude = "",
        longitude = "";

  Map<String, dynamic> toJson() {
    return {
      "name": {"firstname": name, "lastnames": lastname},
      "phone": {"areaCode": phoneCode, "phoneNumber": phoneNumber},
      "email": email,
      "birthdate": birthDate,
      "location": {"latitude": latitude, "longitude": longitude}
    };
  }
}
