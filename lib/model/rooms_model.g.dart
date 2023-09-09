// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
      listRooms: (json['listRooms'] as List<dynamic>)
          .map((e) => RoomsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'listRooms': instance.listRooms,
    };

RoomsModel _$RoomsModelFromJson(Map<String, dynamic> json) => RoomsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomsModelToJson(RoomsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.pricePer,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
