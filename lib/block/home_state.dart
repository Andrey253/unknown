import 'package:effective/old_model/category.dart';
import 'package:effective/old_model/filter_params.dart';
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

class SelectCityState extends HomeState {
  final String city;
  const SelectCityState({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}

class FilterState extends HomeState {
  const FilterState(this.value);
  final FilterParams value;

  @override
  List<Object> get props => [value];
}

class CancelFilterState extends HomeState {
  const CancelFilterState();

  @override
  List<Object> get props => [];
}
