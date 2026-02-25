import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobsque/view/Auth/controller/cubit/auth_cubit.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/view/HomePage/HomePage/controller/cubit/homepage_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Saved/controller/cubit/saved_cubit.dart';
import 'package:jobsque/view/OnBoarding/Splash/splashScreen.dart';
import 'view/OnBoarding/controller/cubit/splash_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashCubit()),
          BlocProvider(create: (context) => AuthCubit()..loginService(context)),
          BlocProvider(create: (context) => HomepageCubit()),
          BlocProvider(
              create: (context) => HomeCubit()
                ..getAllJbos(context)
                ..getDataOfCompany(context)),
          BlocProvider(create: (context) => ProfileCubit()),
          BlocProvider(create: (context) => SavedCubit()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    CountryLocalizations.delegate,
                    DefaultMaterialLocalizations.delegate,
                    DefaultWidgetsLocalizations.delegate
                  ],
                  supportedLocales: const [Locale('en', 'US')],
                  theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: J.primaryColor)),
                  home: child);
            },
            child: const Directionality(
              textDirection: TextDirection.ltr,
              child: SplashScreen(),
            )));
  }
}
