import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../consts/style.dart';
import '../../../../../widgets/default_text.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 25,
        //padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          J.sizeboxh20,
          DefaultText(
              text: 'Job Description',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
          J.sizeboxh10,
          DefaultText(
              text:
                  '''Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.
                                ''',
              fontSize: 12.sp,
              fontWeight: FontWeight.w800),
          J.sizeboxh20,
          DefaultText(
              text: 'Skill Required',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
          J.sizeboxh20,
          DefaultText(
              text:
                  '''. A strong visual portfolio with clear understanding of UI methodologies
. Ability to create hi-fidelity mock-ups in Figma
. Ability to create various graphics for the web e.g. illustrations and icons
. Able to facilitate workshops and liaise with stakeholder
. Proficiency in the Adobe Creative Suite
. Confident communicator with an analytical mindset
. Design library/Design system experience
. 4+ years of commercial experience in UI/Visual Design''',
              fontSize: 12.sp,
              fontWeight: FontWeight.w800),
        ]));
  }
}
