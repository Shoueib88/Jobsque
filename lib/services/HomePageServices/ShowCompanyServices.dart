import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobsque/model/HomePageModel/ShowCompanyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowCompanyServices {
  static const url = 'https://project2.amit-learning.com/api/showCompany';

  Future<List<Data>?> showCompany(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken;
    gettoken = pref.getString('token');
    List<Data>? dataOfCompany;
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $gettoken',
      'Accept': 'application/json',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      final jsondecode = jsonDecode(response.body);
      print('++++++++ $jsondecode');
      final getdatafromjson = await ShowCampanyModel.fromJson(jsondecode);
      print(
          '---------- ${getdatafromjson.data!.map((data) => data.name).toList()}');

      print('//////////////////////////////////');
      dataOfCompany = getdatafromjson.data;
      print('---------- $dataOfCompany');
      // return logindata.data;
    } else {
      print('------------ error');
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: 400,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('${response.body}'),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Dismiss the bottom sheet
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          });
    }
    return dataOfCompany;
  }
}
