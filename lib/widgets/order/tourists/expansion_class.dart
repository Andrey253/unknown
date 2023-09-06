// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpansionPanelData {
  bool isExpanded;
  String headerText;
  List<InputField> inputField;
  ExpansionPanelData({
    required this.isExpanded,
    required this.headerText,
    required this.inputField,
  });
}

class InputField {
  TextEditingController textEditingController;
  String nameField;

  String? error;
  InputField({
    required this.textEditingController,
    required this.nameField,
  });
}
