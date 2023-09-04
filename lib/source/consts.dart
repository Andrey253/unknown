import 'package:effective/old_model/category.dart';
import 'package:flutter/material.dart';

abstract class ColorsConst {
  static const red = Color(0xFFFF6E4E);
  static const grey = Color(0xFFB3B3C3);
  static const backGround = Color.fromARGB(255, 172, 172, 193);
  static const padding = Color.fromARGB(255, 235, 235, 235);
  static const textColor = Color(0xFF010035);
  static const details = Color(0xFFB7B7B7);
  static const star = Color(0xFFFFB800);
  static const capacity = Color(0xFF8D8D8D);
  static const addRemoveBackground = Color(0xFF282843);
  static const deleteIcon = Color(0xFF36364D);
}

const urlStore = 'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175';
const urlDetails =
    'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5';
const urlCart = 'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149';
const markPro = 'SFProDisplay';
const sfPRO = 'SFPRODISPLAYREGULAR';
const startListCategory =  [
      Category(name: 'Phone', asset: 'assets/svg/phone.svg', selected: true),
      Category(
          name: 'Computer', asset: 'assets/svg/computer.svg', selected: false),
      Category(name: 'Health', asset: 'assets/svg/health.svg', selected: false),
      Category(name: 'Books', asset: 'assets/svg/books.svg', selected: false),
      Category(name: 'Web', asset: 'assets/svg/web.svg', selected: false),
      Category(
          name: 'Earphones',
          asset: 'assets/svg/earphones.svg',
          selected: false),
    ];
const startListSity = ['Moskow', 'Tomsk', 'Novosibirsk'];
const startListBrand = ['Samsung', 'Huawei', 'Poco', 'Xiaomi', 'Realme'];
const startListPrice = [
      '\$0 - \$300',
      '\$300 - \$500',
      '\$500 - \$1000',
      '\$1000 - \$3000',
      '\$3000 - \$6000',
      '\$6000 - \$10000',
    ];
const startListSizes= [
      '4.5 to 5.5 inches',
      '5.5 to 6.5 inches',
      '6.5 to 7.5 inches',
      '7.5 more inches',
    ];