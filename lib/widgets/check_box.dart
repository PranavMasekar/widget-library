import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomCheckBox extends StatelessWidget {
  final bool checkedValue;
  final Color checkColor, activeColor;
  final String text;
  final TextStyle textStyle;
  final Widget? termsAndConditions;
  final Function(bool) onChanged;

  const CustomCheckBox({
    super.key,
    required this.checkedValue,
    required this.activeColor,
    required this.checkColor,
    required this.text,
    required this.textStyle,
    this.termsAndConditions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 25.h,
          width: 25.w,
          child: Checkbox(
            value: checkedValue,
            checkColor: checkColor,
            activeColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.r),
            ),
            onChanged: (newValue) {
              onChanged(newValue!);
            },
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: activeColor),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        termsAndConditions == null
            ? Text(text, style: textStyle)
            : termsAndConditions!,
      ],
    );
  }
}

class UseCustomCheckBox extends StatefulWidget {
  const UseCustomCheckBox({super.key});

  @override
  State<UseCustomCheckBox> createState() => _UseCustomCheckBoxState();
}

class _UseCustomCheckBoxState extends State<UseCustomCheckBox> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return CustomCheckBox(
      text: "I agree with Terms and Conditions",
      textStyle: TextStyle(fontSize: 14.sp),
      activeColor: Colors.amber,
      checkColor: Colors.white,
      checkedValue: checkedValue,
      onChanged: (value) {
        setState(() {
          checkedValue = value;
        });
      },
    );
  }
}
