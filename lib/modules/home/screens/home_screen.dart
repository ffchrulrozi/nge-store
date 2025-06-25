import 'package:flutter/material.dart';
import 'package:nge_store/modules/home/providers/home_provider.dart';
import 'package:nge_store/modules/home/screens/widgets/carousel_widget.dart';
import 'package:nge_store/modules/home/screens/widgets/category_widget.dart';
import 'package:nge_store/modules/home/screens/widgets/information_widget.dart';
import 'package:nge_store/modules/home/screens/widgets/product_widget.dart';
import 'package:nge_store/utils/helper/divider_helper.dart';
import 'package:nge_store/shared/widgets/cart_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search",
                  contentPadding: EdgeInsets.only(left: 20),
                  border: InputBorder.none,
                ),
              ),
            ),
            actions: [
              CartWidget(),
              h(1),
              Icon(Icons.chat, size: 30),
              h(1),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                v(2),
                CarouselWidget(provider),
                v(2),
                InformationWidget(),
                v(3),
                CategoryWidget(provider),
                v(1),
                ProductWidget(provider),
                v(5),
              ],
            ),
          ),
        );
      },
    );
  }
}
