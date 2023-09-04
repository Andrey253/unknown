import 'package:effective/block/block.dart';
import 'package:effective/block/home_state.dart';

class HomeBloc extends AppBlock<HomeState> {
  HomeBloc({required super.repository, required super.type}) {
    init();
  }

  void init() async {
    startingGetHotel();
  }

  void startingGetHotel() async {
    final hotel = await repository.apiServis.getHotel();
    repository.hotelModel = hotel;
    emit(GetHotelState(hotel: hotel));
  }

  void changeIndexIndicator(int i) async {
    repository.indexIndicator = i;
    emit(ChangeIndexIndicator(index: i));
  }
}
