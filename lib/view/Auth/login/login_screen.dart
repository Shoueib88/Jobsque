import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/strings.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/create_account/screen_one.dart';
import 'package:jobsque/view/HomePage/HomePage/HomePageScreen.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/default_form_filed.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';
import '../../../widgets/auth/another_options.dart';
import '../../../widgets/auth/auth_face_and_google.dart';
import '../../../widgets/auth/title_login.dart';
import '../../../widgets/primary_logo.dart';
import '../controller/cubit/auth_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [
          Padding(padding: EdgeInsets.all(10.0), child: PrimaryLogo())
        ]),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //title
                TitleLogin(
                    hieght: 70,
                    title: Strings.login,
                    destrbute: Strings.please_login,
                    fontsize: 30.sp,
                    fontsizesubtitle: 17.sp),
                SizedBox(height: 40.h),

                //textformfield

                Form(
                    key: context.read<AuthCubit>().formstatelogin,
                    child: Column(children: [
                      DefaultFormField(
                          controller: context.read<AuthCubit>().loginemail,
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
                          final controller = context.watch<ProfileCubit>();
                          return DefaultFormField(
                            controller:
                                context.watch<AuthCubit>().loginpassword,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 3) {
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
                      ),
                    ])),

                //
                AnotherOptions(),
                SizedBox(height: 80.h),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  DefaultText(text: "Don't have account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()));
                      },
                      child: Text('Register'))
                ]),
                DefultButton(
                    onpressed: () async {
                      if (context
                          .read<AuthCubit>()
                          .formstatelogin
                          .currentState!
                          .validate()) {
                        await context.read<AuthCubit>().loginService(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomepageScreen()));
                        print('login done');
                      }
                    },
                    text: 'Login',
                    backgroundcolor: J.primaryColor,
                    textcolor: J.whiteColor),
                J.sizeboxh20,
                DefaultText(text: Strings.another_auth),
                J.sizeboxh30,
                const AuthWithFaceAndGoogle()
              ]),
        )));
  }
}
