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
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
