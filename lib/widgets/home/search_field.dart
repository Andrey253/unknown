import 'package:effective/source/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            searchField(width),
            icon(width),
          ],
        ));
  }

  Container icon(double width) {
    return Container(
        height: width * 0.12,
        width: width * 0.12,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)
          ],
          shape: BoxShape.circle,
          color: ColorsConst.red,
        ),
        child: const Center(
          child: SvgIcon(
              color: Colors.white,
              size: 25,
              icon: SvgIconData('assets/svg/search_param.svg')),
        ));
  }

  Expanded searchField(double width) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(width * 0.027),
        height: width * 0.12,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 2)
            ],
            color: Colors.white,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(width * 0.06))),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorsConst.red,
                  ),
                  hintText: "Search",
                  border: InputBorder.none)),
        ),
      ),
    );
  }
}
