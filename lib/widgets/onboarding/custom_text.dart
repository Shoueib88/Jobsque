import 'package:flutter/material.dart';

import 'package:jobsque/consts/style.dart';

class BigText1 extends StatelessWidget {
  const BigText1({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Find a job, and  ', // Non-colored text
            style: TextStyle(
                color: J.blackColor, // Colored text
                fontSize: 32.0,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
          TextSpan(
              text: 'start building',
              style: TextStyle(
                  color: J.primaryColor, // Colored text
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const TextSpan(
            text: ' your career from now on',
          ),
        ]));
  }
}

class BigText2 extends StatelessWidget {
  const BigText2({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text:
                'Hundreds of jobs are waiting for you to ', // Non-colored text
            style: TextStyle(
                color: J.blackColor, // Colored text
                fontSize: 32.0,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
          TextSpan(
              text: 'join together',
              style: TextStyle(
                  color: J.primaryColor, // Colored text
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}

class BigText3 extends StatelessWidget {
  const BigText3({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Get the best', // Non-colored text
            style: TextStyle(
                color: J.blackColor, // Colored text
                fontSize: 32.0,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
          TextSpan(
              text: ' choice for the job',
              style: TextStyle(
                  color: J.primaryColor, // Colored text
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const TextSpan(text: "  you've always dreamed of"),
        ]));
  }
}
