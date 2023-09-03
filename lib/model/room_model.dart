import 'package:json_annotation/json_annotation.dart';
part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
    int id;
    @JsonKey(name: 'hotel_name')
    String hotelName;
    @JsonKey(name: 'hotel_adress')
    String hotelAdress;
    int horating;
    @JsonKey(name: 'rating_name')
    String ratingName;
    String departure;
    @JsonKey(name: 'arrival_country')
    String arrivalCountry;
    @JsonKey(name: 'tour_date_start')
    String tourDateStart;
    @JsonKey(name: 'tour_date_stop')
    String tourDateStop;
    @JsonKey(name: 'number_of_nights')
    int numberOfNights;
    String room;
    String nutrition;
    @JsonKey(name: 'tour_price')
    int tourPrice;
    @JsonKey(name: 'fuel_charge')
    int fuelCharge;
    @JsonKey(name: 'service_charge')
    int serviceCharge;

    RoomModel({
        required this.id,
        required this.hotelName,
        required this.hotelAdress,
        required this.horating,
        required this.ratingName,
        required this.departure,
        required this.arrivalCountry,
        required this.tourDateStart,
        required this.tourDateStop,
        required this.numberOfNights,
        required this.room,
        required this.nutrition,
        required this.tourPrice,
        required this.fuelCharge,
        required this.serviceCharge,
    });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
