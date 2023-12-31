import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/helpers/container_circle_border.dart';
import 'package:effective/widgets/order/tourists/tourist_data_widget.dart';
import 'package:effective/widgets/order/tourists/custom/list_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestTouristsWidget extends StatefulWidget {
  const TestTouristsWidget({super.key});

  @override
  State<TestTouristsWidget> createState() => _TestTouristsWidgetState();
}

class _TestTouristsWidgetState extends State<TestTouristsWidget> {
  late AppBlock block;
  @override
  void initState() {
    block = context.read<AppBlock>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlock, AppState>(
        buildWhen: (previous, current) => [
              // ChangeExpandedtState,
              TouristState,
              EditingInfoBuyerState
            ].contains(current.runtimeType),
        builder: (context, state) {
          final list = block.repository.touristsData;
          final length = list.length;
          final isExpandewd = list.fold<double>(
              0,
              (previousValue, element) =>
                  previousValue + (element.isExpanded ? 1 : 0));
          final height = 78.0 * length + isExpandewd * 402;
          return SizedBox(
              height: height,
              child: ListView.builder(
                  primary: false,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      MyContainer(
                        padding: 6.0,
                        child: ExpansionPanelListCustom(
                            expansionCallback: (panelIndex, isExpanded) => block
                                .changeExpandedListTourist(index, isExpanded),
                            children: [
                              ExpansionPanelCustom(
                                  isExpanded: list[index].isExpanded,
                                  headerBuilder: (context, isExpanded) =>
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 10),
                                        child: Text(
                                          list[index].headerText,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                  body: TouristDataWidget(
                                      expansionPanelData: list[index]))
                            ]),
                      )));
        });
  }
}
