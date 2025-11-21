import 'package:flutter/material.dart';
import '../../../../shared/widgets/card_widget.dart';

class TreinosScreen extends StatelessWidget {
  const TreinosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Treinos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Plano Ativo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          CardWidget(
            title: 'Força & Resistência',
            subtitle: '4x semana • 45–60 min',
            color: Color(0xFF2F8A8A),
          ),
          SizedBox(height: 24),
          Text('Treinos da Semana', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CardWidget(
            title: 'Treino A – Peito/Tríceps',
            subtitle: 'Concluído hoje',
            color: Color(0xFF6AA94E),
          ),
          CardWidget(
            title: 'Treino B – Costas/Bíceps',
            subtitle: 'Agendado para amanhã',
            color: Color(0xFFB85A2F),
          ),
          CardWidget(
            title: 'Treino C – Pernas',
            subtitle: 'Quinta-feira',
            color: Color(0xFF555555),
          ),
        ],
      ),
    );
  }
}
