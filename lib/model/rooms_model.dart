import 'package:json_annotation/json_annotation.dart';
part 'rooms_model.g.dart';

@JsonSerializable()
class RoomsModel {
  int id;
  String name;
  int price;
  @JsonKey(name: 'price_per')
  String pricePer;
  List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  List<String> imageUrls;

  RoomsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsModelToJson(this);
}
