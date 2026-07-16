import 'dart:math';

import 'package:flutter/material.dart';

import '../data/bliss_data.dart';
import '../widgets/bliss_background.dart';
import '../widgets/cute_widgets.dart';
import '../widgets/glass_card.dart';
import '../widgets/page_header.dart';

class ComplimentPage extends StatefulWidget {
  const ComplimentPage({super.key});

  @override
  State<ComplimentPage> createState() => _ComplimentPageState();
}

class _ComplimentPageState extends State<ComplimentPage> {
  final Random random = Random();

  String compliment = BlissData.compliments.first;
  int clickCount = 0;

  void generateCompliment() {
    setState(() {
      compliment =
          BlissData.compliments[random.nextInt(BlissData.compliments.length)];
      clickCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlissBackground(
      colors: const [
        Color(0xFFFFEBF4),
        Color(0xFFFFF5D8),
        Color(0xFFEDE7FF),
      ],
      child: Stack(
        children: [
          const FloatingDecorations(),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeader(
                        emoji: '🎉',
                        title: 'Compliment Machine',
                        subtitle:
                            'Because sometimes you need to hear something lovely.',
                      ),
                      const SizedBox(height: 18),
                      const Center(
                        child: CuteMascot(
                          message: 'This one is for you!',
                          size: 104,
                        ),
                      ),
                      const SizedBox(height: 22),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 450),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: Tween<double>(begin: 0.88, end: 1)
                                .animate(animation),
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          key: ValueKey('$compliment$clickCount'),
                          width: double.infinity,
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFD4E5),
                                Color(0xFFE5D9FF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(34),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE0BAD6)
                                    .withValues(alpha: 0.7),
                                blurRadius: 35,
                                offset: const Offset(0, 17),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Positioned(
                                left: -8,
                                top: -12,
                                child: Text(
                                  '🎀',
                                  style: TextStyle(fontSize: 42),
                                ),
                              ),
                              const Positioned(
                                right: -8,
                                bottom: -12,
                                child: Text(
                                  '🌟',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    '✨',
                                    style: TextStyle(fontSize: 66),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    compliment,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF423849),
                                      fontSize: 27,
                                      height: 1.35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const StickerLabel(
                                    emoji: '🏅',
                                    text: 'Certified Lovely Human',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: generateCompliment,
                          icon: const Text('🎊'),
                          label: const Text('Compliment me again'),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFFD76591),
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const GlassCard(
                        child: Row(
                          children: [
                            Text('💌', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'You are legally required to smile after receiving this compliment.',
                                style: TextStyle(
                                  color: Color(0xFF6C6573),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
