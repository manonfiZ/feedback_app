import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'How was your week ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      EyeWidget(
                        factor: _sliderValue,
                      ),
                      EyeWidget(
                        factor: _sliderValue,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomPaint(
                  painter: SmilePainter(_sliderValue),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 50,
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Slider(
                  value: _sliderValue,
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EyeWidget extends StatelessWidget {
  const EyeWidget({
    super.key,
    required this.factor,
  });

  final double factor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: EyePainter(factor),
          child: const SizedBox(
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          top: 60 + factor,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}

class EyePainter extends CustomPainter {
  const EyePainter(this.factor);

  final double factor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = Colors.black;

    final path = Path();

    const startPoint = Offset(15, 15);
    final firstControlPoint =
        Offset(size.width * .10, -size.height * factor + 50);
    final secondControlPoint =
        Offset(size.width * .90, -size.height * factor + 50);
    final endPoint = Offset(size.width - 15, 15);

    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(firstControlPoint.dx, firstControlPoint.dy,
        secondControlPoint.dx, secondControlPoint.dy, endPoint.dx, endPoint.dy);

    path.cubicTo(
      size.width * .99,
      size.height * 0.95,
      size.width * .01,
      size.height * 0.95,
      startPoint.dx,
      startPoint.dy,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SmilePainter extends CustomPainter {
  const SmilePainter(this.factor);

  final double factor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    paint.color = Colors.black;

    final path = Path();

    const startPoint = Offset(0, 30);
    final firstControlPoint =
        Offset(size.width / 4, size.height * (factor) + 50);
    final secondControlPoint =
        Offset(3 * size.width / 4, size.height * (factor) + 50);
    final endPoint = Offset(size.width, 30);

    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(firstControlPoint.dx, firstControlPoint.dy,
        secondControlPoint.dx, secondControlPoint.dy, endPoint.dx, endPoint.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
