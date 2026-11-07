import 'package:flutter/material.dart';
import '../data/concepts_database.dart';
import '../core/services/tts_service.dart';
import '../core/services/storage_service.dart';
import '../widgets/common/tts_app_bar_control.dart';

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
  final _scrollController = ScrollController();

  void _readConcepts() {
    final items = (widget.concepts ?? ConceptsDatabase.all)
        .where((c) => c.matchesSearch(_search));
    TtsService.speakSpanish(
        items.map((c) => '${c.title}. ${c.explanation}').join('\n\n'),
        gestureId: 'concepts');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          StorageService.getAutoNarration() &&
          ModalRoute.of(context)?.isCurrent == true) {
        _readConcepts();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    final speakingId = TtsService.currentSpeakingIdNotifier.value;
    if (speakingId == 'concepts' ||
        (widget.concepts ?? ConceptsDatabase.all)
            .any((concept) => concept.title == speakingId)) {
      TtsService.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = (widget.concepts ?? ConceptsDatabase.all)
        .where((c) => c.matchesSearch(_search));
    return Scaffold(
      appBar: AppBar(
          actions: [TtsAppBarControl(onPlay: _readConcepts)],
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
      body: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
                'Consulta definiciones y ejemplos. Durante la práctica también puedes abrirlos cuando los necesites.'),
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
                              TtsService.stop();
                              _scrollController.jumpTo(0);
                              setState(() => _search = '');
                            },
                          )),
                onChanged: (value) {
                  TtsService.stop();
                  _scrollController.jumpTo(0);
                  setState(() => _search = value.trim().toLowerCase());
                }),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge)),
                              IconButton(
                                  tooltip: 'Escuchar: ${concept.title}',
                                  onPressed: () => TtsService.speakSpanish(
                                      '${concept.title}. ${concept.explanation}',
                                      gestureId: concept.title),
                                  icon: const Icon(Icons.volume_up_outlined)),
                            ]),
                            Text(concept.explanation),
                          ]))),
            if (widget.onStart != null) ...[
              const Text(
                  'Las preguntas pendientes se repasan al final. La práctica se completa al resolverlas todas; puedes salir y retomarla después.'),
              const SizedBox(height: 12),
            ],
          ]),
    );
  }
}
