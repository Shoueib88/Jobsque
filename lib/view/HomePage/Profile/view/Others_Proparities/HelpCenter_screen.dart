import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/default_text.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              J.sizeboxh10,
              Container(
                  height: 65.h,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r)),
                          hintText: 'What can we help?',
                          prefixIcon: Icon(Icons.search)))),
              J.sizeboxh10,
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 178.h,
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: J.blackColor.withOpacity(0.3))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                                text: 'Lorem ipsum dolor sit amet',
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            Icon(Icons.keyboard_arrow_up)
                          ]),
                      DefaultText(
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',
                          fontSize: 12.sp)
                    ],
                  )),
              J.sizeboxh10,
              Container(
                height: 330.h,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) {
                    return J.sizeboxh10;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55.h,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border:
                              Border.all(color: J.blackColor.withOpacity(0.3))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultText(text: 'Lorem ipsum dolor sit amet'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
