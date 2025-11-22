import 'package:flutter/material.dart';
import 'package:mencare_app1/core/models/agendamento.dart';
import 'package:mencare_app1/core/store/agendamentos_store.dart';

class CreateAgendamentoScreen extends StatefulWidget {
  final AgType initialType;

  const CreateAgendamentoScreen({super.key, required this.initialType});

  @override
  State<CreateAgendamentoScreen> createState() => _CreateAgendamentoScreenState();
}

class _CreateAgendamentoScreenState extends State<CreateAgendamentoScreen> {
  final _formKey = GlobalKey<FormState>();
  late AgType _type;
  final _tituloCtrl = TextEditingController();
  final _localCtrl  = TextEditingController();

  DateTime? _data;
  TimeOfDay? _hora;

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
  }

  @override
  void dispose() {
    _tituloCtrl.dispose();
    _localCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (date != null) setState(() => _data = date);
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (time != null) setState(() => _hora = time);
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    if (_data == null || _hora == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione data e hora')),
      );
      return;
    }

    final dateTime = DateTime(
      _data!.year, _data!.month, _data!.day, _hora!.hour, _hora!.minute,
    );

    final novo = Agendamento(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: _type,
      titulo: _tituloCtrl.text.trim(),
      local: _localCtrl.text.trim(),
      dataHora: dateTime,
    );

    AgStore.instance.add(novo);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Novo agendamento')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<AgType>(
              value: _type,
              items: const [
                DropdownMenuItem(value: AgType.consulta, child: Text('Consulta')),
                DropdownMenuItem(value: AgType.treino,   child: Text('Treino')),
              ],
              onChanged: (v) => setState(() => _type = v ?? _type),
              decoration: _dec('Tipo'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _tituloCtrl,
              decoration: _dec('Título'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe o título' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _localCtrl,
              decoration: _dec('Local'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe o local' : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _pickDate,
                    child: Text(_data == null
                        ? 'Escolher data'
                        : '${two(_data!.day)}/${two(_data!.month)}/${_data!.year}'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _pickTime,
                    child: Text(_hora == null
                        ? 'Escolher hora'
                        : '${two(_hora!.hour)}:${two(_hora!.minute)}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _save,
                child: const Text('Salvar', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // <-- AQUI ESTAVA O PROBLEMA: remover o `const`
  InputDecoration _dec(String label) => InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      );
}
