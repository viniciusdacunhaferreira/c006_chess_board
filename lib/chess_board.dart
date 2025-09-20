import 'package:c006_chess_board/colors.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  static const n = 8;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boardWidth = constraints.maxWidth;
          final fontSize = boardWidth / 36;
          return Stack(
            children: [
              // * Board squares
              ...List.generate(n * n, (index) {
                final row = index ~/ n;
                final col = index % n;
                final isLight = (row + col) % 2 == 0;
                return Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 1 / n,
                    heightFactor: 1 / n,
                    // * Divide by N-1 because row and col are zero-indexed
                    alignment: FractionalOffset(col / (n - 1), row / (n - 1)),
                    child: ColoredBox(
                      color: isLight
                          ? ChessColors.lightSquare
                          : ChessColors.darkSquare,
                    ),
                  ),
                );
              }),
              // * Labels for rows 1-8
              ...List.generate(n, (row) {
                final number = n - row;
                return Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 1 / n,
                    heightFactor: 1 / n,
                    // * Divide by N-1 because row and col are zero-indexed
                    alignment: FractionalOffset(0.006, 0.001 + row / (n - 1)),
                    child: Text(
                      '$number',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: row % 2 == 0
                            ? ChessColors.darkSquare
                            : ChessColors.lightSquare,
                      ),
                    ),
                  ),
                );
              }),
              // * Labels for columns a-h
              ...List.generate(n, (col) {
                final letter = String.fromCharCode('a'.codeUnitAt(0) + col);
                return Positioned.fill(
                  child: FractionallySizedBox(
                    widthFactor: 1 / n,
                    heightFactor: 1 / n,
                    // * Divide by N-1 because row and col are zero-indexed
                    alignment: FractionalOffset(0.115 + col / (n - 1), 1.095),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: col % 2 == 0
                            ? ChessColors.lightSquare
                            : ChessColors.darkSquare,
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
