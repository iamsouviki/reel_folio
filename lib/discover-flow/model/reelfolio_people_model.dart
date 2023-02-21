class ReelFolioPeopleModel {
  bool? success;
  String? message;
  List<PeopleData>? data;

  ReelFolioPeopleModel({this.success, this.message, this.data});

  ReelFolioPeopleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PeopleData>[];
      json['data'].forEach((v) {
        data!.add(PeopleData.fromJson(v));
      });
    }
  }
}

class PeopleData {
  int? id;
  String? name;
  String? coverPicture;
  String? primaryRole;

  PeopleData({this.id, this.name, this.coverPicture, this.primaryRole});

  PeopleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverPicture = json['cover_picture'] ?? '';
    primaryRole = json['primary_role'];
  }
}