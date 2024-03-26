import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/data.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/Apply_Now_Screen.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../consts/style.dart';
import '../../../../widgets/homepage/custom_matrialbutton.dart';

// ignore: must_be_immutable
class JobDetiales extends StatelessWidget {
  JobDetiales({super.key, required this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Detials'),
        centerTitle: true,
        actions: [
          Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.only(right: 25),
              child: Image.asset('asset/icons/activatebottom/archive-minus.png',
                  fit: BoxFit.fill))
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        final controller = context.read<HomeCubit>();
        return Stack(alignment: Alignment.bottomCenter, children: [
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    J.sizeboxh20,
                    Image.network(controller.listOfData[index!].image!,
                        //Assets.facebook,
                        height: 55.h,
                        width: 60.w,
                        fit: BoxFit.fill),
                    J.sizeboxh10,
                    DefaultText(
                        text: controller.listOfData[index!].name!,
                        //'Senior UI Designer',
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp),
                    J.sizeboxh10,
                    DefaultText(
                        text: (controller.listOfData[index!].jobType! +
                            ' , ' +
                            controller.listOfData[index!].compName!),
                        fontSize: 19.sp),
                    J.sizeboxh10,
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomMatrialButton(text: 'Fulltime', onPressed: () {}),
                      J.sizeboxw10,
                      CustomMatrialButton(text: 'Remote', onPressed: () {}),
                      J.sizeboxw10,
                      CustomMatrialButton(text: 'Senior', onPressed: () {})
                    ]),
                    J.sizeboxh10,
                    Column(children: [
                      DefaultTabController(
                          length: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                                color: J.blackColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25)),
                            child: TabBar(
                                onTap: (val) {
                                  controller.selectLabel(val);
                                },
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff02337A)),
                                labelColor: J.whiteColor,
                                unselectedLabelColor: J.greyColor,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(child: DefaultText(text: "description")),
                                  Tab(child: DefaultText(text: "Company")),
                                  Tab(child: DefaultText(text: "people"))
                                ]),
                          )),
                      tabs.elementAt(controller.selectedlabel)
                    ])
                  ])),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: DefultButton(
                onpressed: () {
                  controller.counter = 0;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ApplyNowScreen()));
                },
                text: 'Apply Now',
                backgroundcolor: J.primaryColor,
                textcolor: J.whiteColor),
          )
        ]);
      }),
    );
  }
}
