import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAccountServices {
  static const url = 'https://project2.amit-learning.com/api/auth/register';
  registerAccount(context, String username, String pass, String email) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final body = {
        'name': username,
        'email': email,
        'password': pass,
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
