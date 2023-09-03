import 'package:effective/model/about_hotel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel_model.g.dart';

@JsonSerializable()
class PostModel {
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

  PostModel({
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

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
