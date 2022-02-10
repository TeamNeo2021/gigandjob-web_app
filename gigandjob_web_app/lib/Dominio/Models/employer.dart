class Employer {
  String name;
  String description;
  String location;
  String state;
  String rif;
  String phone;
  String phoneArea;
  String mail;
  String comDesignation;

  Employer(
      {required this.name,
      required this.description,
      required this.location,
      required this.rif,
      required this.phone,
      required this.mail,
      required this.comDesignation,
      required this.phoneArea})
      : state = "Active";
  Employer.empty()
      : name = "",
        description = "",
        location = "",
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
      "location": location,
      "rif": "J-" + rif,
      "mail": mail,
      "comDesignation": comDesignation,
      "phone": "+" + phoneArea + phone,
      "state": state
    };
  }
}
