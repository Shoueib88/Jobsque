import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/view/HomePage/Messages/chatscreen.dart';

import '../../../../../consts/style.dart';
import '../../../../../widgets/default_text.dart';

class JobNotification extends StatelessWidget {
  JobNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final controller = context.read<HomeCubit>();
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              width: 330.w,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: J.primaryColor.withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(controller.listOfData[0].image!,
                      width: 45.w, height: 45.h, fit: BoxFit.fill),
                  Container(
                    width: 130.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DefaultText(
                              text: controller.listOfData[0].name!,
                              fontWeight: FontWeight.bold),
                          DefaultText(
                              text:
                                  'Waiting to be selected by the twitter team',
                              fontSize: 11.sp,
                              color: J.blackColor.withOpacity(0.5))
                        ]),
                  ),
                  Container(
                      width: 85.w,
                      height: 37,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: J.primaryColor.withOpacity(0.3)),
                      child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: DefaultText(
                                text: 'Submited',
                                color: J.primaryColor,
                                fontSize: 12),
                          )))
                ],
              )),
        );
      },
    );
  }
}
