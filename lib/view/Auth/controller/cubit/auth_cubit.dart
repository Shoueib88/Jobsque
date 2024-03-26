import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/model/AuthModel/LoginModel.dart';
import 'package:jobsque/services/AuthServices/CreateAccountServices.dart';
import 'package:jobsque/services/AuthServices/LoginService.dart';
import 'package:jobsque/services/AuthServices/UpDateServices.dart';
import 'package:jobsque/view/Auth/controller/cubit/auth_state.dart';
import 'package:jobsque/view/Auth/forgetpassword/create_new_password.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  final formstatecreateaccount = GlobalKey<FormState>();
  final formstatelogin = GlobalKey<FormState>();
  final formstateupdate = GlobalKey<FormState>();
  final formstatenewpassword = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final _createaccountservices = CreateAccountServices();
  final _loginservices = LoginServices();
  final _Updateservices = UpDateServices();

  final loginpassword = TextEditingController();
  final loginemail = TextEditingController();

  registerAccount(BuildContext context) async {
    await _createaccountservices.registerAccount(
        context, username.text, password.text, email.text);
    emit(CreateAccountState());
  }

  loginService(BuildContext context) async {
    await _loginservices.loginService(
        context, loginemail.text, loginpassword.text);
    emit(LoginState());
  }

  upDatePassword(BuildContext context) async {
    await _Updateservices.updatePassword(context, password.text);
    emit(UpDatePassword());
  }

  checkEmail(BuildContext context) {
    if (email.text == User().email) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CreateNewPassword()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('This is not your account')));
    }
    emit(CheckEmail());
  }
}
