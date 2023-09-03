import 'package:effective/old_model/details_model.dart';
import 'package:flutter/cupertino.dart';

class FeatutrDetails extends StatelessWidget {
  const FeatutrDetails({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 65, child: Text(runtimeType.toString()));
  }
}
