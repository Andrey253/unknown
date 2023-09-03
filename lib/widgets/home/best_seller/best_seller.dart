import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/old_model/store/best_seller.dart';
import 'package:effective/source/consts.dart';
import 'package:effective/widgets/filter/filter.dart';
import 'package:effective/widgets/home/best_seller/best_seller_help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final block = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => state is FilterState
            ? const FilterWidget()
            : Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                  children: block.repository.store.bestSeller
                      .map((e) => GestureDetector(
                            onTap: () => block.navigateToDetails(
                                context, urlDetails, block.repository),
                            child: itemBestSeller(width, e, block),
                          ))
                      .toList(),
                ),
              ));
  }
}
