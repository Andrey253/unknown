import 'package:effective/block/block.dart';
import 'package:effective/widgets/cart/cart_home.dart';
import 'package:flutter/material.dart';
import 'package:effective/block/details_state.dart';
import 'package:effective/repository/repository.dart';

class DetailsBloc extends AppBlock<DetailsState> {
  final String urlDetails;

  DetailsBloc(
      {required this.urlDetails,
      required super.repository,
      required super.type}) {
    init();
  }



  void init() async {
    try {
      await repository.getDetails();
      emit(GetingDetailsDoneState(details: repository.details));
    } on Exception catch (e) {
      emit(ErrorDetailsState(error: e.toString()));
    }
  }

  void setColor(String e) {
    repository.product = repository.product.copyWith(color: e);
    emit(UpdateProductState(property: e));
  }

  void setCapacity(String e) {
    repository.product = repository.product.copyWith(capacity: e);
    emit(UpdateProductState(property: e));
  }

  void addToCart() {
    final basket = repository.product.getBasket;
    repository.cart?.basket?.add(basket);
    emit(UpdateCartState(cart: List.from(repository.cart?.basket ?? [])));
  }

  void navigateToCart(BuildContext context, Repository repository) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CartWidget(repository: repository)));
    emit(UpdateCartState(cart: List.from(repository.cart?.basket ?? [])));
  }
}
