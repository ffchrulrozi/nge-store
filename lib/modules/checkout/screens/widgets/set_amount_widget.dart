import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/shared/providers/models/cart.dart';
import 'package:nge_store/shared/providers/cart_provider.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class SetAmountWidget extends StatelessWidget {
  final CartProvider provider;
  final Cart cart;

  const SetAmountWidget(this.provider, this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => cart.amount > 1 ? provider.decAmount(cart.id) : null,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: cart.amount > 1 ? Colors.orange : Colors.grey,
              border: Border.all(
                  color: cart.amount > 1 ? Colors.orange : Colors.grey),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Icon(
              FontAwesomeIcons.minus,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 36,
          height: 24,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Center(
            child: Text(
              cart.amount.toString(),
              style: text(context).bodyLarge,
            ),
          ),
        ),
        InkWell(
          onTap: () => provider.incAmount(cart.id),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () => provider.deleteitem(cart.id),
          icon: Icon(Icons.delete),
          color: Colors.red,
        ),
      ],
    );
  }
}
