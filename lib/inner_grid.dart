import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class InnerGrid extends StatelessWidget {
  final double size;
  final Puzzle puzzle;
  final int blockIndex;
  const InnerGrid({Key? key, required this.size, required this.puzzle, required this.blockIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (cellIndex) {
        final value = puzzle.board()?.matrix()?[blockIndex][cellIndex].getValue();
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          child: Center(
            child: value != null && value != 0
            ? Text(
              value.toString(),
            )
            : const SizedBox(),
          ),
        );
      }),
    );
  }
}
