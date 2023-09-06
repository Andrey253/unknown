import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/widgets/order/tourists/tourist_data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TouristDataWidget extends StatelessWidget {
  const TouristDataWidget({super.key, required this.expansionPanelData});
  final TouristData expansionPanelData;

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
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
                        onChanged: (s) => block.checkErrorFields(s, e),
                        decoration: InputDecoration(
                          errorText: e.error?'':null,
                          errorStyle: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xFF828796),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          labelText: e.nameField,
                          filled: true,
                          fillColor: const Color(0xFFF6F6F9),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: Color(0xFFA9ABB7),
                              )),
                        )),
                  ),
                )
                .toList()));
  }
}
