import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/view/HomePage/Home/search/searchScreenTwo.dart';

import '../../../../widgets/default_text.dart';

class SearchScreenOne extends StatelessWidget {
  const SearchScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
      SizedBox(height: 50.h),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        Container(
            width: 275.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: J.blackColor.withOpacity(0.3))),
            child: TextFormField(
                onChanged: (value) =>
                    context.read<HomeCubit>().upDateList(value),
                controller: TextEditingController(),
                cursorColor: J.blackColor.withOpacity(0.5),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffix: Container(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Icon(Icons.cancel_outlined,
                            color: J.blackColor.withOpacity(0.4))),
                    prefixIcon: Image.asset('asset/icons/search-normal.png'),
                    hintText: 'Type somethings.....',
                    hintStyle: TextStyle(
                        fontSize: 14, color: J.blackColor.withOpacity(0.4)))))
      ]),
      J.sizeboxh20,
      Container(
          color: J.greyColor.withOpacity(0.3),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 5.0, left: 18.0),
          height: 35,
          child: DefaultText(
            text: 'Populer searches',
            fontSize: 16,
            color: J.blackColor.withOpacity(0.5),
          )),
      J.sizeboxh10,
      Container(
          height: 310.h,
          width: MediaQuery.of(context).size.width - 35,
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            final controller = context.read<HomeCubit>();
            return ListView.separated(
                itemCount: controller.displayList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 7.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SearchScreenTwo(currentindex: index)));
                    },
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Row(
                            children: [
                              Image.asset('asset/icons/search-status.png',
                                  color: J.blackColor,
                                  width: 30.w,
                                  height: 30.h),
                              J.sizeboxw10,
                              DefaultText(
                                  text: controller.displayList[index].name!),
                            ],
                          ),
                          Icon(Icons.arrow_circle_right_outlined,
                              size: 28, color: J.primaryColor)
                        ])),
                  );
                });
          }))
    ]))));
  }
}
