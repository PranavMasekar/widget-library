import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerWidget extends StatefulWidget {
  final int time;
  final Function? restartTimer;
  const TimerWidget({super.key, required this.time, this.restartTimer});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  int _countdown = 90;

  @override
  void initState() {
    super.initState();
    _countdown = widget.time;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  void restartTimer() {
    setState(() {
      _timer?.cancel();
      _countdown = widget.time;
      startTimer();
    });
  }

  String getFormattedTime() {
    int minutes = _countdown ~/ 60;
    int seconds = _countdown % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getFormattedTime(),
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

Widget useTimerWidget() {
  GlobalKey<_TimerWidgetState> timerKey = GlobalKey<_TimerWidgetState>();

  void restartTimer() {
    timerKey.currentState?.restartTimer();
  }

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimerWidget(key: timerKey, time: 90),
        ElevatedButton(
          onPressed: restartTimer,
          child: const Text('Restart Timer'),
        ),
      ],
    ),
  );
}
