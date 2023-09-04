import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyCustomCarousel extends StatelessWidget {
  const MyCustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const radiusIndicator = 10.0;
    const spaceIndicator = 5.0;
    final block = context.read<HomeBloc>();
    PageController pageController = PageController();
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: size.width * 0.6,
        width: size.width * 0.95,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => current is GetHotelState,
                builder: (context, state) => block.repository.hotelModel != null
                    ? PageView.builder(
                        controller: pageController,
                        onPageChanged: block.changeIndexIndicator,
                        itemCount:
                            block.repository.hotelModel?.imageUrls.length,
                        itemBuilder: (context, int) => CachedNetworkImage(
                            imageUrl:
                                block.repository.hotelModel!.imageUrls[int],
                            fit: BoxFit.fill,
                            progressIndicatorBuilder:
                                (context, url, progress) => const Center(
                                      child: CircularProgressIndicator(),
                                    )))
                    : const Center(child: CircularProgressIndicator())),
            BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    current is ChangeIndexIndicator || current is GetHotelState,
                builder: (context, state) => Align(
                      alignment: const Alignment(0, 0.94),
                      child: Container(
                        height: radiusIndicator * 2.2,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: block.repository.hotelModel?.imageUrls
                                      .length ??
                                  0,
                              itemBuilder: (context, int) => Padding(
                                    padding: EdgeInsets.all(spaceIndicator),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: radiusIndicator,
                                      width: radiusIndicator,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            block.repository.indexIndicator ==
                                                    int
                                                ? Colors.black
                                                : const Color(0x38000000),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
