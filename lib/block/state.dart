// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:effective/helpers/final_price_class.dart';
import 'package:equatable/equatable.dart';

import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class StartState extends AppState {
  const StartState();

  @override
  List<Object> get props => [];
}

class TouristState extends AppState {
  const TouristState({required this.touristsData});
  final TouristData touristsData;
  @override
  List<Object> get props => [touristsData];
}

class InputDataTouristState extends AppState {
  const InputDataTouristState({
    required this.error,
    required this.inputField,
  });
  final bool error;
  final InputField inputField;
  @override
  List<Object> get props => [error, inputField];
}

// class ChangeExpandedtState extends AppState {
//   final int index;
//   final bool isExp;
//   const ChangeExpandedtState({
//     required this.index,
//     required this.isExp,
//   });
//   @override
//   List<Object> get props => [index, isExp];
// }

class GetRoomsState extends AppState {
  const GetRoomsState({
    required this.listRooms,
  });
  final List<RoomsModel> listRooms;
  @override
  List<Object> get props => [listRooms];
}

class GetRoomState extends AppState {
  const GetRoomState({
    required this.finalPrice,
    required this.roomModel,
  });
  final RoomModel roomModel;
  final List<FinalPrice> finalPrice;
  @override
  List<Object> get props => [roomModel, finalPrice];
}

class GetHotelState extends AppState {
  final HotelModel hotelModel;
  const GetHotelState({
    required this.hotelModel,
  });

  @override
  List<Object> get props => [hotelModel];
}

class EditingInfoBuyerState extends AppState {
  final List<TouristData> listTouristData;
  final bool emailBuyerError;
  final bool phoneBuyerError;

  const EditingInfoBuyerState({
    required this.listTouristData,
    required this.emailBuyerError,
    required this.phoneBuyerError,
  });

  @override
  List<Object> get props => [listTouristData, emailBuyerError, phoneBuyerError];
}
