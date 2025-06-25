import 'package:flutter/material.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/shared/providers/models/cart.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/utils/ext/size_ext.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    final product = provider.product!;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        width: 100.h(context),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Checkout",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => cartProvider.addCart(Cart(
                  id: product.id!,
                  title: product.title,
                  image: product.thumbnail,
                  price: provider.getCurrentPrice(),
                  amount: 0,
                )),
                child: Container(
                  color: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
