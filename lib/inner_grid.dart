import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';

class InnerGrid extends StatelessWidget {
  final double size;
  final Puzzle puzzle;
  final int blockIndex;

  final int? selectedRow;
  final int? selectedCol;
  final Function(int row, int col) onCellTap;

  const InnerGrid({
    Key? key,
    required this.size,
    required this.puzzle,
    required this.blockIndex,
    required this.selectedRow,
    required this.selectedCol,
    required this.onCellTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (cellIndex) {

        // Calcul de la vraie position dans la grille 9x9
        final int blockRow = blockIndex ~/ 3;
        final int blockCol = blockIndex % 3;

        final int cellRow = cellIndex ~/ 3;
        final int cellCol = cellIndex % 3;

        final int row = blockRow * 3 + cellRow;
        final int col = blockCol * 3 + cellCol;

        final value = puzzle.board()?.matrix()?[blockIndex][cellIndex].getValue();

        final bool isSelected =
            selectedRow == row && selectedCol == col;

        return InkWell(
          onTap: () => onCellTap(row, col),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.3,
              ),
              color: isSelected
                  ? Colors.blueAccent.shade100.withAlpha(100)
                  : Colors.transparent,
            ),
            child: Center(
              child: value != null && value != 0
                  ? Text(value.toString())
                  : const SizedBox(),
            ),
          ),
        );
      }),
    );
  }
}
