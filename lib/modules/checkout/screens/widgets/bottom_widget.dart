import 'package:flutter/material.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class BottomWidget extends StatelessWidget {
  final CartProvider provider;
  const BottomWidget(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Divider(),
            Row(
              children: [
                Spacer(),
                Text(
                  "\$${provider.getAllTotal()}",
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
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
