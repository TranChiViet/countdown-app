import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_time.dart';
import '../widgets/countdown_button.dart';

class AddTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proTime = Provider.of<ProviderTime>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Time Minutes'),
                controller: proTime.timeController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) {
                  proTime.addtime();
                  Navigator.of(context).pop();
                },
              ),
            ]),
      ),
    );
  }
}
