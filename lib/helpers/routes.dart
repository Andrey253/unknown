import 'package:effective/widgets/order/order_page.dart';
import 'package:effective/widgets/rooms/rooms_page.dart';
import 'package:flutter/material.dart';

import '../widgets/finish_widget/finish_widget.dart';
import '../widgets/home/home_page.dart';

class Routes{
  static  routes(BuildContext context) => {
      '/rooms': (context) => const RoomsWidget(),
      '/RoomOrderWidget': (context) => const RoomOrderWidget(),
      '/EndWidget': (context) => const FinishWidget(),
      '/': (context) => const HomePage(),
    };
}