import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/widget/custom_taskbar.dart';
import 'package:jobsque/view/HomePage/Profile/widget/data_aboutuser.dart';
import 'package:jobsque/view/HomePage/Profile/widget/proparities_profile.dart';
import 'package:jobsque/widgets/default_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: J.primaryColor.withOpacity(0.3),
          leading: J.sizeboxw10,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 15.w),
                child: Icon(Icons.logout, color: Colors.red, size: 20.h))
          ]),
      body:
          SingleChildScrollView(child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final controller = context.watch<ProfileCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 165.h,
                    padding: EdgeInsets.all(10),
                    color: J.primaryColor.withOpacity(0.3)),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 120),
                  // width: 80.w,
                  // height: 80.h,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: J.whiteColor),
                      shape: BoxShape.circle),
                  child: controller.imagepath == ''
                      ? CircleAvatar(
                          backgroundImage:
                              AssetImage('asset/images/img_profile_90x90.png'),
                          radius: 45.r)
                      : CircleAvatar(
                          backgroundImage: FileImage(controller.image),
                          radius: 45.r),
                ))
              ]),
              DefaultText(text: 'shoueib'),
              DefaultText(text: 'flutter'),
              J.sizeboxh10,
              DataAboutUser(),
              J.sizeboxh10,
              CustomTaskBar(text: 'General'),
              GeneralProparities(),
              J.sizeboxh20,
              CustomTaskBar(text: 'Others'),
              J.sizeboxh10,
              OtherProparities()
            ],
          );
        },
      )),
    );
  }
}
