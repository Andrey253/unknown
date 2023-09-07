import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:effective/model/rooms_model.dart';
import 'package:effective/widgets/home/home_one/custom_carousel.dart';
import 'package:effective/widgets/rooms/rooms_button.dart';
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
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCustomCarousel(listImages: roomsModel.imageUrls),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              roomsModel.name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: roomsModel.peculiarities
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            e,
                            style: HotelTheme.textStyle16_500Grey,
                          ),
                        ))
                    .toList(),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(13, 114, 255, 0.10),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Text(
                    "Подробнее о номере",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color:  HotelTheme.buttonBackgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SvgIcon(
                      color: HotelTheme.buttonBackgroundColor,
                      icon: SvgIconData('assets/svg/toright.svg'))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${roomsModel.price} р",
                  style: const TextStyle(
                      textBaseline: TextBaseline.ideographic,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text(
                    roomsModel.pricePer,
                    style: HotelTheme.textStyle16_400Grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const RoomsButton(),
        ],
      ),
    );
  }
}
