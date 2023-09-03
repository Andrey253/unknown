// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:effective/help/showsearch_city.dart';
import 'package:effective/old_model/cart/cart_model.dart';
import 'package:effective/old_model/details_model.dart';
import 'package:effective/old_model/store/store.dart';
import 'package:effective/repository/repository.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';

class RepositoryImplementation extends Repository {
  @override
  Future<void> setListCategory() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    listCategory = startListCategory;
  }

  @override
  Future<void> setListCity() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    listCity = startListSity;
    if (listCity.isEmpty) return;
    city = listCity.first;
  }

  @override
  Future<String> selectCity(BuildContext context) async {
    city = await showSearch(context: context, delegate: SearchCity(listCity: listCity));
    return city;
  }

  @override
  Future<void> setListBrand() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    const listBrand = startListBrand;
    filterParams = filterParams.copyWith(listBrands: listBrand, brand: listBrand.first);
  }

  @override
  Future<void> setListPrices() async {
    await Future.delayed(const Duration(milliseconds: 900));
    const listP = startListPrice;
    filterParams = filterParams.copyWith(listPrices: listP, price: listP.first);
  }

  @override
  Future<void> setListSizes() async {
    await Future.delayed(const Duration(milliseconds: 800));
    const listS = startListSizes;
    filterParams = filterParams.copyWith(listSizes: listS, size: listS.first);
  }

  @override
  Future<Store> getStore() async {
    final query = await Dio().get(urlStore, options: Options(responseType: ResponseType.json));
    store = Store.fromJson(query.data);
    return store;
  }

  @override
  Future<void> getDetails() async {
    final request = await Dio().get(urlDetails, options: Options(responseType: ResponseType.json));
    final getingDetails = Details.fromJson(request.data);
    details = getingDetails;
    product = details.getProduct;
    await getCart();
  }

  @override
  Future<void> getCart() async {
    final request = await Dio().get(urlCart, options: Options(responseType: ResponseType.json));
    final getingCart = CartModel.fromJson(request.data);
    cart = getingCart;
  }

  @override
  String get weightCart => cart?.basket != null
      ? cart!.basket!
          .fold(0, (previousValue, element) => previousValue + (element!.quantity))
          .toString()
      : '0';

  @override
  String get total {
    final total = (cart?.basket != null
            ? cart!.basket!.fold(
                0, (previousValue, element) => previousValue + (element!.price * element.quantity))
            : 0)
        .toString();
    if (total.length > 3) {
      final subString = total.substring(total.length - 3, total.length);
      final d = '\$ ${total.replaceAll(subString, ',$subString')} us';
      return d;
    }
    return '\$$total us';
  }
}
