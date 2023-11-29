import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.stars,
          size: 18,
          color: (difficultyLevel >= 1)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.stars,
          size: 18,
          color: (difficultyLevel >= 2)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.stars,
          size: 18,
          color: (difficultyLevel >= 3)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.stars,
          size: 18,
          color:
          (difficultyLevel >= 4)
              ? Colors.blue
              : Colors.blue[100],
        ),
        Icon(
          Icons.stars,
          size: 18,
          color: (difficultyLevel >= 5)
              ? Colors.blue
              : Colors.blue[100],
        ),
      ],
    );
  }
}