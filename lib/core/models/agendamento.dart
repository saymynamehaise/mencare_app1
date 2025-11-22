import 'package:flutter/material.dart';

enum AgType { consulta, treino }

class Agendamento {
  final String id;
  final AgType type;
  final String titulo;
  final String local;
  final DateTime dataHora;

  Agendamento({
    required this.id,
    required this.type,
    required this.titulo,
    required this.local,
    required this.dataHora,
  });
}

String two(int n) => n.toString().padLeft(2, '0');
String formatDateShort(DateTime d) =>
    '${two(d.day)}/${two(d.month)} ${two(d.hour)}:${two(d.minute)}';

IconData iconFor(AgType t) =>
    t == AgType.consulta ? Icons.local_hospital : Icons.fitness_center;

Color colorFor(AgType t) =>
    t == AgType.consulta ? const Color(0xFF2F8A8A) : const Color(0xFF6B8A2F);
