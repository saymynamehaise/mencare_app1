import 'package:flutter/material.dart';

// Imports por pacote — não quebram com mudança de pasta
import 'package:mencare_app1/features/home/presentation/home_screen.dart';
import 'package:mencare_app1/features/agendamentos/presentation/agendamentos_screen.dart';
import 'package:mencare_app1/features/agendamentos/treinos/presentation/treinos_screen.dart';
import 'package:mencare_app1/features/agendamentos/perfil/presentation/perfil_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  // Não-const para evitar "non_constant_list_element"
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const AgendamentosScreen(),
    const TreinosScreen(),
    const PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF121212),
        indicatorColor:
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: 'Agendamentos'),
          NavigationDestination(
              icon: Icon(Icons.fitness_center), label: 'Treinos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
