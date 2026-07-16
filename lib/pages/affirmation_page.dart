import 'dart:math';

import 'package:flutter/material.dart';

import '../data/bliss_data.dart';
import '../widgets/bliss_background.dart';
import '../widgets/cute_widgets.dart';
import '../widgets/page_header.dart';

class AffirmationPage extends StatefulWidget {
  const AffirmationPage({super.key});

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  final Random random = Random();

  late String selectedCategory;
  late String currentAffirmation;
  int colorIndex = 0;
  bool isFavorite = false;

  static const cardColors = [
    Color(0xFFFFD9E8),
    Color(0xFFE5DBFF),
    Color(0xFFD7F7EE),
    Color(0xFFFFE7C7),
    Color(0xFFD8E8FF),
    Color(0xFFFFF0B8),
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = BlissData.affirmations.keys.first;
    currentAffirmation = BlissData.affirmations[selectedCategory]!.first;
  }

  void showAnother() {
    final options = BlissData.affirmations[selectedCategory]!;
    var next = currentAffirmation;

    while (options.length > 1 && next == currentAffirmation) {
      next = options[random.nextInt(options.length)];
    }

    setState(() {
      currentAffirmation = next;
      colorIndex = (colorIndex + 1) % cardColors.length;
      isFavorite = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlissBackground(
      colors: const [
        Color(0xFFFFF0F7),
        Color(0xFFF2EEFF),
        Color(0xFFEFFAF8),
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
                        emoji: '✨',
                        title: 'Your Daily Bliss',
                        subtitle:
                            'A tiny pocket of positivity made just for you.',
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: CuteMascot(
                          message: 'Pick a vibe, bestie!',
                          size: 108,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        height: 45,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: BlissData.affirmations.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 9),
                          itemBuilder: (context, index) {
                            final category =
                                BlissData.affirmations.keys.elementAt(index);
                            final selected = category == selectedCategory;

                            return ChoiceChip(
                              selected: selected,
                              showCheckmark: false,
                              label: Text(category),
                              side: BorderSide.none,
                              selectedColor: const Color(0xFF8569CC),
                              backgroundColor:
                                  Colors.white.withValues(alpha: 0.86),
                              labelStyle: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : const Color(0xFF564F5D),
                                fontWeight: FontWeight.w700,
                              ),
                              onSelected: (_) {
                                setState(() {
                                  selectedCategory = category;
                                  currentAffirmation =
                                      BlissData.affirmations[category]!.first;
                                  colorIndex = index % cardColors.length;
                                  isFavorite = false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 22),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 430),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: Tween<double>(begin: 0.92, end: 1)
                                  .animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          key: ValueKey(currentAffirmation),
                          width: double.infinity,
                          padding: const EdgeInsets.all(26),
                          decoration: BoxDecoration(
                            color: cardColors[colorIndex],
                            borderRadius: BorderRadius.circular(34),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.92),
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: cardColors[colorIndex]
                                    .withValues(alpha: 0.6),
                                blurRadius: 34,
                                offset: const Offset(0, 16),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Positioned(
                                right: -8,
                                top: -14,
                                child: Text(
                                  '🌸',
                                  style: TextStyle(fontSize: 44),
                                ),
                              ),
                              const Positioned(
                                left: -10,
                                bottom: -14,
                                child: Text(
                                  '💫',
                                  style: TextStyle(fontSize: 38),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      StickerLabel(
                                        emoji: '💌',
                                        text: selectedCategory,
                                      ),
                                      const Spacer()
                                      
                                    ],
                                  ),
                                  const SizedBox(height: 36),
                                  const Text(
                                    '“',
                                    style: TextStyle(
                                      fontSize: 78,
                                      height: 0.7,
                                      color: Color(0xFF6B597B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    currentAffirmation,
                                    style: const TextStyle(
                                      fontSize: 29,
                                      height: 1.3,
                                      color: Color(0xFF3E3747),
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 34),
                                  const Row(
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Keep this one close today.',
                                        style: TextStyle(
                                          color: Color(0xFF6B597B),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: showAnother,
                          icon: const Text('🎲'),
                          label: const Text('Give me another'),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF7D62C4),
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
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
