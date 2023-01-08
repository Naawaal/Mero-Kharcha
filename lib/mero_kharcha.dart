import 'package:flutter/material.dart';
import 'package:mero_kharcha/screens/homepage.dart';

class MeroKharcha extends StatelessWidget {
  const MeroKharcha({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Kharcha',
      home: Homepage(),
      theme: ThemeData(),
    );
  }
}
