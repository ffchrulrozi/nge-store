import 'package:flutter/material.dart';
import 'package:nge_store/shared/providers/models/cart.dart';

class CartProvider extends ChangeNotifier {
  var carts = <Cart>[];

  Cart? _cart(id) => carts.where((cart) => cart.id == id).firstOrNull;

  double getCartTotal(Cart cart) => double.parse(
        ((cart.price ?? 0) * cart.amount).toStringAsFixed(2),
      );

  double getAllTotal() => double.parse(
          carts
              .map((cart) => (cart.price ?? 0) * cart.amount)
              .reduce((a, b) => a + b)
              .toStringAsFixed(2),
        );

  void addCart(Cart newCart) {
    var existingCart = _cart(newCart.id);
    if (existingCart == null) {
      carts.add(newCart);
    } else {
      existingCart.amount++;
    }
    notifyListeners();
  }

  void incAmount(int id) {
    carts.where((cart) => cart.id == id).first.amount++;
    notifyListeners();
  }

  void decAmount(int id) {
    carts.where((cart) => cart.id == id).first.amount--;
    notifyListeners();
  }

  void deleteitem(int id) {
    carts.removeWhere((cart) => cart.id == id);
    notifyListeners();
  }
}
