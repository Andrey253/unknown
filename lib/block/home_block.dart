// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:effective/block/block.dart';
import 'package:flutter/material.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/old_model/category.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/widgets/details/detais_home.dart';

class HomeBloc extends AppBlock<HomeState> {
  HomeBloc({required super.repository, required super.type}) {
    init();
  }

  void init() async {
    setListCity();
    setListCategory();
    setFilterParams();
    getStore();
  }

  void selectCity(BuildContext context) async {
    final city = await repository.selectCity(context);
    emit(SelectCityState(city: city));
  }

  void selectCategory(Category category) {
    repository.selectCategory(category);
    emit(SelectCategoryState(repository.listCategory));
  }

  void setListCategory() async {
    await repository.setListCategory();
    emit(const SetCategoryState());
  }

  void setListCity() async {
    await repository.setListCity();
    emit(SelectCityState(city: repository.city));
  }

  void openFilter() {
    emit(state is FilterState ? const CancelFilterState() : FilterState(repository.filterParams));
  }

  void cancelFilter() {
    emit(const CancelFilterState());
  }

  void doneFilter() {
    emit(const CancelFilterState());
  }

  void setFilterParams() async {
    await repository.setListPrices();
    await repository.setListBrand();
    await repository.setListSizes();
    emit(const StartState());
  }

  void setBrend(String? value) {
    repository.setBrend(value);

    emit(FilterState(repository.filterParams));
  }

  void setPrice(String? value) {
    repository.setPrice(value);
    if (value == null) return;
    emit(FilterState(repository.filterParams));
  }

  void setSize(String? value) {
    repository.setSize(value);
    if (value == null) return;
    emit(FilterState(repository.filterParams));
  }

  void getStore() async {
    final store = await repository.getStore();
    emit(UpdateStoreState(store: store));
  }

  void navigateToDetails(BuildContext context, String url, Repository repository) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailsHome(
        repository: repository,
        url: url,
      ),
    ));
    // emit(GetingDetails(url: url));
  }


}
