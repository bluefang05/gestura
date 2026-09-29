import 'package:flutter/material.dart';

/// Short original lessons that introduce the catalog's interpretation method.
class CommunicationGuideScreen extends StatelessWidget {
  const CommunicationGuideScreen({super.key});

  static const lessons = <({String title, String body, String exercise})>[
    (
      title: '1. Describe antes de interpretar',
      body:
          'Una observación dice qué ocurrió: «miró hacia la puerta dos veces». '
          'Una interpretación propone un motivo: «quiere irse». Puedes observar '
          'la primera sin conocer la segunda. Separa ambas para evitar convertir '
          'una impresión en un hecho sobre la persona.',
      exercise: 'Prueba: cambia «está enfadada» por una descripción concreta '
          'de lo que viste u oíste. Después escribe dos explicaciones posibles.',
    ),
    (
      title: '2. Busca información que falta',
      body: 'El lugar, la tarea, el momento y el canal cambian lo que puedes '
          'observar. Una voz alta junto a una máquina y esa misma voz en una '
          'biblioteca no tienen el mismo contexto. Varias señales juntas '
          'pueden orientar una pregunta, pero no convierten una sospecha en certeza.',
      exercise: 'Prueba: antes de interpretar una pausa, comprueba si la '
          'persona está leyendo, si hay retraso de audio o si necesita tiempo.',
    ),
    (
      title: '3. Comprueba con una pregunta abierta',
      body: 'Pregunta por la necesidad o la tarea sin imponer una emoción: '
          '«¿Qué parte conviene revisar?» permite respuestas que «¿Por qué '
          'estás molesto?» ya da por supuestas. Deja espacio para que la '
          'persona corrija tu impresión, incluso si no coincide con lo que esperabas.',
      exercise: 'Prueba: sustituye «no te gusta mi idea» por «¿cómo ves esta '
          'opción y qué cambiarías?». Escucha antes de defender tu propuesta.',
    ),
    (
      title: '4. Escuchar, comprender y aceptar son distintos',
      body:
          'Una persona puede seguir una explicación sin entender cada detalle '
          'y comprender una propuesta sin aceptarla. Un asentimiento, una sonrisa '
          'o una reacción digital pueden dejar sin resolver una decisión. '
          'Cuando haya una acción pendiente, concreta qué se ha acordado.',
      exercise:
          'Prueba: antes de reservar una fecha, pregunta cuál se confirma. '
          'Si no hay respuesta clara, deja la reserva pendiente de confirmación.',
    ),
    (
      title: '5. Adapta el intercambio entre ambas partes',
      body: 'No todas las personas comunican atención de la misma manera. '
          'Preguntar qué formato sirve permite acordar notas, pausas, texto o '
          'audio. No hace falta exigir contacto visual, quietud o una sonrisa '
          'para escuchar una respuesta. Ajustar el intercambio es una tarea compartida.',
      exercise: 'Prueba: ofrece dos formatos concretos: «¿prefieres que '
          'lo conversemos ahora o que te envíe los pasos por escrito?».',
    ),
    (
      title: '6. Aclara las expectativas digitales',
      body: 'El chat deja fuera la voz y buena parte del entorno. La longitud '
          'de un mensaje y el indicador de lectura no explican por sí solos '
          'una intención. Define la pregunta, el plazo y el canal. Una urgencia '
          'necesita un acuerdo de atención, no solo más signos de exclamación.',
      exercise: 'Prueba: escribe «¿puedes confirmar la opción A o B antes '
          'de las 15:00 de mañana?» en lugar de «¿lo viste?».',
    ),
    (
      title: '7. Repara una interpretación equivocada',
      body: 'Si atribuiste una intención que la otra persona niega, puedes '
          'revisarla: «interpreté tu silencio como desacuerdo; gracias por '
          'aclararlo». Describe el efecto concreto y acuerda el siguiente paso. '
          'No necesitas ganar una discusión sobre lo que su cara supuestamente reveló.',
      exercise: 'Prueba: completa «supuse…, ahora entiendo…, propongo…». '
          'Comprueba que tu propuesta también le sirva a la otra persona.',
    ),
    (
      title: '8. Practica sin convertirlo en una prueba de personas',
      body: 'Los escenarios son ejemplos ficticios para ensayar respuestas. '
          'Sus opciones recomendadas se basan en la información escrita, no '
          'en descubrir pensamientos ocultos. Las ilustraciones son orientativas. '
          'Usa el manual para formular mejores preguntas y acuerdos, no para '
          'diagnosticar, detectar mentiras o clasificar a alguien por su apariencia.',
      exercise: 'Prueba: al terminar un escenario, explica qué dato cambiaría '
          'tu decisión. Eso muestra que puedes revisar tu interpretación.',
    ),
  ];

  static const sources = <({String title, String url})>[
    (
      title: 'APA · Expresiones faciales y contexto',
      url: 'https://www.apa.org/monitor/2020/10/behind-smile'
    ),
    (
      title: 'National Autistic Society · Comunicación',
      url:
          'https://www.autism.org.uk/advice-and-guidance/about-autism/autism-and-communication'
    ),
    (
      title: 'NIDCD · Entorno y barreras de comunicación',
      url:
          'https://www.nidcd.nih.gov/about/nidcd-director-message/cloth-face-coverings-and-distancing-pose-communication-challenges-many'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cómo interpretar señales')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Observa, pregunta y ajusta',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              const Text('Ocho lecciones breves para llevar el aprendizaje a '
                  'conversaciones reales. Abre una lección y prueba su ejercicio.'),
              const SizedBox(height: 16),
              for (final lesson in lessons)
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    key: PageStorageKey(lesson.title),
                    title: Text(lesson.title),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    children: [
                      Text(lesson.body),
                      const SizedBox(height: 12),
                      Text(lesson.exercise,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
              Text('Para profundizar',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              const Text('Referencias sobre los principios de comunicación. '
                  'Los ejercicios y diálogos de Gestura son ejemplos originales, '
                  'no pruebas diagnósticas. Puedes copiar estas direcciones para consultarlas.'),
              for (final source in sources)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(source.title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      SelectableText(source.url),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
