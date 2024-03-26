import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProfileServices {
  final String url =
      'https://project2.amit-learning.com/api/user/profile/portofolios';

  Future<void> eddProfileService(BuildContext context,
      {required String filepath, required String imagepath}) async {
    // Get token
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? gettoken = pref.getString('token');

    // Download the file from the URL
    try {
      const fileUrl = 'https://project2.amit-learning.com/cv/cv_b7xp9dp8jf.pdf';
      var fileResponse = await http.get(Uri.parse(fileUrl));
      if (fileResponse.statusCode == 200) {
        final Directory appDocDir = await getApplicationDocumentsDirectory();
        final filePath = '${appDocDir.path}/${basename(fileUrl)}';
        final File file = File(filePath);
        await file.writeAsBytes(fileResponse.bodyBytes);

        // Prepare JSON data
        final headers = {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $gettoken',
        };

        // Prepare the file
        final image = await http.MultipartFile.fromPath('image', imagepath);

        // Create the multipart request
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(headers);

        // Add the file to the request
        request.files
            .add(await http.MultipartFile.fromPath('cvfile', filePath));
        request.files.add(image);

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
        }
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}
