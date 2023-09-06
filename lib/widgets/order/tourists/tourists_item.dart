import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/widgets/order/tourists/tourists.dart';
import 'package:effective/widgets/order/tourists/custom/list_panel.dart';
import 'package:effective/widgets/order/tourists/expansion_class.dart';
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
            buildWhen: (previous, current) => current is AddTouristState,
            builder: (context, state) {
              if(state is AddTouristState){
                print('teg addState ${state.created}');
                
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ExpansionPanelListCustom(
                    expansionCallback: (panelIndex, isExpanded) => setState(
                        () => block.repository.touristsData[panelIndex]
                            .isExpanded = !isExpanded),
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
                            body: TouristWidget(expansionPanelData: e)))
                        .toList(),
                  ),
                ]);
            }));
  }
}
