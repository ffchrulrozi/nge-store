import 'package:flutter/material.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class TransactionListBottomWidget extends StatelessWidget {
  const TransactionListBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Text(
              "Rp 24.000.000",
              style: text(context).titleMedium,
            )
          ],
        ),
        v(1),
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () => (),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  "Give Rating",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
            h(1),
            InkWell(
              onTap: () => (),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  "Buy Again",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
