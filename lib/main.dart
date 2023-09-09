import 'package:effective/block/block.dart';
import 'package:effective/helpers/routes.dart';
import 'package:effective/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/hotel_theme.dart';

// flutter build apk --split-per-abi
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBlock>(
      create: (_) => AppBlock(repository: Repository()),
      child: MaterialApp(
          theme: HotelTheme.buildLightThemeMy(),
          routes: Routes.routes(context)),
    );
  }
}
