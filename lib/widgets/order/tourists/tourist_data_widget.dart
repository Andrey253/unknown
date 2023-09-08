import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TouristDataWidget extends StatelessWidget {
  const TouristDataWidget({super.key, required this.expansionPanelData});
  final TouristData expansionPanelData;

  @override
  Widget build(BuildContext context) {
    final block = context.read<AppBlock>();
    return BlocBuilder<AppBlock, AppState>(
        buildWhen: (previous, current) => current is InputDataTouristState,
        builder: (context, state) => ListView(
            primary: false,
            shrinkWrap: true,
            children: expansionPanelData.inputField
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        controller: e.textEditingController,
                        onChanged: (s) => block.checkErrorTouristFields(s, e),
                        decoration: InputDecoration(
                          errorStyle: HotelTheme.textStyle16_400Grey,
                          labelText: e.nameField,
                          hintText: e.hintText,
                          filled: true,
                          fillColor: e.error
                              ? HotelTheme.errorColor
                              : HotelTheme.scaffoldBackgroundColor,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: HotelTheme.greyColor,
                              )),
                        )),
                  ),
                )
                .toList()));
  }
}
