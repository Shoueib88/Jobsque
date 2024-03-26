import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Applied/widget/active_jobs.dart';
import 'package:jobsque/view/HomePage/Applied/widget/rejected_job.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';

import '../../../consts/style.dart';

void main() => runApp(const AppliedScreen());

class AppliedScreen extends StatelessWidget {
  const AppliedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: J.whiteColor,
        appBar: AppBar(
          title: const Text('Applied Job'),
          centerTitle: true,
          leading: J.sizeboxw10,
        ),
        body: Center(
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          final controller = context.read<HomeCubit>();
          return ListView(children: [
            J.sizeboxh20,
            DefaultTabController(
                length: 2,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: J.blackColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25)),
                        child: TabBar(
                            onTap: (val) {
                              controller.selectLabel(val);
                            },
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xff02337A)),
                            labelColor: J.whiteColor,
                            unselectedLabelColor: J.blackColor.withOpacity(0.5),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(child: DefaultText(text: "Active")),
                              Tab(child: DefaultText(text: "Rejected")),
                            ])))),
            J.sizeboxh20,
            _tab.elementAt(controller.selectedlabel),
          ]);
        })));
  }
}

List _tab = [ActiveJobs(), RejectedJobs()];
