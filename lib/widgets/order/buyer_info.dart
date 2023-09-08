import 'package:effective/block/block.dart';
import 'package:effective/block/state.dart';
import 'package:effective/class_helpers/hotel_theme.dart';
import 'package:effective/class_helpers/container_circle_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHotel extends StatelessWidget {
  const BuyerHotel({super.key});

  @override
  Widget build(BuildContext context) {
    final block = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is EditingInfoBuyerState,
        builder: (context, state) => MyContainer(padding: 16.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 12),
                    child: Text('Информация о покупателе',
                        style: HotelTheme.textStyle22_500Black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextField(
                        onChanged: block.onChangePhoneBuer,
                        onTap: () {
                          if (block
                              .repository.phoneBuyerController.text.isEmpty) {
                            block.repository.phoneBuyerController.text =
                                '***) *** - ** - **';
                            block.repository.phoneBuyerController.selection =
                                TextSelection.fromPosition(
                                    const TextPosition(offset: 0));
                          }
                        },
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.phone,
                        controller: block.repository.phoneBuyerController,
                        decoration: InputDecoration(
                          errorStyle: HotelTheme.textStyle14_400Grey,
                          prefixText: '+7 (',
                          prefixStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          labelText: 'Номер телефона',
                          filled: true,
                          fillColor: block.repository.phoneBuyerError
                              ? HotelTheme.errorColor
                              : HotelTheme.scaffoldBackgroundColor,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: HotelTheme.greyColor,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        controller: block.repository.emailBuyerController,
                        onChanged: block.validateEmailBuyer,
                        decoration: InputDecoration(
                          errorStyle: HotelTheme.textStyle16_400Grey,
                          labelText: 'Почта',
                          filled: true,
                          fillColor: block.repository.emailBuyerError
                              ? HotelTheme.errorColor
                              : HotelTheme.scaffoldBackgroundColor,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: HotelTheme.greyColor,
                              )),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      maxLines: 10,
                      style: HotelTheme.textStyle16_400Grey,
                    ),
                  ),
                ])));
  }
}
