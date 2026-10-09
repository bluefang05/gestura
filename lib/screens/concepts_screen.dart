import 'package:flutter/material.dart';
import '../data/concepts_database.dart';
import '../core/services/tts_service.dart';

class ConceptsScreen extends StatefulWidget {
  final List<LearningConcept>? concepts;
  final VoidCallback? onStart;
  const ConceptsScreen({super.key, this.concepts, this.onStart});
  @override
  State<ConceptsScreen> createState() => _ConceptsScreenState();
}

class _ConceptsScreenState extends State<ConceptsScreen> {
  String _search = '';
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    TtsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = (widget.concepts ?? ConceptsDatabase.all)
        .where((c) => c.matchesSearch(_search));
    return Scaffold(
      appBar: AppBar(
          title: Text(
              widget.onStart == null ? 'Conceptos' : 'Antes de practicar')),
      bottomNavigationBar: widget.onStart == null
          ? null
          : SafeArea(
              child: Padding(
              padding: const EdgeInsets.all(12),
              child: FilledButton(
                  onPressed: () {
                    TtsService.stop();
                    widget.onStart!();
                  },
                  child: const Text('Empezar preguntas')),
            )),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text(
            'Aprende qué significan las palabras. Puedes volver a consultarlas durante las preguntas.'),
        const SizedBox(height: 12),
        TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Buscar un concepto',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _search.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Limpiar búsqueda',
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _search = '');
                        },
                      )),
            onChanged: (value) =>
                setState(() => _search = value.trim().toLowerCase())),
        const SizedBox(height: 12),
        if (items.isEmpty)
          const Text(
              'No encontramos ese concepto. Prueba con otra palabra o limpia la búsqueda.'),
        for (final concept in items)
          Card(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                              child: Text(concept.title,
                                  style:
                                      Theme.of(context).textTheme.titleLarge)),
                          IconButton(
                              tooltip: 'Escuchar: ${concept.title}',
                              onPressed: () => TtsService.speakSpanish(
                                  '${concept.title}. ${concept.explanation}',
                                  gestureId: concept.title),
                              icon: const Icon(Icons.volume_up_outlined)),
                        ]),
                        Text(concept.explanation),
                      ]))),
        TextButton.icon(
            onPressed: TtsService.stop,
            icon: const Icon(Icons.stop),
            label: const Text('Detener lectura')),
        if (widget.onStart != null) ...[
          const Text(
              'Si fallas una pregunta, volverá al final. Terminas cuando hayas acertado todas. Puedes salir antes; el tema quedará pendiente.'),
          const SizedBox(height: 12),
        ],
      ]),
    );
  }
}
