import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/modules/home/models/product.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.provider, {super.key});
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.product.total ?? 0,
        itemBuilder: (context, index) =>
            ProductCard(provider.product.products?[index], index),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard(this.productElement, this.index, {super.key});
  final ProductElement? productElement;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (productElement == null) {
      return Container();
    } else {
      var product = productElement!;
      final String currentPrice =
          ((product.price ?? 0) * (1 - (product.discountPercentage ?? 0) / 100))
              .toStringAsFixed(2);

      return InkWell(
        onTap: () => context.pushNamed(
          Paths.PRODUCT.name,
          pathParameters: {
            'id': product.id.toString(),
          },
        ),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 25),
          child: Column(
            children: [
              Image.network(
                product.thumbnail ?? "",
                width: 200,
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.all(15),
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
                        Spacer(),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${product.discountPercentage}%",
                          style: text(context)
                              .labelSmall!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ]),
                    Text(
                      "\$$currentPrice",
                      style: text(context)
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
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
                    child: Container(
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Add to Cart",
                        textAlign: TextAlign.center,
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
}
