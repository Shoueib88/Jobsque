import 'package:flutter/material.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/view/OnBoarding/controller/cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashCubit().onInitSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('asset/images/Blur.png'),
                  Image.asset(Assets.logo)
                ],
              ))),
    );
  }
}
