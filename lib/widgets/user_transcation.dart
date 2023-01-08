import 'package:flutter/widgets.dart';
import 'package:mero_kharcha/models/transcation.dart';
import 'package:mero_kharcha/widgets/transcation_list.dart';

import 'new_transcation.dart';

class UserTranscation extends StatefulWidget {
  const UserTranscation({super.key});

  @override
  State<UserTranscation> createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
  final List<Transcation> _userTrascations = [];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscation(addTranscation: _addNewTranscation),
        TranscationList(
          _userTrascations,
        ),
      ],
    );
  }
}
