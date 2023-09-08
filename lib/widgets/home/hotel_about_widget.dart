import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_menu.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/container_circle_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      // buildWhen: (previous, current) => current is GetHotelState||current is StartState,
      builder: (context, state) => block.repository.hotelModel == null ||
              state is StartState
          ? const SizedBox.shrink()
          : MyContainer(
              padding: 16.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Об отеле",
                        style: HotelTheme.textStyle22_500Black,
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: block
                          .repository.hotelModel!.aboutTheHotel.peculiarities
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  e,
                                  style: HotelTheme.textStyle16_500Grey,
                                ),
                              ))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        block.repository.hotelModel!.aboutTheHotel.description,
                        maxLines: 10,
                        style: HotelTheme.textStyle16_400Black,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFFBFBFC),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          onTap: () {},
                          title: Text(
                            menuHotel[index].name,
                            style: HotelTheme.textStyle16_500Black,
                          ),
                          subtitle: Text(
                            menuHotel[index].comment,
                            style: HotelTheme.textStyle14_500Grey,
                          ),
                          leading: SvgIcon(
                              size: 24,
                              color: Colors.black,
                              icon: SvgIconData(menuHotel[index].svg)),
                          trailing: const SvgIcon(
                              color: Color(0xFF2C3035),
                              icon: SvgIconData('assets/svg/toright.svg')),
                        ),
                        separatorBuilder: (context, index) => Align(
                          alignment: const Alignment(1, 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: size.width * 0.75,
                              height: 1,
                              color: const Color(0x26828796),
                            ),
                          ),
                        ),
                        itemCount: menuHotel.length,
                      ),
                    )
                  ])),
    );
  }
}
