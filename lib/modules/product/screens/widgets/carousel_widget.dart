import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nge_store/modules/product/providers/product_provider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget(this.provider, {super.key});
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: Colors.white,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.75),
        items: provider.product?.images
            ?.map(
              (carousel) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  carousel,
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
