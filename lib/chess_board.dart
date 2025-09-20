import 'package:c006_chess_board/colors.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: ChessBoardPainter(),
      ),
    );
  }
}

class ChessBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double squareSide = size.shortestSide / 8;

    for (int rankIndex = 0; rankIndex < 8; rankIndex++) {
      for (int fileIndex = 0; fileIndex < 8; fileIndex++) {
        final double left = fileIndex * squareSide;
        final double top = rankIndex * squareSide;

        final Color color = rankIndex.isOdd == fileIndex.isOdd
            ? ChessColors.lightSquare
            : ChessColors.darkSquare;

        canvas.drawRect(
          Rect.fromLTWH(left, top, squareSide, squareSide),
          Paint()..color = color,
        );

        final textColor = rankIndex.isOdd == fileIndex.isOdd
            ? ChessColors.darkSquare
            : ChessColors.lightSquare;

        final textStyle = TextStyle(
          fontSize: squareSide / 3,
          color: textColor,
          fontWeight: FontWeight.bold,
        );

        if (fileIndex == 0) {
          final rankTextPainter = TextPainter(
            text: TextSpan(
              text: (8 - rankIndex).toString(),
              style: textStyle,
            ),
            textDirection: TextDirection.ltr,
          );

          rankTextPainter.layout(
            minWidth: 0,
            maxWidth: squareSide,
          );

          rankTextPainter.paint(
            canvas,
            Offset(left + 0.1 * squareSide, top + 0.1 * squareSide),
          );
        }

        if (rankIndex == 7) {
          final fileTextPainter = TextPainter(
            text: TextSpan(
              text: String.fromCharCode(97 + fileIndex),
              style: textStyle,
            ),
            textDirection: TextDirection.ltr,
          );

          fileTextPainter.layout(
            minWidth: 0,
            maxWidth: squareSide,
          );

          fileTextPainter.paint(
            canvas,
            Offset(
              left + 0.9 * squareSide - fileTextPainter.width,
              top + 0.9 * squareSide - fileTextPainter.height,
            ),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
