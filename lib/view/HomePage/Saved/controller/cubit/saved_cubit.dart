import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:file_picker/file_picker.dart';

import '../../../../../../services/AuthServices/LoginService.dart';
import '../../../../../../services/HomePageServices/ApplyJobServices.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final _applyjobservices = ApplyJobServices();
  String jobid = '';
  String userid = listdata.user!.id.toString();
  String worktype = '';
  String _filepath = '';
  String _otherfile = '';

  List listofFiles = [];

  applyJob(context) {
    _applyjobservices.applyJobServices(context,
        name: name.text,
        email: email.text,
        mobile: mobile.text,
        typeofwork: worktype,
        jobid: jobid,
        userid: userid,
        filepath: _filepath,
        otherfilepath: _otherfile);
    emit(ApplyJob());
  }

  String filetype = 'cv.pdf';
  String filename = 'test';

  uploadFile() async {
    emit(IsLoading(isload: true));
    try {
      FilePickerResult? result;

      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      _filepath = result!.files.first.path!;
      listofFiles.add(_filepath);
      filetype = _filepath.split('.').last;
      filename = result.files.first.name;
      emit(UploadFileState());
      emit(IsLoading(isload: false));
    } catch (e) {
      print('+++++++++++++++++++++ $e');
    }
  }

  uploadOtherFile() async {
    emit(IsLoading(isload: true));
    try {
      FilePickerResult? result;

      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
      _otherfile = result!.files.first.path!;
      listofFiles.add(_otherfile);
      filetype = _filepath.split('.').last;
      filename = result.files.first.name;
      emit(UploadOtherFileState());
      emit(IsLoading(isload: false));
    } catch (e) {
      print('+++++++++++++++++++++ $e');
    }
  }

  List listfiles = [];

  addFileIntoList() {
    listfiles.clear();
    var file = filename;
    listfiles.add(file);
    print(listfiles);
    emit(AddFileIntoList());
  }
}
