import 'package:flutter/material.dart';

class GestureWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? ontap;
  const GestureWrapper({
    Key? key,
    required this.child,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ontap != null) {
          ontap!();
        }
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
