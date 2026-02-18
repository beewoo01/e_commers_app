import 'dart:async';

import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final DateTime endTime;
  const TimerWidget({super.key, required this.endTime});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late Duration remainTime;

  @override
  void initState() {
    super.initState();

    remainTime = widget.endTime.difference(DateTime.now());

    if (remainTime > Duration.zero) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        remainTime = widget.endTime.difference(DateTime.now());

        if (remainTime <= Duration.zero) {
          _timer?.cancel();
        }

        setState(() {});
      });
    }
  }

  String _printDuration(Duration duration) {
    if (duration <= Duration.zero) {
      return 'TIME OUT';
    }

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDisitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '${twoDigits(duration.inHours)} : $twoDigitMinutes:$twoDisitSeconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _printDuration(remainTime),
      style: Theme.of(context).textTheme.headlineMedium
          ?.copyWith(color: Theme.of(context).colorScheme.contentPrimary)
          .semiBold,
    );
  }
}
