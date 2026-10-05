import '../models/quiz_question.dart';
import '../core/utils/search_utils.dart';

class LearningConcept {
  final String title;
  final String explanation;
  final List<String> terms;
  const LearningConcept(this.title, this.explanation, this.terms);

  bool matchesSearch(String query) {
    final words = normalizeSearchText(query).split(' ');
    final content =
        normalizeSearchText('$title $explanation ${terms.join(' ')}');
    return words.every(content.contains);
  }
}

class ConceptsDatabase {
  // Definitions describe observable features, not a diagnosis or a fixed meaning.
  // Context reference: doi:10.3389/fpsyg.2021.606548.
  static const all = <LearningConcept>[
    LearningConcept(
        'Forma habitual de expresarse',
        'Es la forma habitual de expresarse de una persona en situaciones parecidas. Por ejemplo, alguien puede hablar poco incluso cuando está cómodo. Un cambio invita a preguntar; no demuestra que mienta ni que esté mal.',
        ['línea base', 'baseline', 'forma habitual']),
    LearningConcept(
        'Puntas de los dedos juntas',
        'Las puntas de los dedos de ambas manos se tocan y las palmas quedan separadas, como un pequeño tejado. En algunos libros se llama «ojiva». Describe la forma de las manos; por sí sola no demuestra seguridad, poder ni superioridad.',
        ['ojiva', 'steepling', 'puntas de los dedos', 'yemas', 'tejado']),
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
        'Sonrisa con arrugas junto a los ojos',
        'Es una sonrisa en la que se elevan las mejillas y aparecen arrugas junto a los ojos. En algunos libros se llama sonrisa de Duchenne. No garantiza que la emoción sea sincera: una imagen sola no permite saberlo.',
        ['duchenne', 'periocular', 'arrugas']),
    LearningConcept(
        'Nombres de músculos de la cara',
        'El cigomático mayor es un músculo de la mejilla que ayuda a subir las esquinas de la boca al sonreír. El orbicular de los ojos rodea los ojos y ayuda a cerrarlos o apretarlos. Son nombres de partes del cuerpo: no hace falta memorizarlos ni sirven para saber qué siente alguien. Puedes fijarte en el movimiento descrito con palabras sencillas.',
        [
          'cigomático mayor',
          'cigomatico mayor',
          'cigomático',
          'cigomatico',
          'orbicular',
          'orbicular de los ojos',
          'músculos de la cara',
          'músculo facial',
          'anatomía facial',
        ]),
    LearningConcept(
        'Distancia personal',
        'Cada persona tiene una distancia cómoda. Puede cambiar según la relación, el lugar y el momento. Puedes preguntar: «¿Prefieres que me aleje un poco?»',
        ['proxémica', 'distancia', 'espacio personal']),
    LearningConcept(
        'Ritmo y tono de voz',
        'El ritmo, las pausas y las subidas y bajadas de la voz acompañan las palabras. A esto a veces se le llama «prosodia». Una voz plana puede ser una forma habitual de hablar.',
        ['prosodia', 'entonación', 'tono', 'voz plana']),
    LearningConcept(
        'Cuando las señales no parecen coincidir',
        'Por ejemplo, alguien dice «estoy bien» con voz temblorosa. Puede tener muchas causas. Puedes preguntar «¿Quieres contarme algo más?» sin dar por hecho una emoción. A esta diferencia a veces se le llama «incongruencia».',
        ['incongruencia', 'incongruente', 'contradicción']),
    LearningConcept(
        'Formas de regularse',
        'Mover las manos, balancearse o hacer una pausa puede ayudar a una persona a sentirse cómoda o manejar lo que ocurre a su alrededor. Esos movimientos no prueban nerviosismo ni mentira. A veces se llama «autorregulación».',
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
    final text = normalizeSearchText(questions
        .map((q) => [
              q.prompt,
              q.scenarioText ?? '',
              q.explanation,
              q.keyVisualClue,
              ...q.options.map((o) => '${o.text} ${o.subtext ?? ""}')
            ].join(' '))
        .join(' '));
    return all
        .where((c) => [c.title, ...c.terms]
            .any((term) => text.contains(normalizeSearchText(term))))
        .toList();
  }
}
