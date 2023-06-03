import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownTextField extends StatefulWidget {
  final double height, width;
  final String hintText, label;
  final bool isMandatory;
  final List<String> items;
  final String? initialValue;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextStyle? titleStyle, hintStyle, textStyle;
  final Color? borderColor, color;

  const DropDownTextField({
    Key? key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.label,
    this.isMandatory = false,
    required this.items,
    this.initialValue,
    required this.controller,
    this.onChanged,
    this.titleStyle,
    this.hintStyle,
    this.textStyle,
    this.borderColor = Colors.grey,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  int index = 0;
  String? selectedString;
  @override
  void initState() {
    super.initState();
    selectedString = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: widget.titleStyle,
              ),
              TextSpan(
                text: widget.isMandatory ? ' *' : '',
                style: widget.titleStyle?.copyWith(
                  letterSpacing: 0.04,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(width: 1, color: widget.borderColor!),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: widget.controller.text == ""
                    ? null
                    : widget.controller.text,
                hint: Text(
                  widget.hintText,
                  style: widget.hintStyle,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.h,
                  color: widget.borderColor,
                ),
                isDense: true,
                style:
                    widget.textStyle?.copyWith(overflow: TextOverflow.ellipsis),
                items: widget.items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    index = widget.items.indexOf(newValue!);
                    selectedString = widget.items[index];
                    widget.controller.text = selectedString!;
                  });
                  if (widget.onChanged != null) widget.onChanged!(newValue!);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget useDropDown() {
  TextEditingController genderController = TextEditingController();
  return DropDownTextField(
    height: 44.h,
    width: 140.w,
    label: "Gender",
    items: const ["Male", "Female", "Other"],
    hintText: "Gender",
    controller: genderController,
    isMandatory: true,
    titleStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
  );
}
