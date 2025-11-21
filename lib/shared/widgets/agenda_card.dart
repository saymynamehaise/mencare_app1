import 'package:flutter/material.dart';

class AgendaCard extends StatelessWidget {
  final String title, doctor, date, hour, status;
  final Color color;

  const AgendaCard({
    super.key,
    required this.title,
    required this.doctor,
    required this.date,
    required this.hour,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'Confirmado'
        ? Colors.green
        : status == 'Pendente'
            ? Colors.orange
            : Colors.grey;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.event, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  doctor,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.white38, size: 13),
                    const SizedBox(width: 4),
                    Text('$date  •  $hour',
                        style: const TextStyle(color: Colors.white54)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
