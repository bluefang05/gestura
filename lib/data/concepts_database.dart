import '../models/quiz_question.dart';

class LearningConcept {
  final String title;
  final String explanation;
  final List<String> terms;
  const LearningConcept(this.title, this.explanation, this.terms);
}

class ConceptsDatabase {
  // Definitions describe observable features, not a diagnosis or a fixed meaning.
  // Context reference: doi:10.3389/fpsyg.2021.606548.
  static const all = <LearningConcept>[
    LearningConcept(
        'Línea base',
        'Es la forma habitual de expresarse de una persona en situaciones parecidas. Por ejemplo, alguien puede hablar poco incluso cuando está cómodo. Un cambio invita a preguntar; no demuestra que mienta ni que esté mal.',
        ['línea base', 'baseline', 'calibrar']),
    LearningConcept(
        'Manos en ojiva',
        'Las puntas de los dedos de ambas manos se tocan y las palmas quedan separadas, como un pequeño tejado. También se llama steepling. Describe la forma de las manos; por sí sola no demuestra seguridad, poder ni superioridad.',
        ['ojiva', 'steepling']),
    LearningConcept(
        'Contexto',
        'Es lo que ocurre alrededor: el lugar, el ruido, la actividad y lo que se ha dicho. Cruzar los brazos puede tener que ver con frío, comodidad u otras razones. Pregunta antes de decidir qué significa.',
        ['contexto', 'contextual']),
    LearningConcept(
        'Conjunto de señales',
        'Consiste en observar varias cosas junto con las palabras y el contexto. A veces se llama cluster. No existe un número de gestos que permita saber con certeza lo que otra persona piensa.',
        ['cluster', 'conjunto de señales', 'tres señales']),
    LearningConcept(
        'Postura abierta o cerrada',
        'Son descripciones de la posición corporal. Abierta suele describir brazos sin cruzar; cerrada, brazos cruzados o recogidos. Ninguna prueba por sí sola interés, rechazo o disposición a conversar.',
        ['postura', 'brazos cruzados', 'receptiva']),
    LearningConcept(
        'Sonrisa de Duchenne',
        'Es una sonrisa en la que se elevan las mejillas y se contrae la zona alrededor de los ojos. El nombre describe músculos que participan. No garantiza que la emoción sea sincera: una imagen sola no permite saberlo.',
        ['duchenne', 'orbicular', 'periocular']),
    LearningConcept(
        'Distancia personal y proxémica',
        'La proxémica estudia cómo usamos el espacio al comunicarnos. La distancia cómoda cambia según la persona, la relación y el lugar. Puedes preguntar: «¿Prefieres que me aleje un poco?»',
        ['proxémica', 'distancia', 'espacio personal']),
    LearningConcept(
        'Prosodia y tono de voz',
        'La prosodia es el ritmo, las pausas y las subidas y bajadas de la voz. Una voz plana puede ser una forma habitual de hablar. Para entender un mensaje, escucha también las palabras.',
        ['prosodia', 'entonación', 'tono', 'voz plana']),
    LearningConcept(
        'Incongruencia',
        'Es una diferencia aparente entre lo dicho y otra señal. Por ejemplo, decir «estoy bien» con voz temblorosa. Puede tener muchas causas. Puedes preguntar «¿Quieres contarme algo más?» sin dar por hecho una emoción.',
        ['incongruencia', 'incongruente', 'contradicción']),
    LearningConcept(
        'Autorregulación',
        'Son formas de ajustar cómo nos sentimos o cuánto estímulo recibimos. Mover las manos, balancearse o hacer una pausa puede ayudar. Esos movimientos no prueban nerviosismo ni mentira.',
        ['autorregulación', 'autocalma', 'adaptador', 'stimming']),
    LearningConcept(
        'Contacto visual',
        'Es mirar a los ojos de otra persona. La cantidad cómoda varía. Una persona puede escuchar con atención mientras mira a otro sitio; no hace falta exigirle que mire a los ojos.',
        ['contacto visual', 'mirada', 'ojos']),
    LearningConcept(
        'Consentimiento y límites',
        'Consentir es aceptar algo libremente. Un límite expresa lo que una persona acepta o necesita. Una sonrisa o el silencio no sustituyen una respuesta clara. Si hay duda, pregunta y respeta la respuesta.',
        ['consentimiento', 'límite', 'límites']),
    LearningConcept(
        'Sarcasmo e ironía',
        'A veces una persona dice algo para expresar un sentido diferente o contrario. El tono y la situación pueden ayudar, pero no siempre basta. Puedes preguntar: «¿Lo dices en serio o es una broma?»',
        ['sarcasmo', 'ironía', 'irónico']),
  ];

  static List<LearningConcept> forQuestions(List<QuizQuestion> questions) {
    final text = questions
        .map((q) => [
              q.prompt,
              q.scenarioText ?? '',
              q.explanation,
              q.keyVisualClue,
              ...q.options.map((o) => '${o.text} ${o.subtext ?? ""}')
            ].join(' '))
        .join(' ')
        .toLowerCase();
    return all.where((c) => c.terms.any(text.contains)).toList();
  }
}
