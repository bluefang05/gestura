import '../models/category.dart';
import '../models/quiz_question.dart';

/// Original practice examples; answers use the explicitly stated situation.
class CommunicationPracticeDatabase {
  static const questions = <QuizQuestion>[
    QuizQuestion(
      id: 'q_repair_specific_date',
      category: CategoryType.comunicacionDigital,
      prompt: 'En un audio entendiste el lugar, pero no si la reunión será '
          'jueves o viernes. ¿Qué pregunta aclara el dato que falta?',
      scenarioText: 'La otra persona puede responder por texto. No necesitas '
          'interpretar su emoción para coordinar la fecha.',
      questionIllustrationKey: 'context_aclarar_fecha',
      options: [
        QuizOption(
            id: 'opt_guess_date',
            text: 'Elegir viernes sin confirmarlo.',
            isCorrect: false),
        QuizOption(
            id: 'opt_ask_date',
            text: '«¿Dijiste jueves o viernes? '
                'Puedes escribirlo si te viene mejor».',
            isCorrect: true),
        QuizOption(
            id: 'opt_assume_annoyance',
            text: 'Preguntar por qué está '
                'molesta contigo en vez de aclarar la fecha.',
            isCorrect: false),
      ],
      explanation: 'Preguntas por la parte que no entendiste y ofreces '
          'otro canal. Si tampoco entendiste el lugar, podrías pedir que '
          'repita más información.',
      keyVisualClue: 'El calendario y las notas representan coordinación. '
          'La ilustración no contiene la fecha correcta.',
    ),
    QuizQuestion(
      id: 'q_check_shared_next_step',
      category: CategoryType.factoresParalinguisticos,
      prompt: 'Explicaste dos pasos de una tarea y tu colega asiente. '
          'Antes de empezar, quieren comprobar que entendieron el mismo plan. '
          '¿Qué opción ayuda?',
      questionIllustrationKey: 'context_revisar_documento',
      options: [
        QuizOption(
            id: 'opt_confirm_plan',
            text: '«Para comprobar si lo '
                'expliqué bien, ¿qué haríamos primero? Revisemos el plan juntos».',
            isCorrect: true),
        QuizOption(
            id: 'opt_read_nod',
            text: 'Tomar el asentimiento como '
                'prueba de que entendió todos los detalles.',
            isCorrect: false),
        QuizOption(
            id: 'opt_test_colleague',
            text: 'Exigir una respuesta '
                'inmediata para evaluar su inteligencia.',
            isCorrect: false),
      ],
      explanation: 'La respuesta permite comparar lo explicado con lo '
          'entendido. Si difieren, ajusta la explicación y ofrece tiempo '
          'o un formato útil. Este ejemplo adapta una herramienta de '
          'comunicación sanitaria a una tarea cotidiana.',
      keyVisualClue: 'El dato útil es el plan que ambos expresan; '
          'asentir no demuestra comprensión completa.',
    ),
    QuizQuestion(
      id: 'q_gesture_shared_reference',
      category: CategoryType.lenguajeCorporal,
      prompt: 'Hay tres cajas sobre una mesa. Dices «coloca esta junto '
          'a la puerta» mientras tu compañero pregunta cuál. ¿Cómo aclararlo?',
      options: [
        QuizOption(
            id: 'opt_palms_trust',
            text: 'Mostrar las palmas para '
                'que confíe más en tu instrucción.',
            isCorrect: false),
        QuizOption(
            id: 'opt_repeat_this',
            text: 'Repetir «esta» más fuerte '
                'sin identificar la caja.',
            isCorrect: false),
        QuizOption(
            id: 'opt_identify_box',
            text: 'Señalar la caja y '
                'describirla: «la pequeña con etiqueta azul», comprobando '
                'que ambos se refieren a la misma.',
            isCorrect: true),
      ],
      explanation: 'El gesto y la descripción aportan información sobre '
          'un objeto concreto. Si no puede verlo, describe la ubicación '
          'o acuerda otra forma de identificarlo.',
      keyVisualClue: 'Un gesto puede indicar un referente compartido. '
          'Su utilidad depende de que la otra persona pueda percibirlo.',
    ),
  ];
}
