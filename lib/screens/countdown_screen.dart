import 'package:countdown_app/widgets/countdown_button.dart';
import 'package:countdown_app/widgets/countdown_time.dart';
import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'T I M E R',
          style: TextStyle(
            color: Color.fromARGB(255, 123, 105, 105),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 123, 105, 105),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountdownTime(),
          const SizedBox(
            height: 50,
          ),
          CountdownButton(),
        ],
      ),
      // ),
    );
  }
}
