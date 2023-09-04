import 'package:effective/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppBlock<T> extends Cubit<T> {
  final Repository repository;
  final T type;
  AppBlock({
    required this.repository,
    required this.type,
  }) : super(type);
}
