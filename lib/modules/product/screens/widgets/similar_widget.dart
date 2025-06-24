import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/routes/app_paths.dart';
import 'package:nge_store/utils/ext/size_ext.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class SimilarWidget extends StatelessWidget {
  const SimilarWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    if (provider.similar == null) {
      return Container();
    } else {
      return Container(
        width: 100.h(context),
        padding: EdgeInsets.only(bottom: 70),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Similar Products",
                style: text(context).titleMedium,
              ),
            ),
            SizedBox(
              height: 325,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.similar?.products?.length,
                itemBuilder: (context, index) {
                  var product = provider.similar!.products![index];
                  final String currentPrice = ((product.price ?? 0) *
                          (1 - (product.discountPercentage ?? 0) / 100))
                      .toStringAsFixed(2);

                  return InkWell(
                    onTap: () => context.go(Paths.PRODUCT.name),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 20 : 0, right: 25),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
