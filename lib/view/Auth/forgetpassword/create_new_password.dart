import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/controller/cubit/auth_cubit.dart';
import 'package:jobsque/view/Auth/forgetpassword/successfully.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/default_form_filed.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/title_login.dart';
import '../../../widgets/primary_logo.dart';

void main() => runApp(const CreateNewPassword());

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          Padding(padding: EdgeInsets.all(10.0), child: PrimaryLogo())
        ]),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              //title
              TitleLogin(
                  hieght: 100,
                  title: 'Create new password',
                  destrbute:
                      'Set your new password so you can login and acces Jobsque',
                  fontsize: 30.sp,
                  fontsizesubtitle: 13.sp),
              J.sizeboxh20,
              Form(
                  key: context.read<AuthCubit>().formstatenewpassword,
                  child: Column(
                    children: [
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          final controller = context.watch<ProfileCubit>();
                          return DefaultFormField(
                            controller: context.watch<AuthCubit>().password,
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
                      ),
                      J.sizeboxh20,
                      DefaultFormField(
                          controller: TextEditingController(),
                          validator: (value) {
                            if (value !=
                                context.read<AuthCubit>().password.text) {
                              return 'Both password must match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          obscureText: true,
                          hintText: 'PassWord',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Container(
                              child: Image.asset(Assets.eye_slash, scale: 5))),
                    ],
                  )),
              SizedBox(height: 250.h),
              DefultButton(
                onpressed: () {
                  if (context
                      .read<AuthCubit>()
                      .formstatenewpassword
                      .currentState!
                      .validate()) {
                    context.read<AuthCubit>().upDatePassword(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Successfully()));
                  }
                },
                text: 'Reset password',
                backgroundcolor: J.primaryColor,
                textcolor: J.whiteColor,
              ),
            ]))));
  }
}
