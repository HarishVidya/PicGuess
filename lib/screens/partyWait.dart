import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PartyWait extends StatefulWidget {
  const PartyWait({super.key});

  @override
  State<PartyWait> createState() => _PartyWaitState();
}

class _PartyWaitState extends State<PartyWait> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Waiting for players',
            style: TextStyle(
              fontSize: 46,
            ),
          ),
          
        ],)
    );
  }
}