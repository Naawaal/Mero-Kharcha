import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  final Function addTranscation;
  NewTranscation({super.key, required this.addTranscation});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  addTranscation(titleController.text,
                      double.parse(amountController.text));
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add Transcation',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
