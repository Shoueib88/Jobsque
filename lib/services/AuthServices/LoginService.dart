import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jobsque/model/AuthModel/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

LoginModel listdata = LoginModel();
String usertoken = '';

class LoginServices {
  static const url = 'https://project2.amit-learning.com/api/auth/login';

  ////////// ترتيب المتغير بيفرق جدا جدا جدا  ///////////////////////////

  loginService(context, String email, String pass) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final body = {
        'email': email,
        'password': pass,
      };
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        listdata = LoginModel.fromJson(data);

        SharedPreferences pref = await SharedPreferences.getInstance();

        await pref.setString('token', '${listdata.token}');
        usertoken = pref.getString('token')!;
        print('|||||||||||||||||||||||||| $usertoken');
        print(pref.getString('token'));

        print('===== $listdata');
        print('((((((((${listdata.token}))))))))');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to login')),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
