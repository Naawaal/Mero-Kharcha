import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;

  const TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: transcations.length,
            itemBuilder: (ctx, index) {
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
                      child: Text('Rs: ${transcations[index].amount}',
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transcations[index].title,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                        Text(
                            DateFormat.yMMMd().format(transcations[index].date),
                            style: const TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
