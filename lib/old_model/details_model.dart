import 'dart:convert';
import 'package:effective/old_model/product_model.dart';
import 'package:effective/old_model/store/best_seller.dart';
import 'package:equatable/equatable.dart';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

class Details extends Equatable {
  const Details({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  @override
  List<Object?> get props =>
      [cpu, camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title];
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        cpu: json["CPU"],
        camera: json["camera"],
        capacity: List<String>.from(json["capacity"].map((x) => x)),
        color: List<String>.from(json["color"].map((x) => x)),
        id: json["id"],
        images: List<String>.from(json["images"].map((x) => x))..addAll([urlReplace1]),
        isFavorites: json["isFavorites"],
        price: json["price"],
        rating: json["rating"].toDouble(),
        sd: json["sd"],
        ssd: json["ssd"],
        title: json["title"],
      );

  Product get getProduct => Product(
      cpu: cpu,
      camera: camera,
      capacity: capacity.first,
      color: color.first,
      id: id,
      image: images.first,
      isFavorites: isFavorites,
      price: price,
      quantity: 1,
      sd: sd,
      ssd: ssd,
      title: title);

  get priceProduct  {
        final p = price.toStringAsFixed(2);
    if (p.length > 6) {
      final subString = p.substring(p.length - 6, p.length);
      final d = '\$ ${p.replaceAll(subString, ',$subString')}';
      return d;
    }
    return '\$ $p';
  }

  Map<String, dynamic> toJson() => {
        "CPU": cpu,
        "camera": camera,
        "capacity": List<dynamic>.from(capacity.map((x) => x)),
        "color": List<dynamic>.from(color.map((x) => x)),
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isFavorites": isFavorites,
        "price": price,
        "rating": rating,
        "sd": sd,
        "ssd": ssd,
        "title": title,
      };

  Details copyWith({
    String? cpu,
    String? camera,
    List<String>? capacity,
    List<String>? color,
    String? id,
    List<String>? images,
    bool? isFavorites,
    int? price,
    double? rating,
    String? sd,
    String? ssd,
    String? title,
  }) {
    return Details(
      cpu: cpu ?? this.cpu,
      camera: camera ?? this.camera,
      capacity: capacity ?? this.capacity,
      color: color ?? this.color,
      id: id ?? this.id,
      images: images ?? this.images,
      isFavorites: isFavorites ?? this.isFavorites,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      sd: sd ?? this.sd,
      ssd: ssd ?? this.ssd,
      title: title ?? this.title,
    );
  }
}
