import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: (map["id"] ),
      title: (map["title"]),
      price: map["price"] ?? 10 as double,
      description: (map["description"]),
      category: (map["category"]),
      image: (map["image"]),
      rating: Rating.fromMap((map["rating"]?? Map<String,dynamic>.from({})) as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rating {
  final dynamic rate;
  final int count;
  const Rating({
    required this.rate,
    required this.count,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map["rate"] ?? 0 as double,
      count: map["count"] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source) as Map<String, dynamic>);
}
