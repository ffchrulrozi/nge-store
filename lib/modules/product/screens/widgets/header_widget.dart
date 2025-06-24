import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
      final product = provider.product!;
      final String currentPrice =
          ((product.price ?? 0) * (1 - (product.discountPercentage ?? 0) / 100))
              .toStringAsFixed(2);

      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title ?? "",
              style: text(context).titleMedium,
            ),
            h(1),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange,
                ),
                Text(product.rating.toString()),
                h(2),
                Text("${product.stock} sold")
              ],
            ),
            v(1),
            Row(children: [
              Text(
                "\$${product.price}",
                style: text(context).titleSmall!.copyWith(
                      decoration: currentPrice != ""
                          ? TextDecoration.lineThrough
                          : null,
                    ),
              ),
              h(1),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${product.discountPercentage}%",
                  style:
                      text(context).labelSmall!.copyWith(color: Colors.white),
                ),
              )
            ]),
            Row(
              children: [
                Text(
                  "\$$currentPrice",
                  style: text(context)
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(FontAwesomeIcons.bookmark, color: Colors.black,),
                h(2),
                Icon(FontAwesomeIcons.heart),
                h(0.5),
                Text("110"),
              ],
            ),
          ],
        ),
      );
  }
}
