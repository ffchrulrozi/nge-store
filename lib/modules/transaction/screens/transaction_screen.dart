import 'package:flutter/material.dart';
import 'package:nge_store/modules/transaction/screens/widgets/transaction_list_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Transaction"),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                padding: EdgeInsets.all(10),
                indicator: BoxDecoration(),
                tabAlignment: TabAlignment.start,
                tabs: [
                  Text("Not Paid"),
                  Text("Processed"),
                  Text("Shipped"),
                  Text("Accepted"),
                  Text("Accepted"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (builder, index) => TransactionListWidget(),
                  ),
                  Center(
                    child: Text("ano2"),
                  ),
                  Center(
                    child: Text("ano3"),
                  ),
                  Center(
                    child: Text("ano4"),
                  ),
                  Center(
                    child: Text("ano4"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}