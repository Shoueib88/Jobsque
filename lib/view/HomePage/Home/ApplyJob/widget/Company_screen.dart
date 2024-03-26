import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';

void main() => runApp(const DetialsCompany());

class DetialsCompany extends StatelessWidget {
  const DetialsCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final controller = context.read<HomeCubit>();

        print('data == ${controller.dataofcompany.length}');
        return Container(
          width: MediaQuery.of(context).size.width - 25,
          height: 480.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: controller.dataofcompany.length,
            separatorBuilder: (BuildContext context, int index) {
              return J.sizeboxh10;
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  J.sizeboxh20,
                  DefaultText(
                      text: '\t\t\tContact Us',
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  J.sizeboxh10,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: J.blackColor.withOpacity(0.2))),
                            width: 158.w,
                            height: 57.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                      text: 'email',
                                      color: J.blackColor.withOpacity(0.4)),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DefaultText(
                                          text: controller
                                              .dataofcompany[index].email!,
                                          fontSize: 12.sp))
                                ])),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: J.blackColor.withOpacity(0.2))),
                            width: 158.w,
                            height: 57.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                      text: 'website',
                                      color: J.blackColor.withOpacity(0.4)),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DefaultText(
                                        text: controller
                                            .dataofcompany[index].website!,
                                        fontSize: 12.sp,
                                      ))
                                ])),
                      ]),
                  J.sizeboxh20,
                  DefaultText(
                      text: '\t\t\tAbout Company',
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  J.sizeboxh20,
                  DefaultText(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      text: controller.dataofcompany[index].about!),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
