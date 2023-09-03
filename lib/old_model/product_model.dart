import 'package:effective/old_model/cart/basket_model.dart';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String cpu;
  final String camera;
  final String capacity;
  final String color;
  final String id;
  final String image;
  final bool isFavorites;
  final int price;
  final int quantity;
  final String sd;
  final String ssd;
  final String title;
  const Product({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.image,
    required this.isFavorites,
    required this.price,
    required this.quantity,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  get getBasket => Basket(id: int.parse(id), images: image, price: price, title: title, quantity: quantity);

  Product copyWith({
    String? cpu,
    String? camera,
    String? capacity,
    String? color,
    String? id,
    String? image,
    bool? isFavorites,
    int? price,
    int? quantity,
    String? sd,
    String? ssd,
    String? title,
  }) {
    return Product(
      cpu: cpu ?? this.cpu,
      camera: camera ?? this.camera,
      capacity: capacity ?? this.capacity,
      color: color ?? this.color,
      id: id ?? this.id,
      image: image ?? this.image,
      isFavorites: isFavorites ?? this.isFavorites,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      sd: sd ?? this.sd,
      ssd: ssd ?? this.ssd,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        cpu,
        camera,
        capacity,
        color,
        id,
        image,
        isFavorites,
        price,
        quantity,
        sd,
        ssd,
        title
      ];
}
