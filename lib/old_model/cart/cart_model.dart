// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:effective/old_model/cart/basket_model.dart';

CartModel? cartModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel? data) => json.encode(data!.toJson());

class CartModel {
  CartModel({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  final List<Basket?>? basket;
  final String? delivery;
  final String? id;
  final int? total;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        basket: json["basket"] == null
            ? []
            : List<Basket?>.from(
                json["basket"]!.map((x) => Basket.fromJson(x))),
        delivery: json["delivery"],
        id: json["id"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "basket": basket == null
            ? []
            : List<dynamic>.from(basket!.map((x) => x!.toJson())),
        "delivery": delivery,
        "id": id,
        "total": total,
      };
}

