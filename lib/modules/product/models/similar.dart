// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Similar similarFromJson(String str) => Similar.fromJson(json.decode(str));

String similarToJson(Similar data) => json.encode(data.toJson());

class Similar {
  List<ProductElement>? products;
  int? total;
  int? skip;
  int? limit;

  Similar({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
        products: json["products"] == null
            ? []
            : List<ProductElement>.from(
                json["products"]!.map((x) => ProductElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class ProductElement {
  int? id;
  String? title;
  String? description;
  // Category? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  AvailabilityStatus? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  ProductElement({
    this.id,
    this.title,
    this.description,
    // this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        // category: categoryValues.map[json["category"]]!,
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus:
            availabilityStatusValues.map[json["availabilityStatus"]],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        // "category": categoryValues.reverse[category],
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus":
            availabilityStatusValues.reverse[availabilityStatus],
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus { IN_STOCK, OUT_OF_STOCK }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Out of Stock": AvailabilityStatus.OUT_OF_STOCK
});

enum Category { SMARTPHONES }

// final categoryValues = EnumValues({"smartphones": Category.SMARTPHONES});

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
