import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  final Indicator indicator;
  final List<Color> colors;
  final double? height, width;
  const LoadingWidget({
    Key? key,
    this.indicator = Indicator.ballBeat,
    this.colors = const [Colors.grey],
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: LoadingIndicator(
          indicatorType: indicator,
          colors: colors,
        ),
      ),
    );
  }
}

Widget useLoading() {
  return LoadingWidget(
    height: 100.h,
    width: 100.w,
    indicator: Indicator.orbit,
    colors: const [Colors.orange],
  );
}
