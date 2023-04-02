class UserRequest {
  UserRequest({
    required this.identifier,
    required this.password,
  });

  String identifier;
  String password;

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        identifier: json["identifier"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
      };
}
