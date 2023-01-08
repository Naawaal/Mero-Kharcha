import 'package:flutter/material.dart';
import 'package:mero_kharcha/widgets/user_transcation.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.5,
          title: const Text('Mero Kharcha'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              UserTranscation(),
            ],
          ),
        ));
  }
}
