import 'package:flutter/material.dart';
import 'package:nge_store/modules/checkout/screens/widgets/bottom_widget.dart';
import 'package:nge_store/modules/checkout/screens/widgets/set_amount_widget.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text("Cart")),
          body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
                  child: ListView.builder(
                    itemCount: provider.carts.length,
                    itemBuilder: (context, index) {
                      final cart = provider.carts[index];
                      return Row(
                        children: [
                          Image.network(
                            cart.image ?? "",
                            width: 125,
                            height: 125,
                          ),
                          h(1),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart.title ?? "",
                                  style: text(context).titleMedium,
                                ),
                                Text("\$${cart.price}"),
                                SetAmountWidget(provider, cart),
                                Row(
                                  children: [
                                    Spacer(),
                                    Text("\$${provider.getCartTotal(cart)}")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                BottomWidget(provider)
              ],
          ),
        );
      },
    );
  }
}
