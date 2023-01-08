import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/transcation.dart';

class TranscationList extends StatefulWidget {
  const TranscationList({super.key});

  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  final List<Transcation> _userTrascations = [
    Transcation(
      id: 't1',
      title: 'Kahja Khako',
      amount: 280,
      date: DateTime.now(),
    ),
    Transcation(
      id: 't2',
      title: 'Travel Expenses',
      amount: 30,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTrascations.map((tx) {
        return Card(
          elevation: 1.5,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                child: Text('Rs: ${tx.amount}',
                    style: const TextStyle(
                      fontSize: 15,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tx.title,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  Text(DateFormat.yMMMd().format(tx.date),
                      style: const TextStyle(fontSize: 15.0)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
