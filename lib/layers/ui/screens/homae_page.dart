import 'package:flutter/material.dart';

class HomaePage extends StatelessWidget {
  const HomaePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hi To the golden Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
