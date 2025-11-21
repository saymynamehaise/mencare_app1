import 'dart:async';
import '../domain/agendamento.dart';

/// Contrato para quando você plugar um backend real.
abstract class IAgendamentoService {
  Future<List<Agendamento>> fetchAll();
}

/// Implementação fake (mock) para testes locais.
class MockAgendamentoService implements IAgendamentoService {
  @override
  Future<List<Agendamento>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Agendamento(
        id: '1',
        titulo: 'Consulta Médica',
        profissionalOuLocal: 'Dr. Carlos Silva',
        dataHora: DateTime(2025, 11, 15, 14, 30),
        status: 'Confirmado',
      ),
      Agendamento(
        id: '2',
        titulo: 'Treino Funcional',
        profissionalOuLocal: 'Academia FitPro',
        dataHora: DateTime(2025, 11, 16, 7, 0),
        status: 'Confirmado',
      ),
      Agendamento(
        id: '3',
        titulo: 'Check-up Cardiológico',
        profissionalOuLocal: 'Dra. Ana Costa',
        dataHora: DateTime(2025, 11, 18, 10, 15),
        status: 'Pendente',
      ),
      Agendamento(
        id: '4',
        titulo: 'Consulta Odontológica',
        profissionalOuLocal: 'Dr. Pedro Lima',
        dataHora: DateTime(2025, 11, 20, 16, 0),
        status: 'Confirmado',
      ),
    ];
  }
}
