import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/view/HomePage/HomePage/HomePageScreen.dart';
import 'package:jobsque/view/OnBoarding/onboarding/boardingScreen.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  onInitSplash(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    Timer(Duration(seconds: 4), () {
      if (token == null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Onboarding()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomepageScreen()));
      }
    });
  }

  int count = 0;
  changeText() {
    count++;
    print(count);
    emit(ChangeText());
  }
}
