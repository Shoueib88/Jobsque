import 'package:flutter/material.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/create_account/screen_three.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/custum_contianer.dart';
import '../../../widgets/auth/title_login.dart';

class TypeOfWork extends StatelessWidget {
  const TypeOfWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          J.sizeboxh10,
                          TitleLogin(
                              title: 'What type of work are you interested in?',
                              destrbute:
                                  'Tell us what you are interested in so we can customise the app for your needs.',
                              fontsize: 20,
                              hieght: 95,
                              fontsizesubtitle: 15),
                          const SizedBox(height: 55),
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                CustomContainerActive(
                                    asset: Assets.UX_Design, text: 'UX Design'),
                                CustomContainerNoActive(
                                    asset: Assets.Ilustrator_Designer,
                                    text: 'Ilustrator_Designer')
                              ])),
                          J.sizeboxh10,
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                CustomContainerNoActive(
                                    asset: Assets.Developer, text: 'Developer'),
                                CustomContainerNoActive(
                                    asset: Assets.Management,
                                    text: 'Management')
                              ])),
                          J.sizeboxh10,
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                CustomContainerNoActive(
                                    asset: Assets.Information_Technology,
                                    text: 'Information Technology'),
                                CustomContainerActive(
                                    asset: Assets.Research_and_Analytics,
                                    text: 'Research and Analytics')
                              ])),
                          const SizedBox(height: 55),
                          DefultButton(
                              onpressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Locations()));
                              },
                              text: 'next',
                              textcolor: J.whiteColor,
                              backgroundcolor: J.primaryColor)
                        ])))));
  }
}
