import 'package:flutter/material.dart';
import 'package:mencare_app1/shared/widgets/card_widget.dart';
import 'package:mencare_app1/shared/widgets/option_card.dart';
import 'package:mencare_app1/features/agendamentos/presentation/create_agendamento_screen.dart';
import 'package:mencare_app1/core/models/agendamento.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const snack = SnackBar(
      content: Text('Abrindo detalhes do treino...'),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );

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
        children: [
          const Text(
            'Próximo agendamento',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CardWidget(
            title: 'Treino Funcional',
            subtitle: 'Hoje, 16:00 - Academia FitMax',
            color: const Color(0xFFB85A2F),
            trailingText: '2h 15min',
            trailingColor: Colors.orangeAccent,
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(snack),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OptionCard(
                  title: 'Agendar Consulta',
                  subtitle: 'Médicos, exames e check-ups',
                  icon: Icons.local_hospital,
                  color: const Color(0xFF2F8A8A),
                  onTap: () async {
                    final saved = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateAgendamentoScreen(
                          initialType: AgType.consulta,
                        ),
                      ),
                    );
                    if (saved == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Consulta agendada!')),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OptionCard(
                  title: 'Agendar Treino',
                  subtitle: 'Personal, academia e esportes',
                  icon: Icons.fitness_center,
                  color: const Color(0xFF6B8A2F),
                  onTap: () async {
                    final saved = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateAgendamentoScreen(
                          initialType: AgType.treino,
                        ),
                      ),
                    );
                    if (saved == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Treino agendado!')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
