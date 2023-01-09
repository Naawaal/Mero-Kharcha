import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mero_kharcha/models/transcation.dart';
import 'package:mero_kharcha/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTranscations;

  List<Map<String, Object>> get groupedTranscationValues {
    return List.generate(07, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTranscations.length; i++) {
        if (recentTranscations[i].date.day == weekDay.day &&
            recentTranscations[i].date.month == weekDay.month &&
            recentTranscations[i].date.year == weekDay.year) {
          totalSum += recentTranscations[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get maxSpending {
    return groupedTranscationValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart({
    super.key,
    required this.recentTranscations,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTranscationValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: "${data['day']}",
                spendingAmount: data['amount'] as double,
                spendingPctOfTotal: maxSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / maxSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
