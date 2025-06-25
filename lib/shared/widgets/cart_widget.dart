import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CartProvider>();
    int itemCount = provider.carts.length;

    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            onTap: () => context.push(Paths.CHECKOUT.path),
            child: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ),
          if (itemCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 18,
                  minHeight: 18,
                ),
                child: Text(
                  itemCount > 99 ? '99+' : '$itemCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
