import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultText extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextStyle? style;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  int? maxLines;
  TextAlign? textAlign;

  DefaultText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.style,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        style: style != null
            ? style!.copyWith(
                color: color,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontStyle: fontStyle,
              )
            : TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
              ));
  }
}
