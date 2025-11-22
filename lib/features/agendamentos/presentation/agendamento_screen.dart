import 'package:flutter/material.dart';
import '../../../core/models/agendamento.dart';
import '../../../core/store/agendamentos_store.dart';

class AgendamentosScreen extends StatelessWidget {
  const AgendamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Agendamentos'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Consultas'),
              Tab(text: 'Treinos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _Lista(typeFilter: null),                    // todos
            _Lista(typeFilter: AgType.consulta),         // consultas
            _Lista(typeFilter: AgType.treino),           // treinos
          ],
        ),
      ),
    );
  }
}

class _Lista extends StatelessWidget {
  final AgType? typeFilter;
  const _Lista({this.typeFilter});

  @override
  Widget build(BuildContext context) {
    final store = AgStore.instance;

    return ValueListenableBuilder<List<Agendamento>>(
      valueListenable: store.agendamentos,
      builder: (_, items, __) {
        final data = typeFilter == null
            ? items
            : items.where((e) => e.type == typeFilter).toList();

        if (data.isEmpty) {
          return const Center(
            child: Text('Nenhum agendamento ainda.'),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: data.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) {
            final a = data[i];
            final color = colorFor(a.type);
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: const Color(0xFF1A1A1A),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(iconFor(a.type), color: color),
              ),
              title: Text(a.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                '${a.local} • ${formatDateShort(a.dataHora)}',
                style: const TextStyle(color: Colors.white60),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // espaço pra futuro detalhe/edição
              },
            );
          },
        );
      },
    );
  }
}
