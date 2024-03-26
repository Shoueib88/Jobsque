import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApplyJobServices {
  final url = 'https://project2.amit-learning.com/api/apply';

  applyJobServices(context,
      {required String name,
      required String email,
      required String mobile,
      required String typeofwork,
      required String filepath,
      required String jobid,
      required String userid,
      required String otherfilepath}) async {
    //get token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken;
    gettoken = pref.getString('token');
    // Prepare JSON data
    try {
      final headers = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $gettoken',
      };
      final body = {
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': typeofwork,
        'jobs_id': jobid,
        'user_id': userid,
      };

      // Prepare the file
      final file = await http.MultipartFile.fromPath('cv_file', filepath);
      // Prepare the other file
      final otherfile =
          await http.MultipartFile.fromPath('other_file', otherfilepath);

      // Create the multipart request
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add JSON data as a part
      request.fields['json'] = (json.encode(body));

      request.headers.addAll(headers);

      // Add the file
      request.files.add(file);
      request.files.add(otherfile);

      // Send the request
      final response = await request.send();

      // Process the response
      if (response.statusCode == 200) {
        final responseString =
            await response.stream.transform(utf8.decoder).join();
        print('++++++++++++++++++++++++++++////////////*********');
        print('--------------- true');
        print(responseString);
        print('++++++++++++++++++++++++++++////////////*********');
      } else {
        print('++++++++++++++ false');
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
                    const SizedBox(height: 8.0),
                    Text('${response.stream}'),
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
    } catch (e) {
      print(e);
    }
  }
}
