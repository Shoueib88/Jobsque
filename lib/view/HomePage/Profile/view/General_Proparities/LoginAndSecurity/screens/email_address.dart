import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/default_form_filed.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class EmailAddress extends StatelessWidget {
  const EmailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email address'), centerTitle: true),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final controller = context.read<ProfileCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: controller.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(text: '\t\t\t\t\tMain e-mail address'),
                          SizedBox(height: 4.h),
                          DefaultFormField(
                            width: MediaQuery.of(context).size.width,
                            controller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Email address',
                            prefixIcon: Icon(Icons.email_outlined,
                                color: J.blackColor.withOpacity(0.3)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'no valid';
                              }
                              return null;
                            },
                          )
                        ]),
                  ),
                  DefultButton(
                      onpressed: () {
                        if (controller.formKey.currentState!.validate()) {}
                      },
                      text: 'Save',
                      textcolor: J.whiteColor,
                      backgroundcolor: J.primaryColor)
                ],
              );
            },
          )),
    );
  }
}
