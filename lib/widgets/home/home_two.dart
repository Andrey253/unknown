import 'package:effective/block/home_block.dart';
import 'package:effective/block/home_state.dart';
import 'package:effective/class_helpers/hotel_menu.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is GetHotelState,
      builder: (context, state) => state is GetHotelState
          ? MyContainer(
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
                    children: state.hotelModel.aboutTheHotel.peculiarities
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
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
                      state.hotelModel.aboutTheHotel.description,
                      maxLines: 10,
                      style: HotelTheme.textStyle16_400Grey,
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
                        trailing: SvgIcon(
                            color: Color(0xFF2C3035),
                            icon: SvgIconData('assets/svg/toright.svg')),
                      ),
                      separatorBuilder: (context, index) => Align(
                        alignment: Alignment(1, 0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: size.width * 0.75,
                            height: 1,
                            color: Color(0x26828796),
                          ),
                        ),
                      ),
                      itemCount: menuHotel.length,
                    ),
                  )
                ]))
          : const SizedBox.shrink(),
    );
  }
}
