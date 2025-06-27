import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/modules/home/models/carousel.dart';
import 'package:nge_store/modules/home/models/category.dart' as category;
import 'package:nge_store/modules/home/models/product.dart';

class HomeProvider extends BaseProvider {
  List<Carousel> carousels = [];
  List<category.Category> categories = [];
  String selectedCategory = "";
  Product product = Product();

  HomeProvider() {
    getCarousel();
    getCategory();
  }

  void getCarousel() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 30),
          minimumFetchInterval: Duration.zero),
    );

    var response = jsonDecode(remoteConfig.getString('home_carousel_images'));
    carousels = carouselFromJson(jsonEncode(response));
    notifyListeners();
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
