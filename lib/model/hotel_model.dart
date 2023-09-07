// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:effective/model/about_hotel.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  int id;
  String name;
  String adress;
  @JsonKey(name: 'minimal_price')
  int minimalPrice;
  @JsonKey(name: 'price_for_it')
  String priceForIt;
  int rating;
  @JsonKey(name: 'rating_name')
  String ratingName;
  @JsonKey(name: 'image_urls')
  List<String> imageUrls;
  @JsonKey(name: 'about_the_hotel')
  AboutTheHotel aboutTheHotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);

  HotelModel copyWith({
    int? id,
    String? name,
    String? adress,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<String>? imageUrls,
    AboutTheHotel? aboutTheHotel,
  }) {
    return HotelModel(
      id: id ?? this.id,
      name: name ?? this.name,
      adress: adress ?? this.adress,
      minimalPrice: minimalPrice ?? this.minimalPrice,
      priceForIt: priceForIt ?? this.priceForIt,
      rating: rating ?? this.rating,
      ratingName: ratingName ?? this.ratingName,
      imageUrls: imageUrls ?? this.imageUrls,
      aboutTheHotel: aboutTheHotel ?? this.aboutTheHotel,
    );
  }

  @override
  bool operator ==(covariant HotelModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.adress == adress &&
      other.minimalPrice == minimalPrice &&
      other.priceForIt == priceForIt &&
      other.rating == rating &&
      other.ratingName == ratingName &&
      listEquals(other.imageUrls, imageUrls) &&
      other.aboutTheHotel == aboutTheHotel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      adress.hashCode ^
      minimalPrice.hashCode ^
      priceForIt.hashCode ^
      rating.hashCode ^
      ratingName.hashCode ^
      imageUrls.hashCode ^
      aboutTheHotel.hashCode;
  }
}
