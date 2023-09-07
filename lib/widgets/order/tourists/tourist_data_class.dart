// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TouristData {
  bool isExpanded;
  String headerText;

  List<InputField> inputField;
  TouristData({
    required this.isExpanded,
    required this.headerText,
    required this.inputField,
  });
}

class InputField {
  TextEditingController textEditingController;
  String nameField;
  RegExp regExp;
  bool error;

  String hintText;
  InputField({
    required this.textEditingController,
    required this.nameField,
    required this.regExp,
    required this.error,
    required this.hintText,
  });
}
