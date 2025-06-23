import 'dart:convert';

import 'package:nge_store/assets/assets.gen.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/modules/home/models/category.dart' as category;
import 'package:nge_store/modules/home/models/product.dart';

class HomeProvider extends BaseProvider {
  final List<String> carousels = [
    Assets.lib.assets.img.slide1.path,
    Assets.lib.assets.img.slide2.path,
    Assets.lib.assets.img.slide3.path,
  ];

  List<category.Category> categories = [];
  String selectedCategory = "";
  Product product = Product();

  HomeProvider() {
    getCategory();
  }

  void getCategory() async {
    var categoryResponse =
        await dio.get("https://dummyjson.com/products/categories");
    var categoryData = jsonEncode(categoryResponse.data);
    categories = category.categoryFromJson(categoryData).take(10).toList();
    selectedCategory = categories.first.slug ?? "";
    notifyListeners();

    getProduct();
  }

  void setCategory(String categorySlug) {
    selectedCategory = categorySlug;
    notifyListeners();
    getProduct();
  }

  void getProduct() async {
    if (selectedCategory != "") {
      var productResponse = await dio.get(
          "https://dummyjson.com/products/category/$selectedCategory?limit=10");
      var productData = jsonEncode(productResponse.data);
      product = productFromJson(productData);
      notifyListeners();
    }
  }
}
