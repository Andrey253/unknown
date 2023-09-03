import 'package:effective/old_model/cart/basket_model.dart';

import 'package:effective/old_model/details_model.dart';
import 'package:equatable/equatable.dart';


abstract class DetailsState extends Equatable {
  const DetailsState();
}
class GetingDetailsState extends DetailsState {
  const GetingDetailsState();
  @override
  List<Object> get props => [];
}
class GetingDetailsDoneState extends DetailsState {
  const GetingDetailsDoneState({required this.details});
  final Details details;

  @override
  List<Object> get props => [details];
}
class ErrorDetailsState extends DetailsState {
  const ErrorDetailsState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
class UpdateProductState extends DetailsState {
  const UpdateProductState({required this.property});
  final String property;

  @override
  List<Object> get props => [property];
}
class UpdateCartState extends DetailsState {
  const UpdateCartState({required this.cart});
  final List<Basket> cart;

  @override
  List<Object> get props => [cart];
}
