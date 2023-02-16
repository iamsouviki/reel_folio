class ReelFolioUserModel {
  bool? success;
  String? message;
  UserData? data;

  ReelFolioUserModel({this.success, this.message, this.data});

  ReelFolioUserModel.fromJson(Map<String, dynamic> json) {
    try{
      success = json['success'];
      message = json['message'];
      data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    }catch(e,stackTrace){
      print(stackTrace.toString());
    }
  }
}

class UserData {
  String? name;
  String? bio;
  String? coverPicture;
  String? profilePicture;

  //Null? reel;
  List<String>? skills;
  String? primarySkill;

  //Null? hiring;
  //Null? myWork;

  UserData({this.name,
    this.bio,
    this.coverPicture,
    this.profilePicture,
    //this.reel,
    this.skills,
    this.primarySkill,
    //this.hiring,
    //this.myWork,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    coverPicture = json['cover_picture'];
    profilePicture = json['profile_picture'];
    //reel = json['reel'];
    skills = json['skills'].cast<String>();
    primarySkill = json['primary_skill'];
    //hiring = json['hiring'];
    //myWork = json['my_work'];
  }
}