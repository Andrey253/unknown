import 'package:effective/help/widgets.dart';
import 'package:effective/old_model/details_model.dart';
import 'package:effective/source/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final list = [
      ['assets/svg/perfomance/cpu.svg', details.cpu],
      ['assets/svg/perfomance/camera.svg', details.camera],
      ['assets/svg/perfomance/ssd.svg', details.ssd],
      ['assets/svg/perfomance/sd.svg', details.sd]
    ];
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list
            .map((e) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgIcon(color: ColorsConst.details, size: 28, icon: SvgIconData(e[0])),
                    ),
                    TextWS(
                        text: e[1],
                        width: width,
                        size: 11,
                        fontWeight: FontWeight.w400,
                        color: ColorsConst.details),
                  ],
                ))
            .toList());
  }
}
