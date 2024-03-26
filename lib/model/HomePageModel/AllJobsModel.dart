class AllJobsModel {
  bool? status;
  List<Data>? data;

  AllJobsModel({this.status, this.data});

  AllJobsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.image,
      this.jobTimeType,
      this.jobType,
      this.jobLevel,
      this.jobDescription,
      this.jobSkill,
      this.compName,
      this.compEmail,
      this.compWebsite,
      this.aboutComp,
      this.location,
      this.salary,
      this.favorites,
      this.expired,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    jobTimeType = json["job_time_type"];
    jobType = json["job_type"];
    jobLevel = json["job_level"];
    jobDescription = json["job_description"];
    jobSkill = json["job_skill"];
    compName = json["comp_name"];
    compEmail = json["comp_email"];
    compWebsite = json["comp_website"];
    aboutComp = json["about_comp"];
    location = json["location"];
    salary = json["salary"];
    favorites = json["favorites"];
    expired = json["expired"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["job_time_type"] = jobTimeType;
    _data["job_type"] = jobType;
    _data["job_level"] = jobLevel;
    _data["job_description"] = jobDescription;
    _data["job_skill"] = jobSkill;
    _data["comp_name"] = compName;
    _data["comp_email"] = compEmail;
    _data["comp_website"] = compWebsite;
    _data["about_comp"] = aboutComp;
    _data["location"] = location;
    _data["salary"] = salary;
    _data["favorites"] = favorites;
    _data["expired"] = expired;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}
