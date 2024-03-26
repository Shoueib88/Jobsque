import 'package:flutter/material.dart';

import '../../../../../widgets/default_text.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    bool? index = false;
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          Checkbox(
              value: index,
              onChanged: (val) {
                setState(() {
                  index = val;
                });
              }),
          DefaultText(text: 'I am currently working in this role'),
        ],
      ),
    ]);
  }
}
