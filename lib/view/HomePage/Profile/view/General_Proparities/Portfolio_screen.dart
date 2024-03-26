import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Saved/controller/cubit/saved_cubit.dart';

import '../../../../../consts/style.dart';
import '../../../../../widgets/default_text.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              DefaultText(
                text: '\t\t\tAdd portfolio here',
                color: J.blackColor,
                fontSize: 18,
              ),
            ],
          ),
          J.sizeboxh10,
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: J.primaryColor.withOpacity(0.17),
              ),
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  color: J.primaryColor,
                  strokeWidth: 1.4,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 200.h,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: J.primaryColor.withOpacity(0.1)),
                              width: 60.w,
                              height: 60.h,
                              child: Image.asset('asset/icons/file-upload.png',
                                  fit: BoxFit.cover, color: J.primaryColor),
                            ),
                            DefaultText(
                                text: 'Upload your other file',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            DefaultText(
                                text: 'Max. file size 10 MB',
                                color: J.blackColor.withOpacity(0.4)),
                            Container(
                                width: 280.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: J.primaryColor.withOpacity(0.1),
                                    border: Border.all(color: J.primaryColor),
                                    borderRadius: BorderRadius.circular(25)),
                                child: MaterialButton(
                                    highlightColor:
                                        J.primaryColor.withOpacity(0.2),
                                    onPressed: () async {
                                      await context
                                          .read<SavedCubit>()
                                          .uploadFile();

                                      context
                                          .read<SavedCubit>()
                                          .addFileIntoList();
                                      context
                                          .read<ProfileCubit>()
                                          .protfolioModel();
                                    },
                                    child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          Icon(Icons.file_upload_outlined,
                                              color: J.primaryColor),
                                          J.sizeboxw10,
                                          DefaultText(
                                              text: 'Add file',
                                              color: J.primaryColor)
                                        ])))),
                            J.sizeboxh10
                          ]))))),
          J.sizeboxh20,
          BlocBuilder<SavedCubit, SavedState>(
            builder: (context, state) {
              final controller = context.watch<SavedCubit>();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 300.h,
                child: ListView.separated(
                  itemCount: controller.listfiles.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return J.sizeboxh10;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return controller.listfiles.isEmpty
                        ? Container()
                        : Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: J.blackColor.withOpacity(0.4),
                                )),
                            child: ListTile(
                              title: DefaultText(text: controller.filename),
                              subtitle: DefaultText(text: controller.filetype),
                              leading: Container(
                                  width: 30.w,
                                  height: 30.h,
                                  child: Image.asset('asset/images/pdf.png',
                                      fit: BoxFit.fill)),
                              trailing: Container(
                                width: 60.w,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            await controller.uploadFile();

                                            controller.addFileIntoList();
                                            context
                                                .read<ProfileCubit>()
                                                .protfolioModel();
                                          },
                                          child: Icon(Icons.edit_outlined,
                                              color: J.primaryColor)),
                                      InkWell(
                                          onTap: () {
                                            controller.listfiles
                                                .removeAt(index);
                                          },
                                          child: const Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red))
                                    ]),
                              ),
                            ));
                  },
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
