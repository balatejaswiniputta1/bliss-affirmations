import 'dart:math';

import 'package:flutter/material.dart';

import '../data/bliss_data.dart';
import '../widgets/bliss_background.dart';
import '../widgets/cute_widgets.dart';
import '../widgets/glass_card.dart';
import '../widgets/page_header.dart';

class UniversePage extends StatefulWidget {
  const UniversePage({super.key});

  @override
  State<UniversePage> createState() => _UniversePageState();
}

class _UniversePageState extends State<UniversePage> {
  final Random random = Random();

  String sender = 'The Universe';
  String message = 'You are closer than you think. Keep going.';

  void receiveMessage() {
    final senders = BlissData.universeMessages.keys.toList();
    final nextSender = senders[random.nextInt(senders.length)];
    final options = BlissData.universeMessages[nextSender]!;

    setState(() {
      sender = nextSender;
      message = options[random.nextInt(options.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlissBackground(
      colors: const [
        Color(0xFFEDE7FF),
        Color(0xFFFFEEF6),
        Color(0xFFE7F6FF),
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
                        emoji: '🌙',
                        title: 'The Universe Texted',
                        subtitle:
                            'A tiny message arrived exactly when you needed it.',
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: CuteMascot(
                          message: 'You have a new message!',
                          size: 100,
                        ),
                      ),
                      const SizedBox(height: 22),
                      GlassCard(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF8C6BD8),
                                        Color(0xFFE18AB5),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '🌌',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sender,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF393342),
                                        ),
                                      ),
                                      const Text(
                                        'typing from another dimension...',
                                        style: TextStyle(
                                          color: Color(0xFF8A8292),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text('🟢'),
                              ],
                            ),
                            const SizedBox(height: 26),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                child: Container(
                                  key: ValueKey(message),
                                  constraints:
                                      const BoxConstraints(maxWidth: 440),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0E9FF),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(24),
                                      bottomLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(24),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFE1D5FF),
                                    ),
                                  ),
                                  child: Text(
                                    message,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      height: 1.4,
                                      color: Color(0xFF4F4562),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'seen by your heart 💜',
                                style: TextStyle(
                                  color: Color(0xFF9A90A2),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: receiveMessage,
                          icon: const Text('📨'),
                          label: const Text('Open another message'),
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF7C62C4),
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
