import 'package:flutter/material.dart';

@immutable
class DotsLoader extends StatefulWidget {
  const DotsLoader({
    required this.size,
    required this.color,
    super.key,
  });

  final double size;
  final Color color;

  @override
  State<DotsLoader> createState() => _DotsLoaderState();
}

class _DotsLoaderState extends State<DotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  Transform _buildDot({
    required Offset begin,
    required Offset end,
    required Interval interval,
  }) =>
      Transform.translate(
        offset: Tween<Offset>(begin: begin, end: end)
            .animate(CurvedAnimation(parent: _controller, curve: interval))
            .value,
        child: Container(
          width: widget.size / 5,
          height: widget.size / 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        ),
      );

  Transform _buildBottomDot({required double begin, required double end}) {
    final double offset = -widget.size / 8;
    return _buildDot(
      begin: Offset.zero,
      end: Offset(0, offset),
      interval: Interval(begin, end),
    );
  }

  Transform _buildTopDot({required double begin, required double end}) {
    final double offset = -widget.size / 8;
    return _buildDot(
      begin: Offset(0, offset),
      end: Offset.zero,
      interval: Interval(begin, end),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (_controller.value <= 0.50)
                  _buildBottomDot(begin: 0.12, end: 0.50)
                else
                  _buildTopDot(begin: 0.62, end: 1),
                if (_controller.value <= 0.44)
                  _buildBottomDot(begin: 0.06, end: 0.44)
                else
                  _buildTopDot(begin: 0.56, end: 0.94),
                if (_controller.value <= 0.38)
                  _buildBottomDot(begin: 0, end: 0.38)
                else
                  _buildTopDot(begin: 0.50, end: 0.88),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class DrawDot extends StatelessWidget {
  const DrawDot.circular({
    required double dotSize,
    required this.color,
    super.key,
  })  : width = dotSize,
        height = dotSize,
        circular = true;

  const DrawDot.elliptical({
    required this.width,
    required this.height,
    required this.color,
    super.key,
  }) : circular = false;

  final double width;
  final double height;
  final bool circular;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular
            ? null
            : BorderRadius.all(Radius.elliptical(width, height)),
      ),
    );
  }
}
