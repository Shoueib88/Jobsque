import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefultButton extends StatelessWidget {
  String text;
  Color? backgroundcolor;
  Color? textcolor;
  void Function()? onpressed;
  DefultButton({
    super.key,
    required this.text,
    this.backgroundcolor,
    this.onpressed,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 25,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: MaterialButton(
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: textcolor,
            ),
          )),
    );
  }
}
