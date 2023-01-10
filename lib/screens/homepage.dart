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

  void _addNewTranscation(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transcation(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
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

  void _deleteTranscation(String id) {
    setState(() {
      _userTrascations.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.purple,
      elevation: 2,
      title: const Text(
        'Mero Kharcha',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(recentTranscations: _recentTranscations)),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TranscationList(_userTrascations, _deleteTranscation),
            ),
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
