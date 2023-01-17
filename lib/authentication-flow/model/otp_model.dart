class OTPResponse {
  bool? success;
  String? message;
  Data? data;

  OTPResponse({this.success, this.message, this.data});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? code;
  int? id;

  Data({this.code, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
  }
}
