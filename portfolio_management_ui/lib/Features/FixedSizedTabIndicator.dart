import 'package:flutter/material.dart';

class FixedSizeTabIndicator extends Decoration {
  final double width;
  final Color color;

  const FixedSizeTabIndicator({required this.width, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _FixedSizeIndicatorPainter(width: width, color: color);
  }
}

class _FixedSizeIndicatorPainter extends BoxPainter {
  final double width;
  final Paint paint1;

  _FixedSizeIndicatorPainter({required this.width, required Color color})
      : paint1 = Paint()..color = color;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = Rect.fromLTWH(
      offset.dx + (configuration.size!.width - width) / 2,
      offset.dy + configuration.size!.height - 2,
      width,
      2,
    );
    canvas.drawRect(rect, paint1);
  }
}
