// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';



class SearchCity extends SearchDelegate {
  List<String> listCity;
  SearchCity({
    required this.listCity,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) close(context, null);
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return TextButton.icon(
        onPressed: () => query = 'refactor',
        icon: const Icon(Icons.home),
        label: const Text('refactor'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(children: [
      ...listCity.where((element) => element.toLowerCase().contains(query.toLowerCase())).map(
          (e) => TextButton(onPressed: () => close(context, e), child: Text(e)))
    ]);
  }
}
