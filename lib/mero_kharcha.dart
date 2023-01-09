import 'package:flutter/material.dart';
import 'package:mero_kharcha/screens/homepage.dart';

class MeroKharcha extends StatelessWidget {
  const MeroKharcha({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Kharcha',
      home: const Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
        fontFamily: 'Quicksand',
      ),
    );
  }
}
