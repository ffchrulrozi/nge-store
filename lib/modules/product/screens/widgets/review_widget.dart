import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/utils/ext/size_ext.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h(context),
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reviews",
            style: text(context).titleMedium,
          ),
          v(1),
          ...provider.product!.reviews?.take(3).map((review) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.person),
                            h(1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text(
                                    review.reviewerName ?? "",
                                    style: text(context).titleSmall,
                                  ),
                                  h(1),
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepOrange,
                                  ),
                                  Text(review.rating.toString())
                                ]),
                                Text(
                                  DateFormat("dd MMM yyyy")
                                      .format(review.date!),
                                  style: text(context).labelSmall,
                                ),
                                Text(review.comment ?? ""),
                              ],
                            ),
                          ]),
                    ],
                  ),
                );
              }).toList() ??
              [],
        ],
      ),
    );
  }
}
