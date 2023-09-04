import 'package:effective/model/rooms_model.dart';
import 'package:effective/widgets/home/home_one/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class RoomItemWidget extends StatelessWidget {
  const RoomItemWidget({
    super.key,
    required this.roomsModel,
  });
  final RoomsModel roomsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        // margin: EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            MyCustomCarousel(listImages: roomsModel.imageUrls),
            Text(
              roomsModel.name,
              style: const TextStyle(
                  wordSpacing: 4,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: roomsModel.peculiarities
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          e,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xFF828796),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                  .toList(),
            ),
            Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(13, 114, 255, 0.10),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Подробнее о номере",
                      style: TextStyle(
                          wordSpacing: 4,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xFF0D72FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SvgIcon(
                        color: Color(0xFF0D72FF),
                        icon: SvgIconData('assets/svg/toright.svg'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}