import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/search/widget/job_info.dart';
import 'package:jobsque/view/HomePage/Home/search/widget/jobtypeDialog.dart';

import '../../../../consts/assets.dart';
import '../../../../widgets/default_text.dart';
import '../../../../widgets/homepage/custom_matrialbutton.dart';
import '../controller/cubit/home_cubit.dart';

// ignore: must_be_immutable
class SearchScreenTwo extends StatelessWidget {
  SearchScreenTwo({super.key, required this.currentindex});
  int? currentindex;

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
      JobInformation(),
      context.read<HomeCubit>().listOfData.isEmpty
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Image.asset('asset/images/Search no found.png',
                            fit: BoxFit.fill)),
                    J.sizeboxh10,
                    Container(
                        width: 290.w,
                        height: 130.h,
                        child: Center(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DefaultText(
                                text: 'No new notifications yet',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                              DefaultText(
                                text:
                                    'You will receive a notification if there is something on your account',
                                fontSize: 13,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ))
                  ]),
            )
          : Container(
              color: J.greyColor.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 5.0, left: 18.0),
              height: 35,
              child: DefaultText(
                text: 'Featuring 120+ jobs',
                fontSize: 16,
                color: J.blackColor.withOpacity(0.5),
              )),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 170.h,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final controller = context.read<HomeCubit>();
              return GestureDetector(
                onTap: () {
                  JobTypeDialog().jobTypeDialog(context);
                },
                child: Container(
                    color: J.whiteColor,
                    height: 110.h,
                    //color: J.activecolor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                              leading: Image.network(
                                  controller.listOfData[currentindex!].image!,
                                  //Assets.facebook,
                                  height: 45.h,
                                  width: 50.w,
                                  fit: BoxFit.fill),
                              trailing: GestureDetector(
                                  child: Image.asset(
                                      archivemunse[currentindex!],
                                      fit: BoxFit.fill)),
                              isThreeLine: true,
                              title: DefaultText(
                                  text: controller
                                      .listOfData[currentindex!].name!,
                                  //'Senior UI Designer',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp),
                              subtitle: DefaultText(
                                  text: (controller
                                          .listOfData[currentindex!].jobType! +
                                      ' , ' +
                                      controller
                                          .listOfData[currentindex!].compName!)
                                  //'Twitter • Jakarta, Indonesia ',
                                  )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomMatrialButton(
                                    text: 'Fulltime', onPressed: () {}),
                                CustomMatrialButton(
                                    text: 'Remote', onPressed: () {}),
                                CustomMatrialButton(
                                    text: 'Senior', onPressed: () {}),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: controller
                                          .listOfData[currentindex!].salary,
                                      // "\K",
                                      style: TextStyle(
                                          color: J.greenColor, fontSize: 14)),
                                  TextSpan(
                                      text: '/Month',
                                      style: TextStyle(
                                          color: J.blackColor, fontSize: 12)),
                                ]))
                              ])
                        ])),
              );
            },
          ))
    ]))));
  }
}
