// ignore_for_file: unused_import
import 'package:c006_chess_board/colors.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            children: [
              for (int rankIndex = 8; rankIndex >= 1; rankIndex--)
                _Rank(rankIndex)
            ],
          ),
        ),
      ),
    );
  }
}

class _Rank extends StatelessWidget {
  const _Rank(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int fileIndex = 1; fileIndex <= 8; fileIndex++)
            _Square(rankIndex: index, fileIndex: fileIndex)
        ],
      ),
    );
  }
}

class _Square extends StatelessWidget {
  const _Square({required this.rankIndex, required this.fileIndex});

  final int rankIndex;
  final int fileIndex;

  bool _isDark() => rankIndex.isOdd == fileIndex.isOdd;

  @override
  Widget build(BuildContext context) {
    final resolvedTextStyle = TextStyle(
      color: _isDark() ? ChessColors.lightSquare : ChessColors.darkSquare,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        padding: EdgeInsets.all(4),
        color: _isDark() ? ChessColors.darkSquare : ChessColors.lightSquare,
        child: Stack(
          children: [
            Offstage(
              offstage: fileIndex != 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('$rankIndex', style: resolvedTextStyle),
              ),
            ),
            Offstage(
              offstage: rankIndex != 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  String.fromCharCode(96 + fileIndex),
                  style: resolvedTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
