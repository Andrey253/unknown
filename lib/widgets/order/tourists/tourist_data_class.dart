// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
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

  @override
  bool operator ==(covariant TouristData other) {
    if (identical(this, other)) return true;

    return other.isExpanded == isExpanded &&
        other.headerText == headerText &&
        listEquals(other.inputField, inputField);
  }

  @override
  int get hashCode =>
      isExpanded.hashCode ^ headerText.hashCode ^ inputField.hashCode;

  TouristData copyWith({
    bool? isExpanded,
    String? headerText,
    List<InputField>? inputField,
  }) {
    return TouristData(
      isExpanded: isExpanded ?? this.isExpanded,
      headerText: headerText ?? this.headerText,
      inputField: List.from(inputField ?? this.inputField),
    );
  }
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

  @override
  bool operator ==(covariant InputField other) {
    if (identical(this, other)) return true;

    return other.textEditingController == textEditingController &&
        other.nameField == nameField &&
        other.regExp == regExp &&
        other.error == error &&
        other.hintText == hintText;
  }

  @override
  int get hashCode {
    return textEditingController.hashCode ^
        nameField.hashCode ^
        regExp.hashCode ^
        error.hashCode ^
        hintText.hashCode;
  }
}
