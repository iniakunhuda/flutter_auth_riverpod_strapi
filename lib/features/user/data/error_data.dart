// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

class ErrorResponse {
  ErrorResponse({
    this.data,
    required this.error,
  });

  dynamic data;
  Error error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        data: json["data"],
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "error": error.toJson(),
      };
}

class Error {
  Error({
    required this.status,
    required this.name,
    required this.message,
    required this.details,
  });

  int status;
  String name;
  String message;
  Details details;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["status"],
        name: json["name"],
        message: json["message"],
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "message": message,
        "details": details.toJson(),
      };
}

class Details {
  Details();

  factory Details.fromJson(Map<String, dynamic> json) => Details();

  Map<String, dynamic> toJson() => {};
}
