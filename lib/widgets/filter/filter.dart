import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/help/widgets.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/help/buttons_app.dart';
import 'package:effective/widgets/filter/name_params_filtert.dart';
import 'package:effective/widgets/filter/drop_buttob_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final block = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is FilterState,
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                padding: EdgeInsets.only(
                    left: width * 0.1, right: width * 0.1, top: width * 0.06),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.08),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: width * 0.02,
                        offset: Offset(0, -width * 0.02)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buttonsFilter(width, block),
                    SizedBox(height: width * 0.06),
                    const NameParamsFilterWidget(name: 'Brand'),
                    DropButtonFilter(
                        items: block.repository.filterParams.listBrands,
                        value: block.repository.filterParams.brand,
                        onChanged: block.setBrend),
                    const NameParamsFilterWidget(name: 'Price'),
                    DropButtonFilter(
                        items: block.repository.filterParams.listPrices,
                        value: block.repository.filterParams.price,
                        onChanged: block.setPrice),
                    const NameParamsFilterWidget(name: 'Size'),
                    DropButtonFilter(
                        items: block.repository.filterParams.listSizes,
                        value: block.repository.filterParams.size,
                        onChanged: block.setSize),
                    SizedBox(height: width * 0.06),
                  ],
                ),
              ),
            ));
  }

  Row buttonsFilter(double width, HomeBloc block) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonsApp(
            width: width * 0.09,
            height: width * 0.09,
            circular: width * 0.02,
            backgroundColor: ColorsConst.textColor,
            onPressed: block.cancelFilter,
            child: const Icon(Icons.close, color: Colors.white)),
        const Text(
          'Filter options',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        ButtonsApp(
            width: width * 0.21,
            height: width * 0.09,
            circular: width * 0.02,
            backgroundColor: ColorsConst.red,
            onPressed: block.doneFilter,
            child: TextWS(
                text: 'Done',
                width: width,
                size: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white))
      ],
    );
  }
}
