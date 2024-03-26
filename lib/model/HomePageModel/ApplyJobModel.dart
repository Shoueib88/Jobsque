class ApplyJobModel {
  bool? status;
  Data? data;

  ApplyJobModel({this.status, this.data});

  ApplyJobModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? cvFile;
  String? name;
  String? email;
  String? mobile;
  String? workType;
  String? otherFile;
  String? jobsId;
  String? userId;
  bool? reviewed;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.cvFile,
      this.name,
      this.email,
      this.mobile,
      this.workType,
      this.otherFile,
      this.jobsId,
      this.userId,
      this.reviewed,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    cvFile = json["cv_file"];
    name = json["name"];
    email = json["email"];
    mobile = json["mobile"];
    workType = json["work_type"];
    otherFile = json["other_file"];
    jobsId = json["jobs_id"];
    userId = json["user_id"];
    reviewed = json["reviewed"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cv_file"] = cvFile;
    _data["name"] = name;
    _data["email"] = email;
    _data["mobile"] = mobile;
    _data["work_type"] = workType;
    _data["other_file"] = otherFile;
    _data["jobs_id"] = jobsId;
    _data["user_id"] = userId;
    _data["reviewed"] = reviewed;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}
