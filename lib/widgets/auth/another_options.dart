import 'package:flutter/material.dart';
import 'package:jobsque/view/Auth/forgetpassword/reset_password_screen.dart';

import '../../widgets/default_text.dart';

class AnotherOptions extends StatefulWidget {
  const AnotherOptions({super.key});

  @override
  State<AnotherOptions> createState() => _AnotherOptionsState();
}

class _AnotherOptionsState extends State<AnotherOptions> {
  @override
  Widget build(BuildContext context) {
    bool? index = false;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Checkbox(
                  value: index,
                  onChanged: (val) {
                    setState(() {
                      index = val;
                    });
                  }),
              DefaultText(text: 'Remember me'),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              child: Text('Forgot Password?'))
        ]));
  }
}
