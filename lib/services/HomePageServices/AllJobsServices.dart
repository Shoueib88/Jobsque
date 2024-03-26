import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jobsque/model/HomePageModel/AllJobsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllJobsServices {
  static const url = 'https://project2.amit-learning.com/api/jobs';
//5518|WWAudTWPdIHTFOy7bVCKmVmSMsf0NerIvcp6FTB4

  Future<List<Data>?> allJobs(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken;
    gettoken = pref.getString('token');

    List<Data>? data;
    final headers = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $gettoken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);
    print('+++++++++++++++++++++ $gettoken');
    if (response.statusCode == 200) {
      final jsondecode = jsonDecode(response.body);
      final logindata = AllJobsModel.fromJson(jsondecode);

      print('//////////////////////////////////');

      print(logindata.data);
      data = logindata.data;
      // return logindata.data;
    } else {
      print('------------ error');
    }
    return data;
  }
}
