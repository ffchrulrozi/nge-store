// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    int id;
    String? image;
    String? title;
    double? price;
    int amount;

    Cart({
        required this.id,
        this.image,
        this.title,
        this.price,
        required this.amount,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "price": price,
        "amount": amount,
    };
}
