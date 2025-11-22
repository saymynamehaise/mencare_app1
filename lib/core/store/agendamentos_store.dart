import 'package:flutter/foundation.dart';
import 'package:mencare_app1/core/models/agendamento.dart';

class AgStore {
  AgStore._();
  static final AgStore instance = AgStore._();

  final ValueNotifier<List<Agendamento>> agendamentos =
      ValueNotifier<List<Agendamento>>([]);

  void add(Agendamento a) {
    final list = List<Agendamento>.from(agendamentos.value)..add(a);
    list.sort((a, b) => a.dataHora.compareTo(b.dataHora));
    agendamentos.value = list;
  }

  List<Agendamento> byType(AgType t) =>
      agendamentos.value.where((e) => e.type == t).toList();
}
