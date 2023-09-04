import 'package:effective/model/hotel_model.dart';
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

class SelectCategoryState extends HomeState {
  const SelectCategoryState(this.listCategory);
  final List<Category> listCategory;
  @override
  List<Object> get props => [listCategory];
}

class SetCategoryState extends HomeState {
  const SetCategoryState();
  @override
  List<Object> get props => [];
}

class GetHotelState extends HomeState {
  final HotelModel hotelModel;
  const GetHotelState({
    required this.hotelModel,
  });

  @override
  List<Object> get props => [hotelModel];
}

// class ChangeIndexIndicator extends HomeState {
//   final int index;
//   const ChangeIndexIndicator({
//     required this.index,
//   });

//   @override
//   List<Object> get props => [index];
// }
