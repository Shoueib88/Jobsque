import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';

import '../../../../../consts/style.dart';
import '../../../../../widgets/default_text.dart';
import '../General_Proparities/Complete_profile/Complete_profile.dart';

// ignore: must_be_immutable
class One extends StatelessWidget {
  One({super.key});
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profilecontrol = context.read<ProfileCubit>();
        return Column(
          children: [
            Container(
                height: 87.h,
                decoration: BoxDecoration(
                    color: (profilecontrol.zero == index)
                        ? J.primaryColor.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: (profilecontrol.zero == index)
                          ? J.primaryColor
                          : J.blackColor.withOpacity(0.3),
                    )),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => complete_screen[index]));
                    },
                    leading: Container(
                        width: 31.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (profilecontrol.zero == index)
                              ? J.primaryColor
                              : J.blackColor.withOpacity(0.6),
                        ),
                        child: Icon(Icons.check, color: J.whiteColor)),
                    title: DefaultText(text: listcompletetext[index]),
                    subtitle:
                        DefaultText(text: listSubtitle[index], fontSize: 12),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                )),
            DefaultText(
                text: '|',
                color: (profilecontrol.zero == index)
                    ? J.primaryColor
                    : J.greyColor)
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class Two extends StatelessWidget {
  Two({super.key});
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profilecontrol = context.read<ProfileCubit>();
        return Column(
          children: [
            Container(
                height: 87.h,
                decoration: BoxDecoration(
                    color: (profilecontrol.one == index)
                        ? J.primaryColor.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: (profilecontrol.one == index)
                          ? J.primaryColor
                          : J.blackColor.withOpacity(0.3),
                    )),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => complete_screen[index]));
                    },
                    leading: Container(
                        width: 31.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (profilecontrol.one == index)
                              ? J.primaryColor
                              : J.blackColor.withOpacity(0.6),
                        ),
                        child: Icon(Icons.check, color: J.whiteColor)),
                    title: DefaultText(text: listcompletetext[index]),
                    subtitle:
                        DefaultText(text: listSubtitle[index], fontSize: 12),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                )),
            DefaultText(
                text: '|',
                color: (profilecontrol.one == index)
                    ? J.primaryColor
                    : J.greyColor)
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class Three extends StatelessWidget {
  Three({super.key});
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profilecontrol = context.read<ProfileCubit>();
        return Column(
          children: [
            Container(
                height: 87.h,
                decoration: BoxDecoration(
                    color: (profilecontrol.two == index)
                        ? J.primaryColor.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: (profilecontrol.two == index)
                          ? J.primaryColor
                          : J.blackColor.withOpacity(0.3),
                    )),
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => complete_screen[index]));
                    },
                    leading: Container(
                        width: 31.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (profilecontrol.two == index)
                              ? J.primaryColor
                              : J.blackColor.withOpacity(0.6),
                        ),
                        child: Icon(Icons.check, color: J.whiteColor)),
                    title: DefaultText(text: listcompletetext[index]),
                    subtitle:
                        DefaultText(text: listSubtitle[index], fontSize: 12),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                )),
            DefaultText(
                text: '|',
                color: (profilecontrol.two == index)
                    ? J.primaryColor
                    : J.greyColor)
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class Four extends StatelessWidget {
  Four({super.key});
  int index = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profilecontrol = context.read<ProfileCubit>();
        return Container(
            height: 87.h,
            decoration: BoxDecoration(
                color: (profilecontrol.three == index)
                    ? J.primaryColor.withOpacity(0.2)
                    : null,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: (profilecontrol.three == index)
                      ? J.primaryColor
                      : J.blackColor.withOpacity(0.3),
                )),
            child: Center(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => complete_screen[index]));
                },
                leading: Container(
                    width: 31.w,
                    height: 31.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (profilecontrol.three == index)
                          ? J.primaryColor
                          : J.blackColor.withOpacity(0.6),
                    ),
                    child: Icon(Icons.check, color: J.whiteColor)),
                title: DefaultText(text: listcompletetext[index]),
                subtitle: DefaultText(text: listSubtitle[index], fontSize: 12),
                trailing: Icon(Icons.arrow_forward),
              ),
            ));
      },
    );
  }
}
