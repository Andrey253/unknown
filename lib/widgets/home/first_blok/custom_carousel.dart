// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCustomCarousel extends StatelessWidget {
  const MyCustomCarousel({Key? key, required this.listImages})
      : super(key: key);
  final List<String>? listImages;

  @override
  Widget build(BuildContext context) {
    int indexIndicator = 0;
    GlobalKey gkey = GlobalKey();
    void changeIndicator(int value) {
      // ignore: invalid_use_of_protected_member
      gkey.currentState?.setState(() {
        indexIndicator = value;
      });
    }

    final size = MediaQuery.of(context).size;
    const radiusIndicator = 10.0;
    const spaceIndicator = 5.0;
    // final block = context.read<HomeBloc>();
    PageController pageController = PageController();
    return Container(
      height: size.width * 0.6,
      width: size.width * 0.95,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 237, 237),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      clipBehavior: Clip.hardEdge,
      child: Stack(children: [
        listImages != null
            ? PageView.builder(
                controller: pageController,
                onPageChanged: changeIndicator,
                itemCount: listImages?.length,
                itemBuilder: (context, index) => CachedNetworkImage(
                    imageUrl: listImages![index],
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const Center(
                          child: CircularProgressIndicator(),
                        )))
            : const Center(child: CircularProgressIndicator()),
        StatefulBuilder(
            key: gkey,
            builder: (BuildContext context, StateSetter state) => Align(
                  alignment: const Alignment(0, 0.94),
                  child: Container(
                    height: radiusIndicator * 2.2,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listImages?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(spaceIndicator),
                                child: GestureDetector(
                                  onTap: () => pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOutExpo),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height: radiusIndicator,
                                    width: radiusIndicator,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: indexIndicator == index
                                          ? Colors.black
                                          : const Color(0x38000000),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                )),
      ]),
    );
  }
}
