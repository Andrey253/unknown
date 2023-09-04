import 'package:dio/dio.dart';
import 'package:effective/model/hotel_model.dart';
import 'package:effective/model/room_model.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:retrofit/http.dart';
part 'api_servis.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io')
abstract class ApiServis {
  factory ApiServis(Dio dio) = _ApiServis;

  @GET('/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelModel> getHotel();
  @GET('/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<Rooms> getRooms();
  @GET('/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<List<RoomModel>> getRoom();
}
