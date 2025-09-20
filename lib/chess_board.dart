// ignore_for_file: unused_import
import 'package:c006_chess_board/colors.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  final double boardSide = 500;

  @override
  Widget build(BuildContext context) {
    final List<Widget> result = [];

    double squareSide = boardSide / 8;

    for (int rankIndex = 0; rankIndex < 8; rankIndex++) {
      for (int fileIndex = 0; fileIndex < 8; fileIndex++) {
        final double left = fileIndex * squareSide;
        final double top = rankIndex * squareSide;

        final Color color = rankIndex.isOdd == fileIndex.isOdd
            ? ChessColors.lightSquare
            : ChessColors.darkSquare;

        final resolvedTextStyle = TextStyle(
          color: rankIndex.isOdd == fileIndex.isOdd
              ? ChessColors.darkSquare
              : ChessColors.lightSquare,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );

        result.add(
          Positioned(
            left: left,
            top: top,
            child: Container(
              padding: EdgeInsets.all(4),
              width: squareSide,
              height: squareSide,
              color: color,
              child: Stack(
                children: [
                  Offstage(
                    offstage: fileIndex != 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        (8 - rankIndex).toString(),
                        style: resolvedTextStyle,
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: rankIndex != 7,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        String.fromCharCode(97 + fileIndex),
                        style: resolvedTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return AspectRatio(
      aspectRatio: 1,
      child: FittedBox(
        child: SizedBox(
          height: boardSide,
          width: boardSide,
          child: Stack(
            children: result,
          ),
        ),
      ),
    );
  }
}
