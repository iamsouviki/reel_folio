import 'dart:convert';
/// success : true
/// message : "All projects"
/// data : [{"id":1,"user_id":1,"thumbnail":"images/project/thumbnail_1676994514_1.jpg","title":"Test Project 1","link":"http://qworkz.com/subhankard","logline":"Test project logline","details":"Test project details filled by Subhankar himself","type":"hiring","created_at":"2023-02-21T15:36:56.000000Z","updated_at":"2023-02-21T15:48:34.000000Z"},{"id":2,"user_id":1,"thumbnail":"images/project/thumbnail_1676994008_1.jpg","title":"Test Project One","link":"http://qworkz.com/subhankard","logline":"Test project One logline","details":"Test project one details filled by Subhankar himself","type":"completed","created_at":"2023-02-21T15:40:08.000000Z","updated_at":"2023-02-21T15:40:08.000000Z"},{"id":3,"user_id":22,"thumbnail":"images/project/thumbnail_1678984689_22.png","title":"Test Project One","link":"http://qworkz.com/subhankard","logline":"Test project One logline","details":"Test project one details filled by Subhankar himself","type":"completed","created_at":"2023-03-16T16:38:10.000000Z","updated_at":"2023-03-16T16:38:10.000000Z"},{"id":4,"user_id":22,"thumbnail":"images/project/thumbnail_1678984751_22.png","title":"Test Project One","link":"http://qworkz.com/subhankard","logline":"Test project One logline","details":"Test project one details filled by Subhankar himself","type":"completed","created_at":"2023-03-16T16:39:11.000000Z","updated_at":"2023-03-16T16:39:11.000000Z"},{"id":5,"user_id":1,"thumbnail":"images/project/thumbnail_1679319995_1.png","title":"Souvik's Project","link":"https://www.youtube.com/embed/6DtPF9W3ejI","logline":"https://www.youtube.com/embed/6DtPF9W3ejI","details":"https://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejIhttps://www.youtube.com/embed/6DtPF9W3ejI","type":"hiring","created_at":"2023-03-20T13:46:35.000000Z","updated_at":"2023-03-20T13:46:35.000000Z"},{"id":6,"user_id":81,"thumbnail":"images/project/thumbnail_1679332004_81.png","title":"This is the 1st sample project","link":"https://www.imdb.com/title/tt14266192/mediaviewer/rm1081669377/?ref_=tt_ov_i","logline":"this is a test","details":"sdjkfksdfsadfsf\r\nsdfsadfsadfsadf\r\n\r\nsdfsadfsdfsdfsdfsadfsdfsfc\\\r\n\r\nsdfsadfsadfsdfsdf","type":"hiring","created_at":"2023-03-20T17:06:44.000000Z","updated_at":"2023-03-20T17:06:44.000000Z"},{"id":7,"user_id":1,"thumbnail":"images/project/thumbnail_1679333439_1.jpg","title":"Initial project","link":"https://youtube.com/","logline":"testing logline","details":"sdfsdfsdfsdf\r\nsdfsdfsdfsdf\r\nsdfsdfsdfsdfsdf\r\nsdfsdfsdfsdf","type":"completed","created_at":"2023-03-20T17:30:40.000000Z","updated_at":"2023-03-20T17:30:40.000000Z"}]

ProjectListModel projectListModelFromJson(String str) => ProjectListModel.fromJson(json.decode(str));
String projectListModelToJson(ProjectListModel data) => json.encode(data.toJson());
class ProjectListModel {
  ProjectListModel({
      bool? success, 
      String? message, 
      List<ProjectDetails>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  ProjectListModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProjectDetails.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<ProjectDetails>? _data;
ProjectListModel copyWith({  bool? success,
  String? message,
  List<ProjectDetails>? data,
}) => ProjectListModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<ProjectDetails>? get data => _data;

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

/// id : 1
/// user_id : 1
/// thumbnail : "images/project/thumbnail_1676994514_1.jpg"
/// title : "Test Project 1"
/// link : "http://qworkz.com/subhankard"
/// logline : "Test project logline"
/// details : "Test project details filled by Subhankar himself"
/// type : "hiring"
/// created_at : "2023-02-21T15:36:56.000000Z"
/// updated_at : "2023-02-21T15:48:34.000000Z"

ProjectDetails dataFromJson(String str) => ProjectDetails.fromJson(json.decode(str));
String dataToJson(ProjectDetails data) => json.encode(data.toJson());
class ProjectDetails {
  ProjectDetails({
      num? id, 
      num? userId, 
      String? thumbnail, 
      String? title, 
      String? link, 
      String? logline, 
      String? details, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _thumbnail = thumbnail;
    _title = title;
    _link = link;
    _logline = logline;
    _details = details;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ProjectDetails.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _thumbnail = json['thumbnail'];
    _title = json['title'];
    _link = json['link'];
    _logline = json['logline'];
    _details = json['details'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _thumbnail;
  String? _title;
  String? _link;
  String? _logline;
  String? _details;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
ProjectDetails copyWith({  num? id,
  num? userId,
  String? thumbnail,
  String? title,
  String? link,
  String? logline,
  String? details,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => ProjectDetails(  id: id ?? _id,
  userId: userId ?? _userId,
  thumbnail: thumbnail ?? _thumbnail,
  title: title ?? _title,
  link: link ?? _link,
  logline: logline ?? _logline,
  details: details ?? _details,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get thumbnail => _thumbnail;
  String? get title => _title;
  String? get link => _link;
  String? get logline => _logline;
  String? get details => _details;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['thumbnail'] = _thumbnail;
    map['title'] = _title;
    map['link'] = _link;
    map['logline'] = _logline;
    map['details'] = _details;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}