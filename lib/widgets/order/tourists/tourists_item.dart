import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/widgets/order/tourists/tourist_data_widget.dart';
import 'package:effective/widgets/order/tourists/custom/list_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TouristsWidget extends StatefulWidget {
  const TouristsWidget({super.key});

  @override
  State<TouristsWidget> createState() => _TouristsWidgetState();
}

class _TouristsWidgetState extends State<TouristsWidget> {
  late HomeBloc block;
  @override
  void initState() {
    block = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
        child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => [
                  ChangeExpandedtState,
                  AddedTouristState,
                ].contains(current.runtimeType),
            builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionPanelListCustom(
                      expansionCallback: (panelIndex, isExpanded) =>
                          block.changeEpanded(panelIndex, isExpanded),
                      children: block.repository.touristsData
                          .map((e) => ExpansionPanelCustom(
                              isExpanded: e.isExpanded,
                              headerBuilder: (context, isExpanded) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Text(
                                      e.headerText,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                              body: TouristDataWidget(expansionPanelData: e)))
                          .toList(),
                    ),
                  ])));
  }


}
