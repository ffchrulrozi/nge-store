import 'package:flutter/material.dart';
import 'package:nge_store/modules/transaction/screens/widgets/transaction_list_bottom_widget.dart';
import 'package:nge_store/modules/transaction/screens/widgets/transaction_list_item_widget.dart';
import 'package:nge_store/modules/transaction/screens/widgets/transaction_list_top_widget.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransactionListTopWidget(),
          v(1),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (builder, index) => TransactionListItemWidget(),
          ),
          Divider(),
          TransactionListBottomWidget()
        ],
      ),
    );
  }
}
