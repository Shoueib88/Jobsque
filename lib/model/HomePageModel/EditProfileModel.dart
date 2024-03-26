class EditProfileModel {
  bool? status;
  Data? data;

  EditProfileModel({this.status, this.data});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? bio;
  String? address;
  String? mobile;
  String? language;
  String? interestedWork;
  String? offlinePlace;
  String? remotePlace;
  String? experience;
  String? personalDetailed;
  String? education;

  Data(
      {this.bio,
      this.address,
      this.mobile,
      this.language,
      this.interestedWork,
      this.offlinePlace,
      this.remotePlace,
      this.experience,
      this.personalDetailed,
      this.education});

  Data.fromJson(Map<String, dynamic> json) {
    bio = json["bio"];
    address = json["address"];
    mobile = json["mobile"];
    language = json["language"];
    interestedWork = json["interested_work"];
    offlinePlace = json["offline_place"];
    remotePlace = json["remote_place"];
    experience = json["experience"];
    personalDetailed = json["personal_detailed"];
    education = json["education"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["bio"] = bio;
    _data["address"] = address;
    _data["mobile"] = mobile;
    _data["language"] = language;
    _data["interested_work"] = interestedWork;
    _data["offline_place"] = offlinePlace;
    _data["remote_place"] = remotePlace;
    _data["experience"] = experience;
    _data["personal_detailed"] = personalDetailed;
    _data["education"] = education;
    return _data;
  }
}
