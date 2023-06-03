import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText, isReadOnly, isMandatory, isTitlePresent;
  final int multiLines;
  final Function(String)? onchanged;
  final Function(String)? onSubmit;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? titleStyle, textFormStyle, hintStyle, labelStyle;
  final Color? borderColor, fillColor;
  final EdgeInsets? contentPadding;
  final double borderRadius;
  final String? obsecureCharacter;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.isReadOnly = false,
    this.isMandatory = false,
    this.isTitlePresent = true,
    this.multiLines = 1,
    this.onchanged,
    this.onSubmit,
    this.suffixIcon,
    this.prefixIcon,
    this.titleStyle,
    this.textFormStyle,
    this.hintStyle,
    this.labelStyle,
    this.borderColor,
    this.fillColor,
    this.contentPadding,
    this.borderRadius = 6,
    this.obsecureCharacter = "*",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(isTitlePresent.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitlePresent
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: titleStyle,
                    ),
                    TextSpan(
                      text: isMandatory ? ' *' : '',
                      style: titleStyle?.copyWith(
                        letterSpacing: 0.04,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(height: isTitlePresent ? 10.h : 0),
        SizedBox(
          child: TextFormField(
            maxLines: multiLines,
            obscureText: obscureText,
            controller: controller,
            readOnly: isReadOnly,
            obscuringCharacter: obsecureCharacter!,
            keyboardType: inputType,
            style: textFormStyle,
            onChanged: (value) {
              if (onchanged != null) {
                onchanged!(value);
              }
            },
            onFieldSubmitted: (value) {
              if (onSubmit != null) {
                onSubmit!(value);
              }
            },
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius.r),
              ),
              filled: true,
              fillColor: fillColor,
              hintText: hintText,
              hintStyle: hintStyle,
              labelStyle: labelStyle,
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                      horizontal: 10.h, vertical: multiLines > 1 ? 10.h : 0),
            ),
          ),
        ),
      ],
    );
  }
}

Widget useTextField() {
  final TextEditingController nameController = TextEditingController();
  return CustomTextField(
    label: "Full name",
    hintText: "Enter full name",
    controller: nameController,
    borderRadius: 10,
    titleStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
    isMandatory: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
    fillColor: Colors.white.withOpacity(0.5),
    borderColor: Colors.grey.withOpacity(0.6),
  );
}
