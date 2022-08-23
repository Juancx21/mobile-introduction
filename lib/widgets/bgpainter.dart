import 'package:flutter/material.dart';

class HeroHome extends StatelessWidget {
  const HeroHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: CustomPaint(
        painter: _BgPainter(const Color(0xFF024282)),
      ),
    );
  }
}


class _BgPainter extends CustomPainter{
  final Color color;

  _BgPainter(this.color);

  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, 256);
    path.lineTo(size.width, 256);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}