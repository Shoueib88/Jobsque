import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/services/HomePageServices/AddProfileServices.dart';
import 'package:jobsque/services/HomePageServices/EditProfileServices.dart';
import 'package:jobsque/services/HomePageServices/ExperienceServices.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool currentvalue = false;
  switchValue(bool value) {
    currentvalue = value;
    emit(SwitchValueState());
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  Icon eyeIcon = Icon(Icons.visibility_off);
  bool obscureText = true;
  switchEyeIcon() {
    if (eyeIcon.icon == Icons.visibility_off) {
      eyeIcon = Icon(Icons.visibility);
      obscureText = false;
    } else {
      eyeIcon = Icon(Icons.visibility_off);
      obscureText = true;
    }
    emit(SwitchEyeIconState());
  }

  Icon eyeIcontwo = Icon(Icons.visibility_off);
  bool obscureTexttwo = true;
  switchEyeIconTwo() {
    if (eyeIcontwo.icon == Icons.visibility_off) {
      eyeIcontwo = Icon(Icons.visibility);
      obscureTexttwo = false;
    } else {
      eyeIcontwo = Icon(Icons.visibility_off);
      obscureTexttwo = true;
    }
    emit(SwitchEyeIconState());
  }

  Icon eyeIconthree = Icon(Icons.visibility_off);
  bool obscureTextthree = true;
  switchEyeIconThree() {
    if (eyeIconthree.icon == Icons.visibility_off) {
      eyeIconthree = Icon(Icons.visibility);
      obscureTextthree = false;
    } else {
      eyeIconthree = Icon(Icons.visibility_off);
      obscureTextthree = true;
    }
    emit(SwitchEyeIconState());
  }

  String two_step = 'first';
  setTwoStepVerificationType() {
    two_step = 'second';
    emit(SetTwoStepVerificationTypeState());
  }

  int percent = 0;
  int num_completed = 0;
  double progressValue = 0;

  int comp_index = 5;
  int? zero;
  personalDetailsModel() {
    percent = 25;
    num_completed = 1;
    progressValue = 0.25;
    comp_index = 0;
    zero = 0;
    emit(PersonalDetailsModelState());
  }

  int? one;
  protfolioModel() {
    percent = 50;
    num_completed = 2;
    progressValue = 0.5;
    comp_index = 1;
    one = 1;
    emit(ProtfolioModelState());
  }

  int? two;
  educationModel() {
    percent = 75;
    num_completed = 3;
    progressValue = 0.75;
    comp_index = 2;
    two = 2;
    emit(EducationModelState());
  }

  int? three;
  experienceModel() {
    percent = 100;
    num_completed = 4;
    progressValue = 1;
    comp_index = 3;
    three = 3;
    emit(ExperienceModelState());
  }

  // profile screen controller
  final formprofilestate = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();

  final _editprofileservice = EditProfileServices();

  editProfile(
    context,
    String _bio,
    String _address,
    String _mobile,
  ) {
    _editprofileservice.editProfileService(
        context, _bio, _address, _mobile, 'arbic');

    emit(EditProfileState());
  }

  String filepath = "https://project2.amit-learning.com/cv/cv_b7xp9dp8jf.pdf";
  uploadFile() async {
    emit(IsLoading(isload: true));
    try {
      FilePickerResult? result;

      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      filepath = result!.files.first.path!;

      print(filepath + '>>>>>>>>>>>>>>>>>>>>>>>>');

      emit(UploadCvFile());
      emit(IsLoading(isload: false));
    } catch (e) {
      print('+++++++++++++++++++++ $e');
    }
  }

  final ImagePicker _picker = ImagePicker();

  String imagepath = '';
  File image = File(
      '/data/user/0/com.example.jobsque/cache/18f88e9a-02cc-416a-8362-ca8f794d1e21/1000023064.jpg');
  pickImage(ImageSource source) async {
    emit(IsLoading(isload: true));
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imagepath = pickedFile.path;
      image = File(pickedFile.path);

      print(imagepath + '>>>>>>>>>>>>>>>>>>>>>>>>');
      emit(PickImageState());
    }
    emit(IsLoading(isload: false));
  }

  final _addprofileservices = AddProfileServices();
  addProfileService(context) {
    _addprofileservices.eddProfileService(context,
        filepath: filepath, imagepath: imagepath);
    emit(AddProfileState());
  }

  String username = '';
  String typework = '';
  dataOfProfile() {
    username = name.text;
    typework = bio.text;
    emit(DataOfProfile());
  }

  // education screen controller
  TextEditingController position = TextEditingController();
  TextEditingController typeofwork = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController startyear = TextEditingController();
  TextEditingController endyear = TextEditingController();

  final experienceformstate = GlobalKey<FormState>();
  final _experienceservice = ExperienceServices();

  experienceService(context) {
    _experienceservice.experienceService(
        context,
        position.text,
        typeofwork.text,
        companyname.text,
        location.text,
        startyear.text,
        endyear.text);
    emit(ExperienceModelState());
  }
}
