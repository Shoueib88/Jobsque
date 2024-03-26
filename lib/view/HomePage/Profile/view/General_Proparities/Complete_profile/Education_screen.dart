import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../../../consts/style.dart';
import '../../../../../../widgets/default_text.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                J.sizeboxh20,
                Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 475,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: J.blackColor.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text: 'University*'),
                              TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                      hintText: 'University'))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text: 'Title'),
                              TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                      hintText: 'Title'))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text: 'Start year'),
                              TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1500),
                                                lastDate: DateTime(2050));
                                          },
                                          child:
                                              Icon(Icons.date_range_outlined)),
                                      hintText: 'Start year'))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text: 'End year'),
                              // SizedBox(height: 8.h),
                              TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1500),
                                                lastDate: DateTime(2050));
                                          },
                                          child:
                                              Icon(Icons.date_range_outlined)),
                                      hintText: 'End year'))
                            ]),
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            return DefultButton(
                                onpressed: () {
                                  context.read<ProfileCubit>().educationModel();
                                  Timer(Duration(seconds: 2), () {
                                    Navigator.of(context).pop();
                                  });
                                },
                                text: 'Save',
                                textcolor: J.whiteColor,
                                backgroundcolor: J.primaryColor);
                          },
                        )
                      ],
                    )),
                J.sizeboxh20,
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: J.blackColor.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: ListTile(
                        trailing: Icon(Icons.edit, color: J.primaryColor),
                        title: DefaultText(
                            text: 'The University of Arizona',
                            fontWeight: FontWeight.bold),
                        subtitle: DefaultText(
                            text: 'Bachelor of Art and Design \n 2012 - 2015',
                            color: J.greyColor),
                        leading: SizedBox(
                          width: 35.w,
                          height: 35.h,
                          child: Image.asset('asset/images/university.png',
                              fit: BoxFit.fill),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
