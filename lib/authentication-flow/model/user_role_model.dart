class UserRoleModel {
  bool? success;
  String? message;
  List<Data>? data;

  UserRoleModel({this.success, this.message, this.data});

  UserRoleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? name;
  List<Skills>? skills;

  Data({this.id, this.name, this.skills});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }
}

class Skills {
  int? id;
  String? name;
  int? roleId;

  Skills({this.id, this.name, this.roleId});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roleId = json['role_id'];
  }
}
