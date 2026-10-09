/// Findings are scoped to the cited study; practical uses are editorial options.
class CommunicationEvidence {
  final String finding;
  final String sourceKind;
  final String limits;
  final String practicalUse;
  final String sourceTitle;
  final String sourceUrl;
  final List<String> additionalSourceUrls;

  const CommunicationEvidence({
    required this.finding,
    this.sourceKind = 'Estudio empírico',
    required this.limits,
    required this.practicalUse,
    required this.sourceTitle,
    required this.sourceUrl,
    this.additionalSourceUrls = const [],
  });

  String get spokenSummary =>
      'Tipo de fuente: $sourceKind. Qué aporta la fuente: $finding Alcance: $limits '
      'Una aplicación posible: $practicalUse Fuente: $sourceTitle.';
}

class CommunicationEvidenceDatabase {
  static const repair = CommunicationEvidence(
    finding: 'Un análisis de conversaciones en 12 idiomas identificó formas '
        'compartidas de resolver mensajes poco claros: pedir una repetición, '
        'preguntar por una parte o proponer una interpretación para confirmarla.',
    limits: 'El estudio describe conversaciones y elecciones de los '
        'participantes. No prueba que una frase concreta resuelva todos los '
        'malentendidos ni obliga a responder inmediatamente.',
    practicalUse: 'Si solo falta la fecha, pregunta por la fecha. Por ejemplo: '
        '«¿Dijiste jueves o viernes?». Si no sabes qué parte falló, puedes '
        'pedir que repitan o usar otro canal.',
    sourceTitle: 'Dingemanse et al. · Reparación de la comunicación (2015)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/26375483/',
  );

  static const checkingUnderstanding = CommunicationEvidence(
    sourceKind: 'Guía profesional',
    finding: 'La guía de AHRQ describe teach-back: pedir a una persona que '
        'explique con sus propias palabras lo que necesita saber o hacer, '
        'para revisar si la información se explicó con claridad.',
    limits: 'Es una herramienta de comunicación sanitaria, no una prueba '
        'de inteligencia ni una garantía de comprensión. Los ejemplos '
        'cotidianos de Gestura son adaptaciones editoriales.',
    practicalUse: 'Puedes decir: «Para comprobar si lo expliqué bien, '
        '¿cómo entiendes el siguiente paso?». Si falta algo, vuelve a '
        'explicarlo de otra forma y permite texto, tiempo o una demostración.',
    sourceTitle: 'AHRQ · Herramienta Teach-Back',
    sourceUrl:
        'https://www.ahrq.gov/teamstepps-program/curriculum/communication/tools/teachback.html',
  );

  static const gestureFunctions = CommunicationEvidence(
    sourceKind: 'Revisión lingüística',
    finding: 'Una revisión lingüística describe movimientos que representan '
        'información, señalan un referente o tienen un significado aprendido '
        'en una comunidad. El uso y las convenciones varían entre comunidades.',
    limits: 'La forma de una mano no tiene un significado único en todos '
        'los lugares. Tampoco todo movimiento comunica un mensaje dirigido '
        'a alguien. Las lenguas de señas son lenguas con sus propias reglas.',
    practicalUse:
        'Al explicar, señala el objeto o paso pertinente y acompáñalo '
        'con palabras o una etiqueta si ayuda. Para un gesto convencional '
        'desconocido, pregunta qué significa en ese contexto.',
    sourceTitle: 'Abner et al. · Gesture for Linguists: A Handy Primer (2015)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/26807141/',
  );

  static const smile = CommunicationEvidence(
    finding: 'En dos estudios de 751 sonrisas de 136 participantes, estrechar '
        'los ojos aportó cierta información sobre emoción positiva y más sobre '
        'cómo los observadores percibían esa emoción.',
    limits: 'La relación con la emoción sentida fue poco específica y dependió '
        'del contexto. Percibir alegría y sentirla son resultados distintos; '
        'el estudio no ofrece un detector individual de sinceridad.',
    practicalUse: 'Observa también la intensidad, la duración, las palabras y '
        'la situación. Una sonrisa puede contribuir a tu impresión, mientras '
        'que un acuerdo necesita confirmación.',
    sourceTitle: 'Girard et al. · Sonrisa y emoción (2021)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/34337430/',
  );

  static const sarcasm = CommunicationEvidence(
    finding: 'En frases producidas en inglés para comunicar sarcasmo, se '
        'midieron cambios de voz: un tono más grave y, en algunas condiciones, '
        'menor velocidad y menor variación tonal.',
    limits: 'Se estudiaron grabaciones preparadas y validadas por oyentes. '
        'Las pistas dependen del idioma y del contenido; no equivalen a una '
        'regla para todas las conversaciones.',
    practicalUse: 'Considera un cambio respecto a cómo habla esa persona y '
        'cómo encaja la frase con lo ocurrido. Si la interpretación cambia '
        'lo que vas a hacer, puedes pedir una aclaración.',
    sourceTitle: 'Cheang y Pell · The sound of sarcasm (2008)',
    sourceUrl:
        'https://www.mcgill.ca/pell_lab/files/pell_lab/cheang__pell_2008.pdf',
  );

  static const gestures = CommunicationEvidence(
    sourceKind: 'Metaanálisis',
    finding: 'Un metaanálisis de 83 muestras encontró que producir u observar '
        'gestos junto con el habla mejoró, en promedio, la comprensión frente '
        'al habla sola. El beneficio varió según el gesto y la tarea.',
    limits: 'El resultado trata de comprender información. No mide confianza '
        'por mostrar las palmas ni garantiza que cualquier movimiento ayude.',
    practicalUse: 'Puedes señalar el paso de un diagrama o representar un '
        'tamaño mientras lo explicas. Pregunta si ayuda y ofrece otro formato '
        'si la persona lo prefiere.',
    sourceTitle: 'Dargue et al. · Gestos y comprensión (2019)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/31219263/',
  );

  static const attire = CommunicationEvidence(
    finding: 'En un experimento con fotografías, la ropa formal o informal y '
        'la postura modificaron juicios de profesionalidad, confianza, '
        'accesibilidad y salario probable. Los efectos variaron según el '
        'género del modelo y el tipo de ropa.',
    limits: 'Se midieron impresiones de observadores sobre imágenes, no '
        'competencia real, solvencia ni resultados de una venta.',
    practicalUse: 'La ropa puede influir en una primera impresión. Consulta '
        'las expectativas del evento y comprueba experiencia y condiciones '
        'para evaluar el trabajo de alguien.',
    sourceTitle: 'Gurney et al. · Ropa, postura e impresiones (2017)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/27381170/',
  );

  static const crossedLegs = CommunicationEvidence(
    finding: 'Un estudio con 60 participantes midió cambios en la inclinación '
        'del tronco y la pelvis al cruzar las piernas sentado, frente a '
        'sentarse erguido. Algunos resultados variaron entre participantes '
        'con y sin dolor lumbar.',
    limits: 'Se midieron posiciones y presiones en condiciones concretas. '
        'No se estudiaron intenciones, dominio ni negociación; tampoco '
        'permite atribuir dolor a quien adopta esa postura.',
    practicalUse: 'Considera el asiento y el espacio disponible. Ofrece '
        'cambiar de posición si alguien lo necesita y basa la negociación '
        'en las condiciones que expresa.',
    sourceTitle: 'Jung et al. · Posición del tronco y la pelvis (2020)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/32605016/',
  );

  static const speakingRate = CommunicationEvidence(
    finding: 'En 21 adultos con implante coclear, escuchar frases alargadas '
        'a 1,4 veces su duración original redujo un indicador de esfuerzo '
        'de escucha y mejoró ligeramente el reconocimiento de palabras.',
    limits: 'El estudio utilizó frases modificadas y una población específica. '
        'No establece una velocidad ideal para todos ni mide credibilidad.',
    practicalUse: 'Si cuesta seguir la explicación, puedes ofrecer bajar '
        'el ritmo, hacer pausas o escribir los puntos. Comprueba qué opción '
        'le sirve a quien escucha.',
    sourceTitle: 'Winn y Teece · Ritmo y esfuerzo de escucha (2021)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/33002968/',
  );

  static const lighting = CommunicationEvidence(
    sourceKind: 'Revisión',
    finding: 'Una revisión sobre trabajo con pantallas identifica factores '
        'útiles para ver: una imagen clara, reflejos y deslumbramiento '
        'controlados, y luz ambiental adecuada a la tarea.',
    limits: 'Las necesidades varían entre tareas y personas. La revisión '
        'no demuestra que un color de luz produzca confianza o cierre acuerdos.',
    practicalUse: 'Comprueba si se pueden leer los documentos y la pantalla '
        'sin reflejos molestos. Ajusta la luz con las personas presentes.',
    sourceTitle: 'Summers · Iluminación de oficinas: revisión (1989)',
    sourceUrl:
        'https://www.sciencedirect.com/science/article/pii/S0004951414604955',
  );

  static const laughter = CommunicationEvidence(
    finding: 'La investigación distingue risa espontánea y risa producida '
        'voluntariamente. Un estudio mediante resonancia observó diferencias '
        'en la forma del tracto vocal entre ambas.',
    limits: 'Ese estudio incluyó cinco adultos. Sus mediciones internas '
        'no son una lista de rasgos faciales para reconocer nerviosismo. '
        'Reír voluntariamente tampoco significa mentir.',
    practicalUse: 'La risa puede participar en el intercambio social. '
        'Si importa saber cómo cayó un comentario, pregunta por el comentario '
        'en vez de decidirlo por los ojos o la mandíbula.',
    sourceTitle: 'Belyk y McGettigan · Producción de la risa (2022)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/36126659/',
  );

  static const breathing = CommunicationEvidence(
    sourceKind: 'Ensayo y revisión',
    finding: 'Un ensayo aleatorizado comparó prácticas de respiración y '
        'meditación de cinco minutos diarios durante un mes. Encontró '
        'mejoras del estado de ánimo, con ventajas de algunas prácticas '
        'de respiración en emoción positiva.',
    limits: 'Esto no demuestra que respirar dos segundos recupere una idea '
        'olvidada. Una revisión de intervenciones breves encontró resultados '
        'variables para respiración según la técnica.',
    practicalUse: 'Una pausa puede darte tiempo para elegir cómo seguir. '
        'Puedes respirar de forma cómoda si te sirve, pedir que repitan '
        'la pregunta o usar notas; no hace falta forzar una técnica.',
    sourceTitle:
        'Balban et al. (2023); revisión de intervenciones breves (2024)',
    sourceUrl: 'https://pubmed.ncbi.nlm.nih.gov/36630953/',
    additionalSourceUrls: ['https://pubmed.ncbi.nlm.nih.gov/38933581/'],
  );

  static const byGesture = <String, CommunicationEvidence>{
    'sonrisa_genuina': smile,
    'sonrisa_social': smile,
    'tono_sarcastico': sarcasm,
    'manos_bolsillos': gestures,
    'postura_abierta': gestures,
    'vestimenta_formal_contextual': attire,
    'vestimenta_casual': attire,
    'piernas_cruzadas': crossedLegs,
    'velocidad_rapida': speakingRate,
    'iluminacion_ambiente': lighting,
  };
}
