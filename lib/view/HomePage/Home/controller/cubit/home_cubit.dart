import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/model/HomePageModel/AllJobsModel.dart';
import 'package:jobsque/model/HomePageModel/ShowCompanyModel.dart' as company;
import 'package:jobsque/services/HomePageServices/AllJobsServices.dart';
import 'package:jobsque/services/HomePageServices/ShowCompanyServices.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/apply_job/send_successfully.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String token = '';
  List<Data> listOfData = [];
  final _alljobsservices = AllJobsServices();

  getAllJbos(BuildContext context) async {
    final listofalljobs = (await _alljobsservices.allJobs(context));

    for (var element in listofalljobs ?? []) {
      listOfData.add(element);
    }
    print("List of data ${listOfData.length}");
    print(listofalljobs);
    displayList = listOfData;
    emit(AllJobsState());
  }

  int index = 0;
  incrementIndex(val) {
    index = val;
    emit(IncrementIndex());
  }

  decrementIndex(val) {
    index = val - 5;
    emit(DncrementIndex());
  }

  List<Data> displayList = [];

  void upDateList(String value) {
    displayList = listOfData
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(UpDataSearch());
  }

  bool selectjobtype = false;
  int? currentindex;
  selectJobType(bool value, int index) {
    selectjobtype = value;
    currentindex = index;
    emit(SelectJobType());
  }

  int selectedlabel = 0;
  selectLabel(int value) {
    selectedlabel = value;
    emit(SelectedLabel());
  }

  List<company.Data> dataofcompany = [];
  bool isLoading = false;
  final _showcompanyservices = ShowCompanyServices();

  Future<void> getDataOfCompany(BuildContext context) async {
    List<company.Data> data = [];
    if (!isLoading) {
      isLoading = true;
      final listofcompany = await _showcompanyservices.showCompany(context);

      for (var element in listofcompany ?? []) {
        data.add(element);
      }

      print("List of data ${listOfData.length}");

      dataofcompany = data;

      emit(ShowCompanyState());

      isLoading = false;
    }
  }

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  countrycodepicker(BuildContext context) async {
    final code = await countryPicker.showPicker(context: context);
    countryCode = code;
    emit(CountryCodeState());
  }

  int counter = 0;
  stepperOfJobs(BuildContext context) {
    if (counter == 2) {
      //counter = 0;
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SendSuccessfully()));
    }
    counter++;
    emit(StepperOfJobs());
  }

  bool value = true;
  String jobnoti = 'empty';
  currentValue() {
    jobnoti = 'filled';
    Timer(Duration(seconds: 6), () {
      value = false;
      emit(JobNotificationState());
      print('timer finished');
    });
  }

  List<bool> isSaved = [false, false, false];
  List listOfSaved = [];
  saveItim(int index) {
    isSaved[index] = !isSaved[index];

    if (isSaved[index] == true) {
      listOfSaved.add(listOfData[index]);
    } else {
      listOfSaved.removeAt(index);
    }
    emit(SaveItemState());
  }
}
