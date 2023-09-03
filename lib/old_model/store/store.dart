// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final sotore = sotoreFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:effective/old_model/store/best_seller.dart';
import 'package:effective/old_model/store/home_store.dart';

Store sotoreFromJson(String str) => Store.fromJson(json.decode(str));

String sotoreToJson(Store data) => json.encode(data.toJson());

class Store extends Equatable{
  const Store({
    required this.homeStore,
    required this.bestSeller,
  });

  final List<HomeStore> homeStore;
  final List<BestSeller> bestSeller;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        homeStore: List<HomeStore>.from(
            json["home_store"].map((x) => HomeStore.fromJson(x))),
        bestSeller: List<BestSeller>.from(
            json["best_seller"].map((x) => BestSeller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_store": List<dynamic>.from(homeStore.map((x) => x.toJson())),
        "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
      };

  @override
  bool operator ==(covariant Store other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.homeStore, homeStore) &&
      listEquals(other.bestSeller, bestSeller);
  }

  @override
  int get hashCode => homeStore.hashCode ^ bestSeller.hashCode;
  
  @override
  List<Object?> get props => [homeStore,bestSeller];
}
