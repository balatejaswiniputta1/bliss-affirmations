import 'dart:math' as math;

import 'package:flutter/material.dart';

class CuteMascot extends StatefulWidget {
  const CuteMascot({
    super.key,
    this.message = 'You’ve got this!',
    this.size = 118,
  });

  final String message;
  final double size;

  @override
  State<CuteMascot> createState() => _CuteMascotState();
}

class _CuteMascotState extends State<CuteMascot>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> bounce;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    bounce = Tween<double>(begin: -4, end: 6).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: bounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, bounce.value),
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: widget.size,
                height: widget.size * 0.72,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(widget.size),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB99CEB).withValues(alpha: 0.28),
                      blurRadius: 22,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: widget.size * 0.12,
                bottom: widget.size * 0.08,
                child: _CloudPuff(size: widget.size * 0.42),
              ),
              Positioned(
                right: widget.size * 0.10,
                bottom: widget.size * 0.04,
                child: _CloudPuff(size: widget.size * 0.48),
              ),
              Positioned(
                top: widget.size * 0.22,
                child: Row(
                  children: [
                    const _Eye(),
                    SizedBox(width: widget.size * 0.22),
                    const _Eye(),
                  ],
                ),
              ),
              Positioned(
                top: widget.size * 0.39,
                child: Container(
                  width: widget.size * 0.20,
                  height: widget.size * 0.09,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF55495E),
                        width: 3,
                      ),
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: -12,
                top: 2,
                child: Text('✨', style: TextStyle(fontSize: 25)),
              ),
              const Positioned(
                right: -8,
                top: 15,
                child: Text('💗', style: TextStyle(fontSize: 23)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              widget.message,
              style: const TextStyle(
                color: Color(0xFF62566B),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingDecorations extends StatefulWidget {
  const FloatingDecorations({super.key});

  @override
  State<FloatingDecorations> createState() => _FloatingDecorationsState();
}

class _FloatingDecorationsState extends State<FloatingDecorations>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const items = ['✨', '💖', '🌸', '⭐', '🫧'];

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Stack(
            children: List.generate(items.length, (index) {
              final t = (controller.value + index / items.length) % 1;
              final sway = math.sin(t * math.pi * 2 + index) * 12;
              final left = 30.0 + index * 70 + sway;
              final bottom = 20.0 + t * 420;

              return Positioned(
                left: left,
                bottom: bottom,
                child: Opacity(
                  opacity: (1 - t).clamp(0.15, 0.75),
                  child: Transform.rotate(
                    angle: t * 0.5,
                    child: Text(
                      items[index],
                      style: TextStyle(fontSize: 18 + index.toDouble()),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class StickerLabel extends StatelessWidget {
  const StickerLabel({
    super.key,
    required this.emoji,
    required this.text,
  });

  final String emoji;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.03,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF6B8),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          '$emoji $text',
          style: const TextStyle(
            color: Color(0xFF665A43),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _CloudPuff extends StatelessWidget {
  const _CloudPuff({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Eye extends StatelessWidget {
  const _Eye();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 13,
      decoration: BoxDecoration(
        color: const Color(0xFF55495E),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
