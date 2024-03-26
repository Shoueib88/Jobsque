import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jobsque/services/AuthServices/LoginService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpDateServices {
  final loginservices = LoginServices();
  static const url = 'https://project2.amit-learning.com/api/auth/user/update';
  updatePassword(context, String pass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken;
    gettoken = pref.getString('token');
    try {
      final headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $gettoken'
      };
      final body = {
        'password': pass,
      };
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        const Positioned(
            top: 30,
            right: 15,
            child: SnackBar(content: Text('Registered Successfully!')));
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
