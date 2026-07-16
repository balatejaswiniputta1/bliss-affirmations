import 'package:flutter/material.dart';

class BlissBackground extends StatelessWidget {
  const BlissBackground({
    super.key,
    required this.child,
    required this.colors,
  });

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: -60,
            right: -40,
            child: _Bubble(size: 190),
          ),
          const Positioned(
            left: -70,
            bottom: 90,
            child: _Bubble(size: 210),
          ),
          child,
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.22),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
