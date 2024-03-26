import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/EditProfile_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Language_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/LoginandSecurity_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Notification_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Portfolio_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/Others_Proparities/HelpCenter_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/Others_Proparities/Privacy_Policy.dart';
import 'package:jobsque/view/HomePage/Profile/view/Others_Proparities/Terms&Conditions_screen.dart';

import '../../../../consts/style.dart';
import '../../../../widgets/default_text.dart';
import '../view/General_Proparities/Complete_profile/Complete_profile.dart';

class GeneralProparities extends StatelessWidget {
  const GeneralProparities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        height: 430.h,
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: screens.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
                title: DefaultText(text: generaltitle[index]),
                leading: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: J.activecolor),
                    child: Center(
                        child:
                            Icon(iconsoflist[index], color: J.primaryColor))),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => screens.elementAt(index)));
                },
              );
            }));
  }
}

class OtherProparities extends StatelessWidget {
  const OtherProparities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      height: 350.h,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: const Icon(Icons.arrow_forward, size: 18),
            title: DefaultText(text: otherstitle[index]),
            onTap: () {
              if (index == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpCenterScreen()));
              } else if (index == 2) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsAndCondationScreen()));
              } else if (index == 3) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              } else {
                return;
              }
            },
          );
        },
      ),
    );
  }
}

List generaltitle = [
  'Edite Profile',
  'Portfolio',
  'Language',
  'Notification',
  'Lagin and Security',
  'Complete Profile'
];

List otherstitle = [
  'Accesibility',
  'Help Center',
  'Terms & Condations',
  'Privacy Policy'
];

List<IconData> iconsoflist = [
  Icons.person_outline,
  Icons.drive_file_move_rtl_outlined,
  Icons.language,
  Icons.notifications_none,
  Icons.lock_outline,
  Icons.person_outline,
];

List screens = [
  EditProfileScreen(),
  Portfolio(),
  LanguageScreen(),
  NotifyScreen(),
  SecurityScreen(),
  CompleteProfile()
];
