import 'package:flutter/material.dart';
import 'package:islamic/models/sura_model.dart';
import 'package:islamic/screens/suraDetails/sura_details_screen.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({
    super.key,
    required this.name,
    required this.index,
  });
  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraModel(name: name, index: index));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
