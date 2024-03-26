import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/data.dart';
import 'package:jobsque/view/HomePage/HomePage/controller/cubit/homepage_cubit.dart';

import '../../../widgets/homepage/custom_bottm_navbar.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageState>(
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(
                currentIndex: context.watch<HomepageCubit>().index,
                list: bottomNavigationBarData,
                onTap: (value) {
                  context.read<HomepageCubit>().changeCurrentIndex(value);
                }),
            body: screens.elementAt(context.watch<HomepageCubit>().index));
      },
    );
  }
}
