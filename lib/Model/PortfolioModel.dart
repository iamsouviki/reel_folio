class PortfolioModel {
  PortfolioModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String? message;
  late final PortfolioUserData data;

  PortfolioModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = PortfolioUserData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class PortfolioUserData {
  PortfolioUserData({
    required this.name,
    required this.bio,
    required this.coverPicture,
    required this.profilePicture,
    this.reel,
    required this.skills,
    required this.primarySkill,
    required this.myWork,
  });
  late final String? name;
  late final String? bio;
  late final String? coverPicture;
  late final String? profilePicture;
  late final String? reel;
  late final List<Skills>? skills;
  late final PrimarySkill? primarySkill;
  late final List<MyWork> myWork;

  PortfolioUserData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    bio = json['bio'];
    coverPicture = json['cover_picture'];
    profilePicture = json['profile_picture'];
    reel = null;
    skills = List.from(json['skills']).map((e)=>Skills.fromJson(e)).toList();
    primarySkill = PrimarySkill.fromJson(json['primary_skill']);
    myWork = List.from(json['my_work']).map((e)=>MyWork.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['bio'] = bio;
    _data['cover_picture'] = coverPicture;
    _data['profile_picture'] = profilePicture;
    _data['reel'] = reel;
    _data['skills'] = skills?.map((e)=>e.toJson()).toList();
    _data['primary_skill'] = primarySkill?.toJson();
    _data['my_work'] = myWork.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Skills {
  Skills({
    required this.id,
    required this.name,
    required this.pivot,
  });
  late final int? id;
  late final String? name;
  late final Pivot? pivot;

  Skills.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['pivot'] = pivot?.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.userId,
    required this.skillId,
    required this.isPrimary,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? userId;
  late final int? skillId;
  late final int? isPrimary;
  late final String? createdAt;
  late final String? updatedAt;

  Pivot.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    skillId = json['skill_id'];
    isPrimary = json['is_primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['skill_id'] = skillId;
    _data['is_primary'] = isPrimary;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class PrimarySkill {
  PrimarySkill({
    required this.id,
    required this.name,
    required this.pivot,
  });
  late final int? id;
  late final String? name;
  late final Pivot? pivot;

  PrimarySkill.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['pivot'] = pivot?.toJson();
    return _data;
  }
}

class MyWork {
  MyWork({
    required this.id,
    required this.userId,
    required this.thumbnail,
    required this.title,
    required this.link,
    required this.logline,
    required this.details,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final int? userId;
  late final String? thumbnail;
  late final String? title;
  late final String? link;
  late final String? logline;
  late final String? details;
  late final String? type;
  late final String? createdAt;
  late final String? updatedAt;

  MyWork.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    thumbnail = json['thumbnail'];
    title = json['title'];
    link = json['link'];
    logline = json['logline'];
    details = json['details'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['thumbnail'] = thumbnail;
    _data['title'] = title;
    _data['link'] = link;
    _data['logline'] = logline;
    _data['details'] = details;
    _data['type'] = type;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}