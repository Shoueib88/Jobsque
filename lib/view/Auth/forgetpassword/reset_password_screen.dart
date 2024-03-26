import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/model/AuthModel/LoginModel.dart';
import 'package:jobsque/view/Auth/controller/cubit/auth_cubit.dart';
import 'package:jobsque/view/Auth/forgetpassword/check_email_screen.dart';
import 'package:jobsque/widgets/default_form_filed.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/title_login.dart';
import '../../../widgets/primary_logo.dart';
import '../login/login_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //title
                TitleLogin(
                    hieght: 100,
                    title: 'Reset Password',
                    destrbute:
                        "Enter the email address you used when you joined and we will send you instructions to reset your password.",
                    fontsize: 30.sp,
                    fontsizesubtitle: 13.sp),
                J.sizeboxh20,
                Form(
                  key: context.read<AuthCubit>().formstateupdate,
                  child: DefaultFormField(
                    controller: context.read<AuthCubit>().email,
                    keyboardType: TextInputType.name,
                    hintText: 'Enter your email....',
                    height: 55,
                    validator: (value) {
                      if (value != User().email) {
                        return 'This is not your account ';
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 320),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  DefaultText(text: "You remember your password"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text('Login'))
                ]),
                DefultButton(
                  text: 'Request password reset',
                  backgroundcolor: J.primaryColor,
                  textcolor: J.whiteColor,
                  onpressed: () {
                    if (context
                        .read<AuthCubit>()
                        .formstateupdate
                        .currentState!
                        .validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckEmail()));
                    }
                  },
                ),
              ]),
        )));
  }
}
