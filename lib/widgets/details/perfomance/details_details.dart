import 'package:effective/old_model/details_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsDetails extends StatelessWidget {
  const DetailsDetails({super.key, required this.details});
  final Details details;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 65, child: Text(runtimeType.toString()));
  }
}