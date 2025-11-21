class Agendamento {
  final String id;
  final String titulo;
  final String profissionalOuLocal;
  final DateTime dataHora;
  final String status; // "Confirmado", "Pendente", etc.

  Agendamento({
    required this.id,
    required this.titulo,
    required this.profissionalOuLocal,
    required this.dataHora,
    required this.status,
  });

  factory Agendamento.fromJson(Map<String, dynamic> json) {
    return Agendamento(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      profissionalOuLocal: json['profissionalOuLocal'] as String,
      dataHora: DateTime.parse(json['dataHora'] as String),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'profissionalOuLocal': profissionalOuLocal,
        'dataHora': dataHora.toIso8601String(),
        'status': status,
      };
}
