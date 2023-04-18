class LoginModel {
  LoginModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final LoginSuccessData data;

  LoginModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = LoginSuccessData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class LoginSuccessData {
  LoginSuccessData({
    required this.name,
    required this.email,
    required this.id,
    required this.approved,
    required this.isNew,
    required this.token,
  });
  late final String name;
  late final String email;
  late final int id;
  late final int approved;
  late final int isNew;
  late final String token;

  LoginSuccessData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    id = json['id'];
    approved = json['approved'];
    isNew = json['isNew'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['id'] = id;
    _data['approved'] = approved;
    _data['isNew'] = isNew;
    _data['token'] = token;
    return _data;
  }
}