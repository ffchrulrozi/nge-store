import 'package:flutter/material.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';

class TransactionListTopWidget extends StatelessWidget {
  const TransactionListTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.calendar_month),
      h(1),
      Text("23 June 2024"),
    ]);
  }
}
