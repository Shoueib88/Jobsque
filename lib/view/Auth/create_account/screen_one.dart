import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/strings.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/controller/cubit/auth_cubit.dart';
import 'package:jobsque/view/Auth/create_account/screen_two.dart';
import 'package:jobsque/view/Auth/login/login_screen.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/default_form_filed.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/auth_face_and_google.dart';
import '../../../widgets/auth/title_login.dart';
import '../../../widgets/primary_logo.dart';

void main() => runApp(const CreateAccountScreen());

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          Padding(padding: EdgeInsets.all(10.0), child: PrimaryLogo())
        ]),
        body: Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //title
                      TitleLogin(
                          hieght: 70,
                          title: Strings.create,
                          destrbute: Strings.please_create,
                          fontsize: 30.sp,
                          fontsizesubtitle: 13.sp),
                      SizedBox(height: 60.h),

                      //textformfield

                      Form(
                          key: context.read<AuthCubit>().formstatecreateaccount,
                          child: Column(children: [
                            DefaultFormField(
                                controller: context.read<AuthCubit>().username,
                                keyboardType: TextInputType.name,
                                hintText: 'UserName',
                                prefixIcon: Icon(Icons.person_outline),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Not Valid ';
                                  }
                                  return null;
                                }),
                            J.sizeboxh20,
                            DefaultFormField(
                                controller: context.read<AuthCubit>().email,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Not Valid ';
                                  }
                                  return null;
                                }),
                            J.sizeboxh20,
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                final controller =
                                    context.watch<ProfileCubit>();
                                return DefaultFormField(
                                  controller:
                                      context.watch<AuthCubit>().password,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
                                  hintText: 'PassWord',
                                  prefixIcon: Icon(Icons.lock_outline),
                                  obscureText: controller.obscureText,
                                  suffixIcon: IconButton(
                                    icon: controller.eyeIcon,
                                    onPressed: () {
                                      controller.switchEyeIcon();
                                    },
                                  ),
                                );
                              },
                            )
                          ])),

                      SizedBox(height: 30.h),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        DefaultText(text: "Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            },
                            child: Text('Login'))
                      ]),
                      DefultButton(
                        onpressed: () {
                          if (context
                              .read<AuthCubit>()
                              .formstatecreateaccount
                              .currentState!
                              .validate()) {
                            context.read<AuthCubit>().registerAccount(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TypeOfWork()));
                            print('done');
                          }
                        },
                        text: Strings.create,
                        backgroundcolor: J.primaryColor,
                        textcolor: J.whiteColor,
                      ),

                      J.sizeboxh20,
                      DefaultText(text: Strings.another_auth),
                      J.sizeboxh20,
                      const AuthWithFaceAndGoogle(),
                      J.sizeboxh20
                    ]))));
  }
}
