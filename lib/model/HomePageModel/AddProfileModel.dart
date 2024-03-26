class AddProfile {
  bool? status;
  Data? data;

  AddProfile({this.status, this.data});

  AddProfile.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? userId;
  String? cvFile;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.userId,
      this.cvFile,
      this.image,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    userId = json["user_id"];
    cvFile = json["cv_file"];
    image = json["image"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["user_id"] = userId;
    _data["cv_file"] = cvFile;
    _data["image"] = image;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}
