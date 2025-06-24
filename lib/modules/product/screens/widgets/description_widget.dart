import 'package:flutter/material.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/utils/helper/style_helper.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    final product = provider.product!;
    final dimension = provider.getDimension(product.dimensions);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Specifications",
            style: text(context).titleMedium,
          ),
          if (product.brand != null)
            Row(
              children: [
                Expanded(child: Text("Brand")),
                Expanded(
                  flex: 3,
                  child: Text(": ${product.brand}"),
                )
              ],
            ),
          if (product.weight != null)
            Row(
              children: [
                Expanded(child: Text("Weight")),
                Expanded(
                  flex: 3,
                  child: Text(": ${product.weight}kg"),
                )
              ],
            ),
          if (dimension != null)
            Row(
              children: [
                Expanded(child: Text("Dimension")),
                Expanded(
                  flex: 3,
                  child: Text(dimension),
                )
              ],
            ),
          v(2),
          Text(
            "Description",
            style: text(context).titleMedium,
          ),
          Text(
            product.description ?? "",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
