import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/data.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../consts/style.dart';
import '../../../Home/controller/cubit/home_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final controller = context.read<HomeCubit>();
              return ListView.separated(
                itemCount: countycode.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountryFlag.fromLanguageCode(
                          countycode[index],
                          width: 40.w,
                          height: 40.h,
                        ),
                        RoundCheckBox(
                            onTap: (selected) {
                              controller.selectJobType(selected!, index);
                            },
                            isChecked: controller.currentindex == index
                                ? controller.selectjobtype
                                : false,
                            checkedColor: J.whiteColor,
                            checkedWidget: Container(
                              decoration: BoxDecoration(
                                  color: J.primaryColor,
                                  shape: BoxShape.circle),
                              margin: EdgeInsets.all(2),
                            ),
                            size: 20,
                            border: Border.all(
                              color: (controller.currentindex == index &&
                                      controller.selectjobtype == true)
                                  ? J.primaryColor
                                  : J.blackColor.withOpacity(0.4),
                            ))
                      ]);
                },
              );
            },
          )),
    );
  }
}
