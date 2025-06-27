import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget(this.provider, {super.key});
  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 150,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.75),
      items: provider.carousels
          .map(
            (carousel) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                carousel.image ?? "",
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList(),
    );
  }
}
