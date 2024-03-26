import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../consts/style.dart';
import '../../../../../../../widgets/default_text.dart';
import '../../../../../../../widgets/defult_button.dart';
import '../../../../../Home/controller/cubit/home_cubit.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final controller = context.read<HomeCubit>();
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(text: 'Main phone number'),
                        SizedBox(height: 4.h),
                        TextFormField(
                            controller: TextEditingController(),
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusColor: J.primaryColor,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.countrycodepicker(context);
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                                child: controller.countryCode !=
                                                        null
                                                    ? controller.countryCode!
                                                        .flagImage(
                                                            fit: BoxFit.fill)
                                                    : null),
                                            const SizedBox(width: 5),
                                            Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                            DefaultText(
                                                text: '|',
                                                fontSize: 20,
                                                color: J.blackColor
                                                    .withOpacity(0.3))
                                          ]),
                                    )),
                                hintText: 'phone number')),
                        J.sizeboxh10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 200.w,
                                child: DefaultText(
                                    text:
                                        'Use the phone number to reset your password')),
                            Switch(
                                value: controller.selectjobtype,
                                onChanged: (val) {
                                  controller.selectJobType(val, 0);
                                })
                          ],
                        )
                      ]);
                },
              ),
              DefultButton(
                  text: 'Save',
                  textcolor: J.whiteColor,
                  backgroundcolor: J.primaryColor)
            ],
          )),
    );
  }
}
