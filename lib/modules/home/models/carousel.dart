// To parse this JSON data, do
//
//     final carousel = carouselFromJson(jsonString);

import 'dart:convert';

List<Carousel> carouselFromJson(String str) => List<Carousel>.from(json.decode(str).map((x) => Carousel.fromJson(x)));

String carouselToJson(List<Carousel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carousel {
    String? image;

    Carousel({
        this.image,
    });

    factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
    };
}
