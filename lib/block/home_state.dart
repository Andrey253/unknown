import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/old_model/category.dart';
import 'package:effective/old_model/store/store.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class StartState extends HomeState {
  const StartState();

  @override
  List<Object> get props => [];
}

class UpdateStoreState extends HomeState {
  final Store store;
  const UpdateStoreState({required this.store});

  @override
  List<Object> get props => [store];
}

class AddTouristState extends HomeState {
  const AddTouristState(this.created);
  final bool created;
  @override
  List<Object> get props => [created];
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
    required this.roomModel,
  });
  final RoomModel roomModel;
  @override
  List<Object> get props => [roomModel];
}

class GetHotelState extends HomeState {
  final HotelModel hotelModel;
  const GetHotelState({
    required this.hotelModel,
  });

  @override
  List<Object> get props => [hotelModel];
}

