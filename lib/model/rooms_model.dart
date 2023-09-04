import 'package:json_annotation/json_annotation.dart';
part 'rooms_model.g.dart';

@JsonSerializable()
class Rooms {
  List<RoomsModel> listRooms;

  Rooms({
    required this.listRooms,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        listRooms: List<RoomsModel>.from(
            json["rooms"].map((x) => RoomsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rooms": List<dynamic>.from(listRooms.map((x) => x.toJson())),
      };
}

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
