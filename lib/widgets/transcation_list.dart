import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTx;

  const TranscationList(
    this.transcations,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: transcations.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/waiting.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'No transcations added yet!',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: transcations.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                            child: Text('₹ ${transcations[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transcations[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transcations[index].date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTx(transcations[index].id);
                      },
                    ),
                  ));
                }));
  }
}
