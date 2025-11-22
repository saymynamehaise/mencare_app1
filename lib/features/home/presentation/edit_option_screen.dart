import 'package:flutter/material.dart';

class EditOptionScreen extends StatefulWidget {
  final String header;   // Ex.: "Agendar Consulta"
  final String title;    // valor atual
  final String subtitle; // valor atual

  const EditOptionScreen({
    super.key,
    required this.header,
    required this.title,
    required this.subtitle,
  });

  @override
  State<EditOptionScreen> createState() => _EditOptionScreenState();
}

class _EditOptionScreenState extends State<EditOptionScreen> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _subtitleCtrl;

  @override
  void initState() {
    super.initState();
    _titleCtrl = TextEditingController(text: widget.title);
    _subtitleCtrl = TextEditingController(text: widget.subtitle);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _subtitleCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final title = _titleCtrl.text.trim();
    final subtitle = _subtitleCtrl.text.trim();
    Navigator.pop<Map<String, String>>(context, {
      'title': title.isEmpty ? widget.title : title,
      'subtitle': subtitle.isEmpty ? widget.subtitle : subtitle,
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar • ${widget.header}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Ajuste os textos exibidos no card:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _titleCtrl,
            decoration: const InputDecoration(
              labelText: 'Título',
              filled: true,
              fillColor: Color(0xFF1A1A1A),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _subtitleCtrl,
            decoration: const InputDecoration(
              labelText: 'Subtítulo',
              filled: true,
              fillColor: Color(0xFF1A1A1A),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            style: const TextStyle(color: Colors.white),
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
              child: const Text(
                'Salvar alterações',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
