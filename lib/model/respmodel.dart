// // To parse this JSON data, do
// //
// //     final respModel = respModelFromJson(jsonString);

// import 'dart:convert';

// List<RespModel> respModelFromJson(String str) =>
//     List<RespModel>.from(json.decode(str).map((x) => RespModel.fromJson(x)));

// String respModelToJson(List<RespModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class RespModel {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   Category? category;
//   String? image;
//   Rating? rating;

//   RespModel({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,
//   });

//   factory RespModel.fromJson(Map<String, dynamic> json) => RespModel(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"]?.toDouble(),
//         description: json["description"],
//         category: categoryValues.map[json["category"]]!,
//         image: json["image"],
//         rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": categoryValues.reverse[category],
//         "image": image,
//         "rating": rating?.toJson(),
//       };
// }

// enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

// final categoryValues = EnumValues({
//   "electronics": Category.ELECTRONICS,
//   "jewelery": Category.JEWELERY,
//   "men's clothing": Category.MEN_S_CLOTHING,
//   "women's clothing": Category.WOMEN_S_CLOTHING
// });

// class Rating {
//   double? rate;
//   int? count;

//   Rating({
//     this.rate,
//     this.count,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]?.toDouble(),
//         count: json["count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

import 'dart:convert';

List<RespModel> respModelFromJson(String str) =>
    List<RespModel>.from(json.decode(str).map((x) => RespModel.fromJson(x)));

String respModelToJson(List<RespModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespModel {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  RespModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory RespModel.fromJson(Map<String, dynamic> json) => RespModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"]?.toDouble() ?? 0.0,
        description: json["description"] ?? '',
        category: categoryValues.map[json["category"]] ?? Category.UNKNOWN,
        image: json["image"] ?? '',
        rating: json["rating"] == null
            ? Rating(rate: 0.0, count: 0)
            : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating.toJson(),
      };
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING,
  UNKNOWN
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
  "unknown": Category.UNKNOWN,
});

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble() ?? 0.0,
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
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
