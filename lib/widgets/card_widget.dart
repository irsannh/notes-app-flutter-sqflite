import 'package:flutter/material.dart';
import 'package:notes_app/utils/card_color.dart';

import '../models/note.dart';
import '../utils/card_color.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final Note note;
  const CardWidget({
    Key? key,
    required this.index,
    required this.note,
  }) : super(key: key);

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 150;
      default:
        return 100;
    }

  }

  @override
  Widget build(BuildContext context) {
    final color = cardColors[index % cardColors.length];
    final minHeight = getMinHeight(index);
    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(
          minHeight: minHeight
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
