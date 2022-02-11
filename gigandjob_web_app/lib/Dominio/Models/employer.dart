class Employer {
  String name;
  String description;
  double latitude;
  double longitude;
  String state;
  String rif;
  String phone;
  String phoneArea;
  String mail;
  String comDesignation;

  Employer(
      {required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.rif,
      required this.phone,
      required this.mail,
      required this.comDesignation,
      required this.phoneArea})
      : state = "Active";
  Employer.empty()
      : name = "",
        description = "",
        longitude = 0,
        latitude = 0,
        rif = "",
        phone = "",
        phoneArea = "",
        mail = "",
        comDesignation = "",
        state = "Active";

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "location": {"latitude": latitude, "longitude": longitude},
      "rif": "J-" + rif,
      "mail": mail,
      "comDesignation": comDesignation,
      "phone": "+" + phoneArea + phone,
      "state": state
    };
  }
}
