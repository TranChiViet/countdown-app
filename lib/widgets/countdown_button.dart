import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_time.dart';

class CountdownButton extends StatefulWidget {
  
  @override
  State<CountdownButton> createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  // bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final proTime = Provider.of<ProviderTime>(context,);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            proTime.reset();
          },
          icon: Icon(
            Icons.restart_alt,
            size: 60,
            color: Theme.of(context).primaryColor,
          ),
          iconSize: 60,
        ),
        IconButton(
          onPressed: () {
            proTime.Active ? proTime.pause() : proTime.start();
            proTime.isActive(); 
          },
          icon: Icon(
            proTime.Active ? Icons.pause_circle : Icons.play_circle,
            size: 80,
            color: Theme.of(context).primaryColor,
          ),
          iconSize: 80,
        ),
        IconButton(
          onPressed: () {
            proTime.stop();
          },
          icon: Icon(
            Icons.cancel_outlined,
            size: 60,
            color: Theme.of(context).primaryColor,
          ),
          iconSize: 60,
        ),
      ],
    );
  }
}
