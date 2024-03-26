class ExperienceModel {
  bool? status;
  Data? data;

  ExperienceModel({this.status, this.data});

  ExperienceModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? postion;
  String? typeWork;
  String? compName;
  String? location;
  String? start;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.postion,
      this.typeWork,
      this.compName,
      this.location,
      this.start,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    postion = json["postion"];
    typeWork = json["type_work"];
    compName = json["comp_name"];
    location = json["location"];
    start = json["start"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["postion"] = postion;
    _data["type_work"] = typeWork;
    _data["comp_name"] = compName;
    _data["location"] = location;
    _data["start"] = start;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}
