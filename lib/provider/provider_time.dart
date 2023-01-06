import 'dart:async';

import 'package:flutter/material.dart';

class ProviderTime with ChangeNotifier {
  Duration countdownDuration = Duration();
  Duration duration = Duration();
  Timer? _timer;
  final timeController = TextEditingController();
  bool Active = false;

  void reset() {
    duration = countdownDuration;
    Active = false;
    _timer?.cancel();
    notifyListeners();
  }

  void isActive(){
    Active = !Active;
    notifyListeners();
  }

  void stop() {
    duration = Duration();
    countdownDuration = Duration();
    Active = false;
    _timer?.cancel();
    notifyListeners();
  }

  void start() {
    int subDuration = 1;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final seconds = duration.inSeconds - subDuration;
      if (seconds < 0) {
        _timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
        notifyListeners();
      }
    });
  }

  void pause() {
    _timer?.cancel();
    notifyListeners();
  }

  void addtime() {
    final enterTime = int.parse(timeController.text);
    if (timeController == null || enterTime <= 0) {
      return;
    }
    duration = Duration(minutes: enterTime);
    countdownDuration = Duration(minutes: enterTime);
    Active = false;
    _timer?.cancel();
    notifyListeners();
  }
}
