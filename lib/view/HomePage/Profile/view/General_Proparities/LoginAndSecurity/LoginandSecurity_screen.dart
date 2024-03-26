import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/change_password.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/email_address.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/phone_number.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/two_step_verification/twoStep_screen.dart';
import 'package:jobsque/widgets/default_text.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login and Security'),
        centerTitle: true,
      ),
      body: Container(
        height: 600.h,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView.separated(
          itemCount: loginandsecurity.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: DefaultText(text: loginandsecurity[index]),
              trailing: const Icon(
                Icons.arrow_forward,
                size: 18,
              ),
              onTap: () {
                if (index < _screens.length) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => _screens.elementAt(index)));
                } else {
                  return;
                }
              },
            );
          },
        ),
      ),
    );
  }
}

List loginandsecurity = [
  'Email address',
  'Phone number',
  'Change password',
  'Two-step verification',
  'Face ID'
];

List _screens = [
  EmailAddress(),
  PhoneNumber(),
  ChangePass(),
  TwoStepVerification()
];
