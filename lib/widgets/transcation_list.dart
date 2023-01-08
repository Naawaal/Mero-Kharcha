import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;

  const TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transcations.map((tx) {
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
