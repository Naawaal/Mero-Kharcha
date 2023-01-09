import 'package:flutter/material.dart';

class NewTranscation extends StatefulWidget {
  final Function addTranscation;
  const NewTranscation({super.key, required this.addTranscation});

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void sumbitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTranscation(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  sumbitData();
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
