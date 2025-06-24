import 'package:flutter/material.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';
import 'package:nge_store/modules/product/screens/widgets/bottom_widget.dart';
import 'package:nge_store/modules/product/screens/widgets/carousel_widget.dart';
import 'package:nge_store/modules/product/screens/widgets/description_widget.dart';
import 'package:nge_store/modules/product/screens/widgets/header_widget.dart';
import 'package:nge_store/modules/product/screens/widgets/review_widget.dart';
import 'package:nge_store/modules/product/screens/widgets/similar_widget.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.product == null
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CarouselWidget(provider),
                          HeaderWidget(provider),
                          v(1),
                          DescriptionWidget(provider),
                          v(1),
                          ReviewWidget(provider),
                          v(1),
                          SimilarWidget(provider)
                        ],
                      ),
                    ),
                    BottomWidget(provider),
                  ],
                ),
        );
      },
    );
  }
}
