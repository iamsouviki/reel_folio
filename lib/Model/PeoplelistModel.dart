import 'dart:convert';
PeoplelistModel peoplelistModelFromJson(String str) => PeoplelistModel.fromJson(json.decode(str));
String peoplelistModelToJson(PeoplelistModel data) => json.encode(data.toJson());
class PeoplelistModel {
  PeoplelistModel({
      bool? success, 
      String? message, 
      List<PeopleData>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  PeoplelistModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PeopleData.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<PeopleData>? _data;
PeoplelistModel copyWith({  bool? success,
  String? message,
  List<PeopleData>? data,
}) => PeoplelistModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<PeopleData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

PeopleData dataFromJson(String str) => PeopleData.fromJson(json.decode(str));
String dataToJson(PeopleData data) => json.encode(data.toJson());
class PeopleData {
  PeopleData({
      num? id, 
      String? name, 
      dynamic coverPicture, 
      String? primaryRole,}){
    _id = id;
    _name = name;
    _coverPicture = coverPicture;
    _primaryRole = primaryRole;
}

  PeopleData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _coverPicture = json['cover_picture'];
    _primaryRole = json['primary_role'];
  }
  num? _id;
  String? _name;
  dynamic _coverPicture;
  String? _primaryRole;
PeopleData copyWith({  num? id,
  String? name,
  dynamic coverPicture,
  String? primaryRole,
}) => PeopleData(  id: id ?? _id,
  name: name ?? _name,
  coverPicture: coverPicture ?? _coverPicture,
  primaryRole: primaryRole ?? _primaryRole,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get coverPicture => _coverPicture;
  String? get primaryRole => _primaryRole;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['cover_picture'] = _coverPicture;
    map['primary_role'] = _primaryRole;
    return map;
  }

}