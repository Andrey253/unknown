import 'package:json_annotation/json_annotation.dart';

part 'about_hotel.g.dart';

@JsonSerializable()
class AboutTheHotel {
    String description;
    List<String> peculiarities;

    AboutTheHotel({
        required this.description,
        required this.peculiarities,
    });

    factory AboutTheHotel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelFromJson(json);

    Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}
