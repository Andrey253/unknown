// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:effective/old_model/cart/cart_model.dart';
import 'package:effective/old_model/category.dart';
import 'package:effective/old_model/details_model.dart';
import 'package:effective/old_model/filter_params.dart';
import 'package:effective/old_model/product_model.dart';
import 'package:effective/old_model/store/store.dart';
import 'package:flutter/material.dart';

abstract class Repository {
  FilterParams filterParams =
      FilterParams(listBrands: [], listPrices: [], listSizes: [], brand: '', price: '', size: '');

  List<Category> listCategory = [];

  String city = '';

  List<String> listCity = [];

  late Details details;

  late Product product;

  CartModel? cart;

  String get weightCart;

  String get total;

  Future<void> setListCategory();

  Future<void> setListCity();

  Future<void> setListPrices();

  Future<void> setListBrand();

  Future<void> setListSizes();

  Future<Store> getStore();

  Future<String> selectCity(BuildContext context);

  Future<void> getDetails();

  Future<void> getCart();

  // ignore: prefer_const_constructors
  Store store = Store(homeStore: [], bestSeller: []);

  void selectCategory(Category category) {
    listCategory = List.from(listCategory
        .map((e) => Category(name: e.name, asset: e.asset, selected: category.name == e.name)));
  }

  void setBrend(String? value) {
    filterParams = filterParams.copyWith(brand: value);
  }

  void setPrice(String? value) {
    filterParams = filterParams.copyWith(price: value);
  }

  void setSize(String? value) {
    filterParams = filterParams.copyWith(size: value);
  }

  void decrement(int index) {
    final deletedProduct = cart?.basket?.removeAt(index);
    if (deletedProduct?.quantity == 1) return;
    final basket = deletedProduct?.copyWith(quantity: deletedProduct.quantity - 1);
    cart?.basket?.insert(index, basket);
  }

  void increment(int index) {
    final deletedProduct = cart?.basket?.removeAt(index);
    final product = deletedProduct?.copyWith(quantity: deletedProduct.quantity + 1);
    cart?.basket?.insert(index, product);
  }

  void remove(int index) {
    cart?.basket?.removeAt(index);
  }
}
