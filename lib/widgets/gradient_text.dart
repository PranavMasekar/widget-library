import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    required this.gradient,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

Widget useGradientText() {
  return GradientText(
    "Gradient Text",
    style: TextStyle(fontSize: 24.sp),
    gradient: const LinearGradient(
      colors: [
        Color(0xffF8E097),
        Color(0xffC4A65B),
        Color(0xffF8E097),
        Color(0xffC4A65B),
        Color(0xffF8E097),
      ],
    ),
  );
}
