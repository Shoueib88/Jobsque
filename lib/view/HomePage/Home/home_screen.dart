import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/job_details_screen.dart';
import 'package:jobsque/view/HomePage/Home/ApplyJob/widget/notification_job.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/homepage/custom_matrialbutton.dart';
import 'package:jobsque/widgets/homepage/custom_search_job.dart';
import 'package:jobsque/widgets/homepage/custom_text_view_all.dart';
import 'package:jobsque/widgets/homepage/custom_titleandnotification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Center(child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final controller = context.read<HomeCubit>();

          return Column(children: [
            SizedBox(
              height: 50.h,
            ),
            CustomTitleAndNotification(),
            J.sizeboxh20,
            SearchJobs(text: 'Type something...', width: 310.w),
            J.sizeboxh10,
            controller.jobnoti == 'empty'
                ? Container()
                : (controller.value == true ? JobNotification() : Container()),
            J.sizeboxh10,
            CustomText(text: 'Suggested Job', onPressed: () {}),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Image.asset('asset/images/Zoom Job.png'),
              J.sizeboxw10,
              Image.asset('asset/images/Slack Job.png'),
            ]),
            CustomText(text: 'Recent', onPressed: () {}),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 275.h,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.listOfData.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 25);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 110.h,
                          //color: J.activecolor,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ListTile(
                                    leading: Image.network(
                                        controller.listOfData[index].image!,
                                        //Assets.facebook,
                                        height: 45.h,
                                        width: 50.w,
                                        fit: BoxFit.fill),
                                    trailing: InkWell(
                                        onTap: () {
                                          controller.saveItim(index);
                                        },
                                        child: controller.isSaved[index]
                                            ? Image.asset(
                                                'asset/icons/activatebottom/archive-minus.png',
                                                fit: BoxFit.fill)
                                            : Image.asset(
                                                'asset/icons/archive-minus.png',
                                                fit: BoxFit.fill)),
                                    isThreeLine: true,
                                    title: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      JobDetiales(
                                                          index: index)));
                                        },
                                        child: DefaultText(
                                            text: controller
                                                .listOfData[index].name!,
                                            fontWeight: FontWeight.bold,
                                            color: J.blackColor,
                                            fontSize: 17.sp)),
                                    subtitle: DefaultText(
                                        text: (controller
                                                .listOfData[index].jobType! +
                                            ' , ' +
                                            controller
                                                .listOfData[index].compName!)
                                        //'Twitter • Jakarta, Indonesia ',
                                        )),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                                .listOfData[index].salary,
                                            // "\K",
                                            style: TextStyle(
                                                color: J.greenColor,
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '/Month',
                                            style: TextStyle(
                                                color: J.blackColor,
                                                fontSize: 12)),
                                      ]))
                                    ])
                              ]));
                    }))
          ]);
        },
      )),
    ));
  }
}
