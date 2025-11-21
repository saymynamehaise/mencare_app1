import 'package:flutter/material.dart';
import '../../../../shared/widgets/info_box.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 34,
                backgroundColor: Color(0xFF2F8A8A),
                child: Icon(Icons.person, size: 36, color: Colors.white),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Adam Cleiton', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('São Paulo, SP', style: TextStyle(color: Colors.white54)),
                ],
              ),
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
        ],
      ),
    );
  }
}
