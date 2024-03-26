class CreateAccountModel {
  bool? status;
  Data1? data;
  Profile? profile;
  String? token;

  CreateAccountModel({this.status, this.data, this.profile, this.token});

  CreateAccountModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    profile =
        json["profile"] == null ? null : Profile.fromJson(json["profile"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    if (profile != null) {
      _data["profile"] = profile?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class Profile {
  int? userId;
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  Profile(
      {this.userId,
      this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    name = json["name"];
    email = json["email"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["name"] = name;
    _data["email"] = email;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}

class Data1 {
  String? name;
  String? email;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data1(
      {this.name,
      this.email,
      this.otp,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data1.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    otp = json["otp"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["otp"] = otp;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}
