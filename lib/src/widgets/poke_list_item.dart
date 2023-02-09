import 'package:flutter/material.dart';
import 'package:poke_dictionary/src/model/monster.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.monster});

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${monster.id}', style: textTheme.bodySmall),
        title: Text(monster.name),
        isThreeLine: true,
        subtitle: Text(monster.url),
        dense: true,
      ),
    );
  }
}
