// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable{
 final String name;
 final String asset;
 final bool selected;
  const Category({
    required this.name,
    required this.asset,
    required this.selected,
  });
  
  @override
  List<Object?> get props =>[selected];

 
}
