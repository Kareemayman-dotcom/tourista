import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tourista/constants.dart';

class ParagraphWidget extends StatelessWidget {
  final String header;
  final String text;
  const ParagraphWidget({
    required this.header,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(text: " $header\n", style: titleStyle, children: [
          const TextSpan(text: "\n"),
          TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ))
        ]),
      ),
    );
  }
}
