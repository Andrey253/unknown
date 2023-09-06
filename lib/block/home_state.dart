import 'package:effective/widgets/order/final_price.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';
import 'package:equatable/equatable.dart';

import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class StartState extends HomeState {
  const StartState();

  @override
  List<Object> get props => [];
}

class AddedTouristState extends HomeState {
  const AddedTouristState({required this.touristsData});
  final TouristData touristsData;
  @override
  List<Object> get props => [touristsData];
}

class AddingTouristState extends HomeState {
  const AddingTouristState();
  @override
  List<Object> get props => [];
}

class InputDataTouristState extends HomeState {
  const InputDataTouristState( {required this.error,required this.inputField,});
  final bool error;
  final InputField inputField;
  @override
  List<Object> get props => [error,inputField];
}

class NoAddTouristState extends HomeState {
  const NoAddTouristState();
  @override
  List<Object> get props => [];
}

class ChangeExpandedtState extends HomeState {
  final int index;
  final bool isExp;
  const ChangeExpandedtState({
    required this.index,
    required this.isExp,
  });

  @override
  List<Object> get props => [index, isExp];
}

class GetRoomsState extends HomeState {
  const GetRoomsState({
    required this.listRooms,
  });
  final List<RoomsModel> listRooms;
  @override
  List<Object> get props => [listRooms];
}

class GetRoomState extends HomeState {
  const GetRoomState({
    required this.finalPrice,
    required this.roomModel,
  });
  final RoomModel roomModel;
  final List<FinalPrice> finalPrice;
  @override
  List<Object> get props => [roomModel, finalPrice];
}

class GetHotelState extends HomeState {
  final HotelModel hotelModel;
  const GetHotelState({
    required this.hotelModel,
  });

  @override
  List<Object> get props => [hotelModel];
}
