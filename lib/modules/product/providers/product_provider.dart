import 'dart:convert';

import 'package:nge_store/base/base_provider.dart';
import 'package:nge_store/modules/product/models/product.dart' as product_model;
import 'package:nge_store/modules/product/models/similar.dart' as similar_model;

class ProductProvider extends BaseProvider {
  final String productId;
  product_model.Product? product;
  similar_model.Similar? similar;

  ProductProvider(this.productId) {
    getData();
  }

  Future getData() async {
    var response = await dio.get("https://dummyjson.com/products/$productId");
    product = product_model.productFromJson(jsonEncode(response.data));
    notifyListeners();

    getSimilar();
  }

  Future getSimilar() async {
    if (product != null) {
      var response = await dio.get(
          "https://dummyjson.com/products/category/${product!.category}?limit=10");
      similar = similar_model.similarFromJson(jsonEncode(response.data));
      notifyListeners();
    }
  }

  String? getDimension(product_model.Dimensions? dimensions) {
    String response = "";
    if (dimensions == null) return null;

    if (dimensions.height != null) {
      response = ": ${dimensions.height}cm";
    }
    if (dimensions.width != null) {
      if (response != "") {
        response += "x ${dimensions.width}cm";
      } else {
        response = ": ${dimensions.width}cm";
      }
    }
    if (dimensions.depth != null) {
      if (response != "") {
        response += "x ${dimensions.depth}cm";
      } else {
        response = ": ${dimensions.depth}cm";
      }
    }
    return response == "" ? null : response;
  }
}
