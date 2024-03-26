import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/default_text.dart';

class TermsAndCondationScreen extends StatelessWidget {
  const TermsAndCondationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Condation'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                  text: 'Lorem ipsum dolor',
                  fontWeight: FontWeight.bold,
                  fontSize: 19.sp),
              DefaultText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                fontSize: 13.sp,
              ),
              DefaultText(
                  text: 'Lorem ipsum dolor',
                  fontWeight: FontWeight.bold,
                  fontSize: 19.sp),
              DefaultText(
                text:
                    'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                fontSize: 13.sp,
              ),
              Container(
                  padding: const EdgeInsets.all(12),
                  color: J.greyColor.withOpacity(0.3),
                  child: DefaultText(
                    text:
                        'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                    fontSize: 13.sp,
                  )),
              DefaultText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.',
                fontSize: 13.sp,
              )
            ],
          )),
    );
  }
}
