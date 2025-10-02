import 'package:flutter/material.dart';

class HomaePage extends StatelessWidget {
  const HomaePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body:Center(child: Text(
        'Hi Ahmed',style: TextStyle(fontWeight: FontWeight.bold),
      ),)
    );
  }
}
