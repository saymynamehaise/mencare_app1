import 'package:flutter/material.dart';
import '../../../../shared/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Adam 👋'),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 10),
                SizedBox(width: 4),
                Text('Online', style: TextStyle(fontSize: 13)),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        // lista marcada como const
        children: const [
          Text(
            'Próximo agendamento',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          CardWidget(
            title: 'Treino Funcional',
            subtitle: 'Hoje, 16:00 - Academia FitMax',
            color: Color(0xFFB85A2F),
            trailingText: '2h 15min',
            trailingColor: Colors.orangeAccent,
          ),
          SizedBox(height: 20),
          // Row const + children const
          Row(
            children: [
              Expanded(
                child: _OptionCard(
                  title: 'Agendar Consulta',
                  subtitle: 'Médicos, exames e check-ups',
                  icon: Icons.local_hospital,
                  color: Color(0xFF2F8A8A),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _OptionCard(
                  title: 'Agendar Treino',
                  subtitle: 'Personal, academia e esportes',
                  icon: Icons.fitness_center,
                  color: Color(0xFF6B8A2F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color color;

  const _OptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 13)),
        ],
      ),
    );
  }
}
