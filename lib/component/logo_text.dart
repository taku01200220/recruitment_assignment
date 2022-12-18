import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'ServiceName',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
