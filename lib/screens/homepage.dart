import 'package:flutter/material.dart';
import 'package:mero_kharcha/widgets/chart.dart';
import 'package:mero_kharcha/widgets/new_transcation.dart';
import 'package:mero_kharcha/widgets/transcation_list.dart';

import '../models/transcation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transcation> _userTrascations = [];

  List<Transcation> get _recentTranscations {
    return _userTrascations.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTranscation(String txTitle, double txAmount) {
    final newTx = Transcation(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTrascations.add(newTx);
    });
  }

  void _startAddNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTranscation(addTranscation: _addNewTranscation);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 2,
        title: const Text(
          'Mero Kharcha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(recentTranscations: _recentTranscations),
            TranscationList(_userTrascations),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTranscation(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
