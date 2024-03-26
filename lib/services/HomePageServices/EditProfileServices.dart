import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileServices {
  editProfileService(context, String bio, String address, String mobile,
      String language) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? gettoken;
      gettoken = pref.getString('token');

      final url =
          'https://project2.amit-learning.com/api/user/profile/edit?bio=$bio&address=$address&mobile=$mobile&language=$language&interested_work=&offline_place=&remote_place=&experience=&personal_detailed=&education=';
      final headers = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $gettoken',
      };

      final response = await http.put(Uri.parse(url), headers: headers);
      print('££££ >>> ${response.body}');
      if (response.statusCode == 200) {
        print('0000000000000000000000000000000000000000');
        print(response);
      } else {
        print('editprofile error <<<<<<<<<<<<<<<<<<< ');
      }
    } catch (e) {
      print('this error >>>> $e');
    }
  }
}
