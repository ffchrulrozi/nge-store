import 'package:flutter/material.dart';
import 'package:nge_store/assets/assets.gen.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class TransactionListItemWidget extends StatelessWidget {
  const TransactionListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  Assets.lib.assets.img.me.path,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              h(2),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lenovo Thinkpad X1",
                    style: text(context).titleMedium,
                  ),
                  Text("Laptop"),
                  Row(
                    children: [
                      Expanded(child: Text("Rp 4.000.000")),
                      Expanded(child: Text("@3 box")),
                    ],
                  ),
                  v(1),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Rp. 12.000.000",
                        style: text(context).titleMedium,
                      ),
                    ],
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
