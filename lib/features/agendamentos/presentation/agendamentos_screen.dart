import 'package:flutter/material.dart';

class AgendamentosScreen extends StatelessWidget {
  const AgendamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Agendamentos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _AgendaCard(
            title: 'Consulta Médica',
            place: 'Dr. Carlos Silva',
            date: '15 Nov',
            hour: '14:30',
            status: 'Confirmado',
            color: Color(0xFF2F8A8A),
          ),
          _AgendaCard(
            title: 'Treino Funcional',
            place: 'Academia FitPro',
            date: '16 Nov',
            hour: '07:00',
            status: 'Confirmado',
            color: Color(0xFFB85A2F),
          ),
          _AgendaCard(
            title: 'Check-up Cardiológico',
            place: 'Dra. Ana Costa',
            date: '18 Nov',
            hour: '10:15',
            status: 'Pendente',
            color: Color(0xFF6AA94E),
          ),
          _AgendaCard(
            title: 'Consulta Odontológica',
            place: 'Dr. Pedro Lima',
            date: '20 Nov',
            hour: '16:00',
            status: 'Confirmado',
            color: Color(0xFF2F8A8A),
          ),
        ],
      ),
    );
  }
}

class _AgendaCard extends StatelessWidget {
  final String title, place, date, hour, status;
  final Color color;

  const _AgendaCard({
    required this.title,
    required this.place,
    required this.date,
    required this.hour,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor = switch (status) {
      'Confirmado' => Colors.green,
      'Pendente' => Colors.orange,
      _ => Colors.grey,
    };

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
                Text(place, style: const TextStyle(color: Colors.white54, fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.white38, size: 13),
                    const SizedBox(width: 4),
                    Text('$date  •  $hour', style: const TextStyle(color: Colors.white54)),
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
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
