import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/info_box.dart';
import '../../../../shared/controllers/theme_controller.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeController>().isDark;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 34,
                backgroundColor: Color(0xFF2F8A8A),
                child: Icon(Icons.person, size: 36, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Adam Cleiton',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('São Paulo, SP', style: TextStyle(color: Colors.white54)),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InfoBox(label: 'Peso Atual', value: '78kg'),
              InfoBox(label: 'Altura', value: '1.80m'),
              InfoBox(label: 'IMC', value: '24.1'),
            ],
          ),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: theme.colorScheme.primary,
            ),
            title: const Text('Tema escuro'),
            trailing: Switch(
              value: isDark,
              onChanged: (_) => context.read<ThemeController>().toggle(),
            ),
          ),
        ],
      ),
    );
  }
}
