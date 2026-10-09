import 'package:flutter/material.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../data/communication_evidence_database.dart';
import '../widgets/common/communication_evidence_card.dart';

/// Short original lessons that introduce the catalog's interpretation method.
class CommunicationGuideScreen extends StatelessWidget {
  const CommunicationGuideScreen({super.key});

  static const lessons = <({
    String title,
    String body,
    String exercise,
    String illustration,
  })>[
    (
      title: '1. Describe antes de interpretar',
      body:
          'Una observación dice qué ocurrió: «miró hacia la puerta dos veces». '
          'Una interpretación propone un motivo: «quiere irse». Puedes observar '
          'la primera sin conocer la segunda. Separa ambas para evitar convertir '
          'una impresión en un hecho sobre la persona.',
      exercise: 'Prueba: cambia «está enfadada» por una descripción concreta '
          'de lo que viste u oíste. Después escribe dos explicaciones posibles.',
      illustration: 'context_mirada_notas',
    ),
    (
      title: '2. Busca información que falta',
      body: 'El lugar, la tarea, el momento y el canal cambian lo que puedes '
          'observar. Una voz alta junto a una máquina y esa misma voz en una '
          'biblioteca no tienen el mismo contexto. Varias señales juntas '
          'pueden orientar una pregunta, pero no convierten una sospecha en certeza.',
      exercise: 'Prueba: antes de interpretar una pausa, comprueba si la '
          'persona está leyendo, si hay retraso de audio o si necesita tiempo.',
      illustration: 'context_revisar_documento',
    ),
    (
      title: '3. Comprueba con una pregunta abierta',
      body: 'Pregunta por la necesidad o la tarea sin imponer una emoción: '
          '«¿Qué parte conviene revisar?» permite respuestas que «¿Por qué '
          'estás molesto?» ya da por supuestas. Deja espacio para que la '
          'persona corrija tu impresión, incluso si no coincide con lo que esperabas.',
      exercise: 'Prueba: sustituye «no te gusta mi idea» por «¿cómo ves esta '
          'opción y qué cambiarías?». Escucha antes de defender tu propuesta.',
      illustration: 'context_pausa_conversacion',
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
      illustration: 'context_ruido_cafeteria',
    ),
    (
      title: '5. Adapta el intercambio entre ambas partes',
      body: 'No todas las personas comunican atención de la misma manera. '
          'Preguntar qué formato sirve permite acordar notas, pausas, texto o '
          'audio. No hace falta exigir contacto visual, quietud o una sonrisa '
          'para escuchar una respuesta. Ajustar el intercambio es una tarea compartida.',
      exercise: 'Prueba: ofrece dos formatos concretos: «¿prefieres que '
          'lo conversemos ahora o que te envíe los pasos por escrito?».',
      illustration: 'context_movimiento_escucha',
    ),
    (
      title: '6. Aclara las expectativas digitales',
      body: 'El chat deja fuera la voz y buena parte del entorno. La longitud '
          'de un mensaje y el indicador de lectura no explican por sí solos '
          'una intención. Define la pregunta, el plazo y el canal. Una urgencia '
          'necesita un acuerdo de atención, no solo más signos de exclamación.',
      exercise: 'Prueba: escribe «¿puedes confirmar la opción A o B antes '
          'de las 15:00 de mañana?» en lugar de «¿lo viste?».',
      illustration: 'context_chat_remoto',
    ),
    (
      title: '7. Repara una interpretación equivocada',
      body: 'Si atribuiste una intención que la otra persona niega, puedes '
          'revisarla: «interpreté tu silencio como desacuerdo; gracias por '
          'aclararlo». Describe el efecto concreto y acuerda el siguiente paso. '
          'No necesitas ganar una discusión sobre lo que su cara supuestamente reveló.',
      exercise: 'Prueba: completa «supuse…, ahora entiendo…, propongo…». '
          'Comprueba que tu propuesta también le sirva a la otra persona.',
      illustration: 'context_acceso_espacio',
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
      illustration: 'context_tarea_compartida',
    ),
    (
      title: '9. El camuflaje depende del contexto',
      body:
          'Camuflarse es ocultar o cambiar algunas formas de actuar para encajar. '
          'En un video, @aspierd habla de camuflarse en el trabajo y ser más uno '
          'mismo en casa. El subtítulo automático llama a esto «doble vida mental». '
          'Es la idea de ese video; no todas las personas lo viven igual. Los '
          'estudios también muestran experiencias distintas. No puedes saber por '
          'una mirada si alguien se camufla, por qué lo hace o cómo se siente. '
          'Ofrece opciones para hablar y respeta si no quiere explicar su experiencia.',
      exercise:
          'Prueba: en vez de pedir que te mire, pregunta: «¿prefieres que te lo '
          'escriba, te dé tiempo o sigamos hablando?». Acepta su elección.',
      illustration: 'context_movimiento_escucha',
    ),
    (
      title: '10. «No verbal» no significa «no habla»',
      body:
          'En Gestura, «comunicación no verbal» se refiere a señales como los '
          'gestos, la mirada, la postura o el tono. No significa que la persona '
          'no use palabras. Un estudio cualitativo de 2025 analizó 27 conversaciones '
          'de un foro público de adultos autistas. Allí aparecieron experiencias distintas: '
          'a algunas personas les cuesta más tiempo interpretar o usar estas '
          'señales; los malentendidos pueden ocurrir en ambas direcciones; y las '
          'personas usan estrategias diferentes. El estudio describe a quienes '
          'participaron en ese foro: no representa a todas las personas autistas '
          'ni demuestra que un gesto tenga un significado fijo. El «problema de la '
          'doble empatía», propuesto por Damian Milton en 2012, es un marco teórico '
          'sobre dificultades de comprensión mutua, especialmente entre personas '
          'autistas y no autistas. Invita a considerar ambas perspectivas. No '
          'explica automáticamente todo malentendido ni permite asignar culpa '
          'o evaluar la empatía de una persona por sus gestos.',
      exercise:
          'Prueba: si una señal no te queda clara, describe lo que observaste y '
          'pregunta qué quiso comunicar. También puedes dar tiempo, escribir o '
          'aclarar lo que tú querías decir.',
      illustration: 'context_pausa_conversacion',
    ),
    (
      title: '11. Una experiencia real puede mostrar una barrera',
      body:
          'En un estudio internacional de 1.248 adultos autistas sobre atención '
          'médica, muchas respuestas describieron barreras de comunicación, '
          'ambientes sensorialmente difíciles y problemas para saber qué iba a '
          'pasar. El equipo investigador, que incluía personas autistas, agrupó '
          'los relatos en temas. Estos resultados ayudan a ver problemas posibles; '
          'no dicen que todas las personas tengan la misma experiencia. En una '
          'consulta, una persona puede llevar sus preguntas por escrito, pedir '
          'que expliquen el siguiente paso o consultar si hay un espacio más '
          'tranquilo. Pregunta qué le sirve a esa persona.',
      exercise:
          'Prueba: antes de una reunión o consulta, ofrece opciones concretas: '
          '«¿Te sirve que te envíe las preguntas antes, que hagamos una pausa o '
          'que resumamos los acuerdos por escrito?»',
      illustration: 'context_ruido_cafeteria',
    ),
    (
      title: '12. Aclara la parte que falta',
      body: 'Si entendiste el lugar pero no la fecha, pregunta por la fecha: '
          '«¿Dijiste jueves o viernes?». Si no entendiste el mensaje completo, '
          'puedes pedir una repetición. También puedes proponer lo que entendiste: '
          '«¿Quieres que envíe el borrador, no la versión final?». La otra persona '
          'puede corregirlo. Elige el canal y el tiempo que sirvan a ambos.',
      exercise: 'Prueba: ante «nos vemos allí la próxima semana», escribe '
          'qué dato falta y una pregunta que lo aclare. No supongas una emoción '
          'para resolver un problema de fecha o lugar.',
      illustration: 'context_aclarar_fecha',
    ),
    (
      title: '13. Comprueba el plan con palabras propias',
      body: '«¿Entendiste?» puede recibir un sí y dejar detalles pendientes. '
          'Puedes ofrecer revisar juntos el siguiente paso: «Para comprobar '
          'si lo expliqué bien, ¿cómo lo haríamos?». Si las versiones difieren, '
          'ajusta la explicación. No es un examen de la otra persona: permite '
          'texto, una demostración, tiempo o que prefiera otro modo de revisar.',
      exercise: 'Prueba: explicaste «enviar un borrador el jueves y revisarlo '
          'el viernes». Si tu colega entendió «enviar la versión final el jueves», '
          '¿cómo aclararías la diferencia y confirmarías el acuerdo?',
      illustration: 'context_revisar_documento',
    ),
    (
      title: '14. Usa gestos para aportar información',
      body: 'Señalar una caja, representar un tamaño con las manos o acompañar '
          'un paso del diagrama puede aportar información. Algunos gestos tienen '
          'un sentido aprendido en una comunidad; confirma las convenciones si '
          'no las conoces. Comprueba que la otra persona pueda percibir el gesto '
          'y ofrece una descripción o etiqueta cuando sea útil.',
      exercise: 'Prueba: hay tres cajas y dices «mueve esta». Añade un gesto '
          'y una descripción que identifiquen la misma caja. Después piensa '
          'cómo lo aclararías si la otra persona no puede verla.',
      illustration: 'context_aclarar_fecha',
    ),
  ];

  static const lessonEvidence = <String, CommunicationEvidence>{
    '12. Aclara la parte que falta': CommunicationEvidenceDatabase.repair,
    '13. Comprueba el plan con palabras propias':
        CommunicationEvidenceDatabase.checkingUnderstanding,
    '14. Usa gestos para aportar información':
        CommunicationEvidenceDatabase.gestureFunctions,
  };

  static const sources = <({String title, String url})>[
    (
      title:
          'Dingemanse et al. · Aclaraciones en conversaciones de 12 idiomas (2015)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/26375483/'
    ),
    (
      title: 'AHRQ · Comprobar comprensión con palabras propias',
      url:
          'https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/teachback.html'
    ),
    (
      title: 'Abner et al. · Funciones de los gestos y variación (2015)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/26807141/'
    ),
    (
      title: 'Cheang y Pell · Rasgos acústicos del sarcasmo en inglés (2008)',
      url: 'https://www.mcgill.ca/pell_lab/files/pell_lab/cheang__pell_2008.pdf'
    ),
    (
      title: 'Dargue et al. · Gestos y comprensión: metaanálisis (2019)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/31219263/'
    ),
    (
      title: 'Gurney et al. · Ropa, postura e impresiones (2017)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/27381170/'
    ),
    (
      title: 'Jung et al. · Postura con piernas cruzadas (2020)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/32605016/'
    ),
    (
      title: 'Winn y Teece · Ritmo y esfuerzo de escucha (2021)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/33002968/'
    ),
    (
      title: 'Summers · Iluminación y trabajo con pantallas (1989)',
      url: 'https://www.sciencedirect.com/science/article/pii/S0004951414604955'
    ),
    (
      title: 'Belyk y McGettigan · Risa espontánea y voluntaria (2022)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/36126659/'
    ),
    (
      title: 'Balban et al. · Práctica respiratoria y estado de ánimo (2023)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/36630953/'
    ),
    (
      title: 'Revisión de intervenciones breves para ansiedad (2024)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/38933581/'
    ),
    (
      title:
          'Girard et al. · Sonrisa, ojos y emoción: estudios y límites (2021)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/34337430/'
    ),
    (
      title: 'Bryant y Fox Tree · Voz y contexto en la ironía (2005)',
      url: 'https://journals.sagepub.com/doi/10.1177/00238309050480030101'
    ),
    (
      title: 'Milton · Doble empatía: propuesta teórica (2012)',
      url: 'https://kar.kent.ac.uk/62639/'
    ),
    (
      title: 'Barrett et al. · Revisión sobre expresiones faciales (2019)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/31313636/'
    ),
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
    (
      title:
          '@aspierd · Video sobre cuatro posturas ante el camuflaje (2026; subtítulos automáticos)',
      url: 'https://www.tiktok.com/@aspierd/video/7606046043490225424'
    ),
    (
      title: 'Zhuang et al. · Revisión de 58 estudios sobre camuflaje (2023)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/37741059/'
    ),
    (
      title:
          'Radford et al. · Experiencias no verbales de adultos autistas (2025)',
      url: 'https://pubmed.ncbi.nlm.nih.gov/40644444/'
    ),
    (
      title:
          'Shaw et al. · Relatos de adultos autistas sobre atención médica (2024)',
      url: 'https://pmc.ncbi.nlm.nih.gov/articles/PMC11191657/'
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
              const Text('Lecciones y ejercicios para llevar el aprendizaje a '
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
                      const SizedBox(height: 14),
                      ConoVeIllustration(
                        illustrationKey: lesson.illustration,
                        width: double.infinity,
                        height: 220,
                        enableHoldPreview: false,
                      ),
                      const SizedBox(height: 12),
                      Text(lesson.exercise,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      if (lessonEvidence[lesson.title]
                          case final evidence?) ...[
                        const SizedBox(height: 16),
                        CommunicationEvidenceCard(evidence: evidence),
                      ],
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
