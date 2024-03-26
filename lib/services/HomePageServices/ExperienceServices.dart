import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../AuthServices/LoginService.dart';

class ExperienceServices {
  static const url = 'https://project2.amit-learning.com/api/experince';
  experienceService(
      context,
      String position,
      String typeofwork,
      String companyname,
      String location,
      String startyear,
      String endyear) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken;
    gettoken = pref.getString('token');
    try {
      final headers = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $gettoken',
      };
      final body = {
        'user_id': listdata.user!.id.toString(),
        "postion": position,
        "type_work": typeofwork,
        "comp_name": companyname,
        'location': location,
        "start": companyname,
        'end': location,
      };
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print('0000000000000000000000000000000000000000');
        print(response);
      } else {
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
                      'Login Error',
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
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
