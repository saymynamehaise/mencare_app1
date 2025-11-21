import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String? trailingText;
  final Color? trailingColor;

  const CardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    this.trailingText,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              // troca de deprecated withOpacity -> withValues
              color: color.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.fitness_center, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 13)),
              ],
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText!,
              style: TextStyle(
                color: trailingColor ?? Colors.white60,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
