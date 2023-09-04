import 'package:dio/dio.dart';
import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/servis/api_servis.dart';

class Repository {
  ApiServis apiServis =
      ApiServis(Dio(BaseOptions(contentType: 'aplication/json')));
  int indexIndicator = 0;
  HotelModel? hotelModel;
  List<RoomsModel> listRooms=[];

  RoomModel? roomModel;
}
