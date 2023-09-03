import 'package:equatable/equatable.dart';

class Basket extends Equatable{
  const Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
    required this.quantity,
  });

  final int id;
  final int quantity;
  final String images;
  final int price;
  final String title;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        id: json["id"],
        images: json["images"],
        price: json["price"],
        title: json["title"],
        quantity: json["quantity"] ?? 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "price": price,
        "title": title,
        "quantity": quantity,
      };

  Basket copyWith({
    int? id,
    String? images,
    int? price,
    String? title,
    int? quantity,
  }) {
    return Basket(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      price: price ?? this.price,
      title: title ?? this.title,
    );
  }
  
  @override
  List<Object?> get props =>[id,quantity,images,price,title];
}
