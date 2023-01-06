import 'dart:async';

import 'package:countdown_app/screens/add_time_screen.dart';
import 'package:flutter/material.dart';
import '/provider/provider_time.dart';
import 'package:provider/provider.dart';

class CountdownTime extends StatefulWidget {
  @override
  State<CountdownTime> createState() => _CountdownTimeState();
}

class _CountdownTimeState extends State<CountdownTime> {
  @override
  Widget build(BuildContext context) {
    final proTime = Provider.of<ProviderTime>(context);
    final time = proTime.duration;

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minute = twoDigits(time.inMinutes.remainder(60));
    final second = twoDigits(time.inSeconds.remainder(60));
    final currentSec = proTime.duration.inSeconds;
    final maxSec = proTime.countdownDuration.inSeconds;

    return Container(
      height: 300,
      width: 300,
      child: Stack(fit: StackFit.expand, children: [
        CircularProgressIndicator(
          value: (maxSec == 0) ? 0 : (1 - currentSec / maxSec),
          strokeWidth: 15,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Provider<ProviderTime>(
                create: (_) => ProviderTime(),
                child: ListTile(
                  title: Text(
                    (maxSec == 0) ? 'Click' : '$minute:$second',
                    style: const TextStyle(fontSize: 55),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    (maxSec == 0)
                        ? 'Input time'
                        : 'left of ${proTime.countdownDuration.inMinutes.remainder(60)}mins',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return AddTimeScreen();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
