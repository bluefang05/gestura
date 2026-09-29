import '../models/quiz_question.dart';
import '../models/category.dart';

/// Original practice content; see CONTENT_SOURCES.md for editorial principles.
class QuizExpansion {
  static const List<QuizQuestion> questions = [
    QuizQuestion(
      id: "q_context_mirada_notas_interpret",
      category: CategoryType.expresionesFaciales,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una entrevista, la candidata mira su libreta mientras escucha una pregunta.",
      questionIllustrationKey: "averted_gaze",
      options: [
        QuizOption(
            id: "q_context_mirada_notas_interpret_0",
            text:
                "Puede estar organizando información y prestando atención por otra vía.",
            isCorrect: true),
        QuizOption(
            id: "q_context_mirada_notas_interpret_1",
            text: "Está ocultando información deliberadamente.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mirada_notas_interpret_2",
            text: "Ha perdido todo interés en el puesto.",
            isCorrect: false),
      ],
      keyVisualClue:
          "La mirada pasa del interlocutor al papel; sigue tomando notas.",
      explanation:
          "La calidad de la respuesta aporta más información que mantener la mirada de forma continua. Puede estar organizando información y prestando atención por otra vía. Pregunta si necesita unos segundos y permite consultar sus notas.",
    ),
    QuizQuestion(
      id: "q_context_mirada_notas_act",
      category: CategoryType.expresionesFaciales,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una entrevista, la candidata mira su libreta mientras escucha una pregunta.",
      questionIllustrationKey: "averted_gaze",
      options: [
        QuizOption(
            id: "q_context_mirada_notas_act_0",
            text: "Exige que te mire para demostrar sinceridad.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mirada_notas_act_1",
            text: "Retira la libreta para evaluar su reacción.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mirada_notas_act_2",
            text:
                "Pregunta si necesita unos segundos y permite consultar sus notas.",
            isCorrect: true),
      ],
      keyVisualClue:
          "La mirada pasa del interlocutor al papel; sigue tomando notas.",
      explanation:
          "La calidad de la respuesta aporta más información que mantener la mirada de forma continua. Puede estar organizando información y prestando atención por otra vía. Pregunta si necesita unos segundos y permite consultar sus notas.",
    ),
    QuizQuestion(
      id: "q_context_sonrisa_error_interpret",
      category: CategoryType.expresionesFaciales,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un compañero sonríe justo después de enterarse de que envió un archivo equivocado.",
      questionIllustrationKey: "polite_smile",
      options: [
        QuizOption(
            id: "q_context_sonrisa_error_interpret_0",
            text: "Le divierte perjudicar al equipo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_sonrisa_error_interpret_1",
            text: "La sonrisa demuestra que no entiende el problema.",
            isCorrect: false),
        QuizOption(
            id: "q_context_sonrisa_error_interpret_2",
            text:
                "Puede ser una respuesta de incomodidad mientras intenta reparar el error.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Sonrisa breve seguida de una disculpa y una petición de corregir el envío.",
      explanation:
          "No necesitas decidir qué emoción expresa para acordar una reparación verificable. Puede ser una respuesta de incomodidad mientras intenta reparar el error. Describe el archivo correcto y acuerda cómo reemplazarlo.",
    ),
    QuizQuestion(
      id: "q_context_sonrisa_error_act",
      category: CategoryType.expresionesFaciales,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un compañero sonríe justo después de enterarse de que envió un archivo equivocado.",
      questionIllustrationKey: "polite_smile",
      options: [
        QuizOption(
            id: "q_context_sonrisa_error_act_0",
            text: "Da por resuelto el error porque sonrió.",
            isCorrect: false),
        QuizOption(
            id: "q_context_sonrisa_error_act_1",
            text: "Describe el archivo correcto y acuerda cómo reemplazarlo.",
            isCorrect: true),
        QuizOption(
            id: "q_context_sonrisa_error_act_2",
            text: "Le acusa de burlarse antes de escuchar su explicación.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Sonrisa breve seguida de una disculpa y una petición de corregir el envío.",
      explanation:
          "No necesitas decidir qué emoción expresa para acordar una reparación verificable. Puede ser una respuesta de incomodidad mientras intenta reparar el error. Describe el archivo correcto y acuerda cómo reemplazarlo.",
    ),
    QuizQuestion(
      id: "q_context_ceno_lectura_interpret",
      category: CategoryType.expresionesFaciales,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Durante una demostración, una clienta frunce el ceño al mirar una tabla pequeña.",
      questionIllustrationKey: "frowning_brow",
      options: [
        QuizOption(
            id: "q_context_ceno_lectura_interpret_0",
            text: "Desconfía de la persona que presenta.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ceno_lectura_interpret_1",
            text: "Puede estar intentando leer o comprender los datos.",
            isCorrect: true),
        QuizOption(
            id: "q_context_ceno_lectura_interpret_2",
            text: "Rechaza definitivamente el presupuesto.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Las cejas se acercan cuando aparece la tabla y se relajan al cambiar de pantalla.",
      explanation:
          "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones. Puede estar intentando leer o comprender los datos. Amplía la tabla y pregunta qué dato conviene aclarar.",
    ),
    QuizQuestion(
      id: "q_context_ceno_lectura_act",
      category: CategoryType.expresionesFaciales,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Durante una demostración, una clienta frunce el ceño al mirar una tabla pequeña.",
      questionIllustrationKey: "frowning_brow",
      options: [
        QuizOption(
            id: "q_context_ceno_lectura_act_0",
            text: "Amplía la tabla y pregunta qué dato conviene aclarar.",
            isCorrect: true),
        QuizOption(
            id: "q_context_ceno_lectura_act_1",
            text: "Ofrece un descuento inmediato para vencer su resistencia.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ceno_lectura_act_2",
            text: "Oculta la tabla para evitar preguntas.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Las cejas se acercan cuando aparece la tabla y se relajan al cambiar de pantalla.",
      explanation:
          "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones. Puede estar intentando leer o comprender los datos. Amplía la tabla y pregunta qué dato conviene aclarar.",
    ),
    QuizQuestion(
      id: "q_context_rostro_neutro_interpret",
      category: CategoryType.expresionesFaciales,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Una participante mantiene una expresión poco cambiante y luego hace una pregunta precisa.",
      questionIllustrationKey: "closed_eyelids",
      options: [
        QuizOption(
            id: "q_context_rostro_neutro_interpret_0",
            text:
                "La expresividad limitada no permite concluir falta de atención.",
            isCorrect: true),
        QuizOption(
            id: "q_context_rostro_neutro_interpret_1",
            text: "Está aburrida porque no sonríe.",
            isCorrect: false),
        QuizOption(
            id: "q_context_rostro_neutro_interpret_2",
            text: "No puede comprender emociones ajenas.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Pocos cambios visibles en boca y cejas durante una explicación.",
      explanation:
          "La participación puede aparecer en preguntas, decisiones o aportes escritos, además de gestos. La expresividad limitada no permite concluir falta de atención. Comprueba la comprensión con una pregunta concreta y sin exigir una expresión.",
    ),
    QuizQuestion(
      id: "q_context_rostro_neutro_act",
      category: CategoryType.expresionesFaciales,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Una participante mantiene una expresión poco cambiante y luego hace una pregunta precisa.",
      questionIllustrationKey: "closed_eyelids",
      options: [
        QuizOption(
            id: "q_context_rostro_neutro_act_0",
            text: "Pide que sonría para parecer comprometida.",
            isCorrect: false),
        QuizOption(
            id: "q_context_rostro_neutro_act_1",
            text: "Interpreta su neutralidad como una evaluación negativa.",
            isCorrect: false),
        QuizOption(
            id: "q_context_rostro_neutro_act_2",
            text:
                "Comprueba la comprensión con una pregunta concreta y sin exigir una expresión.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Pocos cambios visibles en boca y cejas durante una explicación.",
      explanation:
          "La participación puede aparecer en preguntas, decisiones o aportes escritos, además de gestos. La expresividad limitada no permite concluir falta de atención. Comprueba la comprensión con una pregunta concreta y sin exigir una expresión.",
    ),
    QuizQuestion(
      id: "q_context_pausa_traduccion_interpret",
      category: CategoryType.factoresParalinguisticos,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una reunión bilingüe, un proveedor tarda en responder una pregunta nueva.",
      questionIllustrationKey: "silence_reflective",
      options: [
        QuizOption(
            id: "q_context_pausa_traduccion_interpret_0",
            text: "Está preparando una mentira.",
            isCorrect: false),
        QuizOption(
            id: "q_context_pausa_traduccion_interpret_1",
            text: "Su silencio equivale a aceptar las condiciones.",
            isCorrect: false),
        QuizOption(
            id: "q_context_pausa_traduccion_interpret_2",
            text:
                "Puede necesitar tiempo para comprender o formular la respuesta.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Hay varios segundos de silencio antes de una respuesta pertinente.",
      explanation:
          "Una pausa no es un turno libre para decidir por otra persona. Puede necesitar tiempo para comprender o formular la respuesta. Deja tiempo y ofrece reformular una sola idea por vez.",
    ),
    QuizQuestion(
      id: "q_context_pausa_traduccion_act",
      category: CategoryType.factoresParalinguisticos,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una reunión bilingüe, un proveedor tarda en responder una pregunta nueva.",
      questionIllustrationKey: "silence_reflective",
      options: [
        QuizOption(
            id: "q_context_pausa_traduccion_act_0",
            text: "Contesta en su nombre para terminar antes.",
            isCorrect: false),
        QuizOption(
            id: "q_context_pausa_traduccion_act_1",
            text: "Deja tiempo y ofrece reformular una sola idea por vez.",
            isCorrect: true),
        QuizOption(
            id: "q_context_pausa_traduccion_act_2",
            text: "Repite la pregunta cada segundo con otras palabras.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Hay varios segundos de silencio antes de una respuesta pertinente.",
      explanation:
          "Una pausa no es un turno libre para decidir por otra persona. Puede necesitar tiempo para comprender o formular la respuesta. Deja tiempo y ofrece reformular una sola idea por vez.",
    ),
    QuizQuestion(
      id: "q_context_volumen_ruido_interpret",
      category: CategoryType.factoresParalinguisticos,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una cafetería llena, una amiga eleva la voz para contar cómo le fue.",
      questionIllustrationKey: "voice_volume_high",
      options: [
        QuizOption(
            id: "q_context_volumen_ruido_interpret_0",
            text: "Quiere dominar la conversación.",
            isCorrect: false),
        QuizOption(
            id: "q_context_volumen_ruido_interpret_1",
            text: "Puede estar compensando el ruido ambiental.",
            isCorrect: true),
        QuizOption(
            id: "q_context_volumen_ruido_interpret_2",
            text: "Está enfadada contigo.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Habla más fuerte cuando sube la música y baja el volumen al salir.",
      explanation:
          "Compara la voz en distintos entornos antes de atribuirle una intención interpersonal. Puede estar compensando el ruido ambiental. Propón un sitio más tranquilo y comprueba si se escuchan mejor.",
    ),
    QuizQuestion(
      id: "q_context_volumen_ruido_act",
      category: CategoryType.factoresParalinguisticos,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una cafetería llena, una amiga eleva la voz para contar cómo le fue.",
      questionIllustrationKey: "voice_volume_high",
      options: [
        QuizOption(
            id: "q_context_volumen_ruido_act_0",
            text:
                "Propón un sitio más tranquilo y comprueba si se escuchan mejor.",
            isCorrect: true),
        QuizOption(
            id: "q_context_volumen_ruido_act_1",
            text: "Responde gritando para marcar autoridad.",
            isCorrect: false),
        QuizOption(
            id: "q_context_volumen_ruido_act_2",
            text: "Le reprocha que sea agresiva sin revisar el ruido.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Habla más fuerte cuando sube la música y baja el volumen al salir.",
      explanation:
          "Compara la voz en distintos entornos antes de atribuirle una intención interpersonal. Puede estar compensando el ruido ambiental. Propón un sitio más tranquilo y comprueba si se escuchan mejor.",
    ),
    QuizQuestion(
      id: "q_context_solapamiento_video_interpret",
      category: CategoryType.factoresParalinguisticos,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Dos colegas comienzan a hablar al mismo tiempo y vuelven a detenerse.",
      questionIllustrationKey: "turn_taking",
      options: [
        QuizOption(
            id: "q_context_solapamiento_video_interpret_0",
            text: "El retraso de audio puede dificultar coordinar los turnos.",
            isCorrect: true),
        QuizOption(
            id: "q_context_solapamiento_video_interpret_1",
            text: "Ambos intentan sabotear la reunión.",
            isCorrect: false),
        QuizOption(
            id: "q_context_solapamiento_video_interpret_2",
            text: "Quien empezó más alto merece el turno.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Las intervenciones se superponen tras pequeñas pausas de conexión.",
      explanation:
          "Un acuerdo explícito de turnos reduce la ambigüedad del canal. El retraso de audio puede dificultar coordinar los turnos. Acuerden una señal de turno y deja una pausa entre intervenciones.",
    ),
    QuizQuestion(
      id: "q_context_solapamiento_video_act",
      category: CategoryType.factoresParalinguisticos,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Dos colegas comienzan a hablar al mismo tiempo y vuelven a detenerse.",
      questionIllustrationKey: "turn_taking",
      options: [
        QuizOption(
            id: "q_context_solapamiento_video_act_0",
            text: "Asigna falta de respeto a cada interrupción.",
            isCorrect: false),
        QuizOption(
            id: "q_context_solapamiento_video_act_1",
            text: "Desactiva el micrófono de una persona sin avisar.",
            isCorrect: false),
        QuizOption(
            id: "q_context_solapamiento_video_act_2",
            text:
                "Acuerden una señal de turno y deja una pausa entre intervenciones.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Las intervenciones se superponen tras pequeñas pausas de conexión.",
      explanation:
          "Un acuerdo explícito de turnos reduce la ambigüedad del canal. El retraso de audio puede dificultar coordinar los turnos. Acuerden una señal de turno y deja una pausa entre intervenciones.",
    ),
    QuizQuestion(
      id: "q_context_reparacion_verbal_interpret",
      category: CategoryType.factoresParalinguisticos,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un colega dice una cifra, se detiene y corrige el dato consultando el informe.",
      questionIllustrationKey: "voice_prosody",
      options: [
        QuizOption(
            id: "q_context_reparacion_verbal_interpret_0",
            text: "Las autocorrecciones prueban engaño.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reparacion_verbal_interpret_1",
            text: "La primera cifra siempre es la verdadera.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reparacion_verbal_interpret_2",
            text: "Puede estar corrigiendo una imprecisión mientras habla.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Repite el inicio de la frase y sustituye una cantidad por otra.",
      explanation:
          "Verificar el dato es más útil que juzgar la fluidez de quien lo comunica. Puede estar corrigiendo una imprecisión mientras habla. Pide confirmar el dato final en el documento compartido.",
    ),
    QuizQuestion(
      id: "q_context_reparacion_verbal_act",
      category: CategoryType.factoresParalinguisticos,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un colega dice una cifra, se detiene y corrige el dato consultando el informe.",
      questionIllustrationKey: "voice_prosody",
      options: [
        QuizOption(
            id: "q_context_reparacion_verbal_act_0",
            text: "Registra ambas cifras como si fueran compromisos distintos.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reparacion_verbal_act_1",
            text: "Pide confirmar el dato final en el documento compartido.",
            isCorrect: true),
        QuizOption(
            id: "q_context_reparacion_verbal_act_2",
            text: "Usa su vacilación como prueba de mala fe.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Repite el inicio de la frase y sustituye una cantidad por otra.",
      explanation:
          "Verificar el dato es más útil que juzgar la fluidez de quien lo comunica. Puede estar corrigiendo una imprecisión mientras habla. Pide confirmar el dato final en el documento compartido.",
    ),
    QuizQuestion(
      id: "q_context_movimiento_escucha_interpret",
      category: CategoryType.lenguajeCorporal,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Una persona mueve los dedos durante una explicación y responde sobre el tema.",
      questionIllustrationKey: "finger_tapping",
      options: [
        QuizOption(
            id: "q_context_movimiento_escucha_interpret_0",
            text: "Está provocando deliberadamente a quien habla.",
            isCorrect: false),
        QuizOption(
            id: "q_context_movimiento_escucha_interpret_1",
            text: "El movimiento puede coexistir con la atención.",
            isCorrect: true),
        QuizOption(
            id: "q_context_movimiento_escucha_interpret_2",
            text: "Quiere que termines cuanto antes.",
            isCorrect: false),
      ],
      keyVisualClue: "Movimiento repetido de manos sin abandonar la actividad.",
      explanation:
          "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos. El movimiento puede coexistir con la atención. Permite el movimiento y comprueba si el ritmo de la explicación le sirve.",
    ),
    QuizQuestion(
      id: "q_context_movimiento_escucha_act",
      category: CategoryType.lenguajeCorporal,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Una persona mueve los dedos durante una explicación y responde sobre el tema.",
      questionIllustrationKey: "finger_tapping",
      options: [
        QuizOption(
            id: "q_context_movimiento_escucha_act_0",
            text:
                "Permite el movimiento y comprueba si el ritmo de la explicación le sirve.",
            isCorrect: true),
        QuizOption(
            id: "q_context_movimiento_escucha_act_1",
            text: "Le sujeta las manos para que atienda.",
            isCorrect: false),
        QuizOption(
            id: "q_context_movimiento_escucha_act_2",
            text: "Interpreta cada movimiento como una objeción.",
            isCorrect: false),
      ],
      keyVisualClue: "Movimiento repetido de manos sin abandonar la actividad.",
      explanation:
          "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos. El movimiento puede coexistir con la atención. Permite el movimiento y comprueba si el ritmo de la explicación le sirve.",
    ),
    QuizQuestion(
      id: "q_context_postura_dolor_interpret",
      category: CategoryType.lenguajeCorporal,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Durante una sesión larga, alguien se inclina, se recoloca y pide levantarse.",
      questionIllustrationKey: "weight_shift",
      options: [
        QuizOption(
            id: "q_context_postura_dolor_interpret_0",
            text: "Puede necesitar comodidad o una pausa de movimiento.",
            isCorrect: true),
        QuizOption(
            id: "q_context_postura_dolor_interpret_1",
            text: "Intenta desautorizar a quien presenta.",
            isCorrect: false),
        QuizOption(
            id: "q_context_postura_dolor_interpret_2",
            text: "Está rechazando el contenido.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Traslada el peso y cambia el apoyo de la espalda varias veces.",
      explanation:
          "Puedes facilitar comodidad sin conocer ni divulgar información personal. Puede necesitar comodidad o una pausa de movimiento. Ofrece una pausa o libertad para cambiar de posición sin pedir explicaciones personales.",
    ),
    QuizQuestion(
      id: "q_context_postura_dolor_act",
      category: CategoryType.lenguajeCorporal,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Durante una sesión larga, alguien se inclina, se recoloca y pide levantarse.",
      questionIllustrationKey: "weight_shift",
      options: [
        QuizOption(
            id: "q_context_postura_dolor_act_0",
            text: "Pide que permanezca inmóvil por respeto.",
            isCorrect: false),
        QuizOption(
            id: "q_context_postura_dolor_act_1",
            text: "Pregunta públicamente por un diagnóstico.",
            isCorrect: false),
        QuizOption(
            id: "q_context_postura_dolor_act_2",
            text:
                "Ofrece una pausa o libertad para cambiar de posición sin pedir explicaciones personales.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Traslada el peso y cambia el apoyo de la espalda varias veces.",
      explanation:
          "Puedes facilitar comodidad sin conocer ni divulgar información personal. Puede necesitar comodidad o una pausa de movimiento. Ofrece una pausa o libertad para cambiar de posición sin pedir explicaciones personales.",
    ),
    QuizQuestion(
      id: "q_context_asentir_seguimiento_interpret",
      category: CategoryType.lenguajeCorporal,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un cliente asiente mientras explicas opciones, pero aún no ha elegido ninguna.",
      questionIllustrationKey: "head_tilt",
      options: [
        QuizOption(
            id: "q_context_asentir_seguimiento_interpret_0",
            text: "Ya autorizó la compra.",
            isCorrect: false),
        QuizOption(
            id: "q_context_asentir_seguimiento_interpret_1",
            text: "Está de acuerdo con cada condición contractual.",
            isCorrect: false),
        QuizOption(
            id: "q_context_asentir_seguimiento_interpret_2",
            text:
                "Puede indicar que sigue la explicación, sin comprometerse a comprar.",
            isCorrect: true),
      ],
      keyVisualClue: "Pequeños movimientos de cabeza durante tu intervención.",
      explanation:
          "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas. Puede indicar que sigue la explicación, sin comprometerse a comprar. Pregunta qué opción prefiere y solicita una confirmación explícita antes de tramitar.",
    ),
    QuizQuestion(
      id: "q_context_asentir_seguimiento_act",
      category: CategoryType.lenguajeCorporal,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un cliente asiente mientras explicas opciones, pero aún no ha elegido ninguna.",
      questionIllustrationKey: "head_tilt",
      options: [
        QuizOption(
            id: "q_context_asentir_seguimiento_act_0",
            text: "Interpreta la falta de compra como deshonestidad.",
            isCorrect: false),
        QuizOption(
            id: "q_context_asentir_seguimiento_act_1",
            text:
                "Pregunta qué opción prefiere y solicita una confirmación explícita antes de tramitar.",
            isCorrect: true),
        QuizOption(
            id: "q_context_asentir_seguimiento_act_2",
            text: "Procesa el pedido al ver el primer asentimiento.",
            isCorrect: false),
      ],
      keyVisualClue: "Pequeños movimientos de cabeza durante tu intervención.",
      explanation:
          "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas. Puede indicar que sigue la explicación, sin comprometerse a comprar. Pregunta qué opción prefiere y solicita una confirmación explícita antes de tramitar.",
    ),
    QuizQuestion(
      id: "q_context_orientacion_material_interpret",
      category: CategoryType.lenguajeCorporal,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una tutoría, el estudiante gira hacia la pantalla en vez de hacia ti.",
      questionIllustrationKey: "leaning_forward",
      options: [
        QuizOption(
            id: "q_context_orientacion_material_interpret_0",
            text: "No escucha porque no está de frente.",
            isCorrect: false),
        QuizOption(
            id: "q_context_orientacion_material_interpret_1",
            text: "Puede estar atendiendo al objeto de trabajo conjunto.",
            isCorrect: true),
        QuizOption(
            id: "q_context_orientacion_material_interpret_2",
            text: "Está evitando toda relación contigo.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Torso y mirada se orientan al ejemplo que están revisando.",
      explanation:
          "En tareas conjuntas, la atención puede dirigirse al mismo objeto y no al rostro. Puede estar atendiendo al objeto de trabajo conjunto. Ubica el material donde ambos puedan verlo y pregunta qué paso revisan.",
    ),
    QuizQuestion(
      id: "q_context_orientacion_material_act",
      category: CategoryType.lenguajeCorporal,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una tutoría, el estudiante gira hacia la pantalla en vez de hacia ti.",
      questionIllustrationKey: "leaning_forward",
      options: [
        QuizOption(
            id: "q_context_orientacion_material_act_0",
            text:
                "Ubica el material donde ambos puedan verlo y pregunta qué paso revisan.",
            isCorrect: true),
        QuizOption(
            id: "q_context_orientacion_material_act_1",
            text: "Retira el material para obligarlo a mirarte.",
            isCorrect: false),
        QuizOption(
            id: "q_context_orientacion_material_act_2",
            text: "Cambia de tema al interpretar rechazo.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Torso y mirada se orientan al ejemplo que están revisando.",
      explanation:
          "En tareas conjuntas, la atención puede dirigirse al mismo objeto y no al rostro. Puede estar atendiendo al objeto de trabajo conjunto. Ubica el material donde ambos puedan verlo y pregunta qué paso revisan.",
    ),
    QuizQuestion(
      id: "q_context_paso_atras_interpret",
      category: CategoryType.proxemica,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Al iniciar una conversación en un pasillo, tu interlocutor da un paso atrás.",
      questionIllustrationKey: "proxemics_personal",
      options: [
        QuizOption(
            id: "q_context_paso_atras_interpret_0",
            text: "Puede estar ajustando su espacio disponible o preferido.",
            isCorrect: true),
        QuizOption(
            id: "q_context_paso_atras_interpret_1",
            text: "Te rechaza como persona.",
            isCorrect: false),
        QuizOption(
            id: "q_context_paso_atras_interpret_2",
            text: "Te invita a acercarte otra vez.",
            isCorrect: false),
      ],
      keyVisualClue: "Aumenta la separación manteniendo la conversación.",
      explanation:
          "El espacio puede ajustarse sin convertirlo en una evaluación de la relación. Puede estar ajustando su espacio disponible o preferido. Conserva el espacio nuevo y pregunta si ese lugar le resulta cómodo.",
    ),
    QuizQuestion(
      id: "q_context_paso_atras_act",
      category: CategoryType.proxemica,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Al iniciar una conversación en un pasillo, tu interlocutor da un paso atrás.",
      questionIllustrationKey: "proxemics_personal",
      options: [
        QuizOption(
            id: "q_context_paso_atras_act_0",
            text: "Avanza cada vez que retrocede.",
            isCorrect: false),
        QuizOption(
            id: "q_context_paso_atras_act_1",
            text: "Le exige explicar por qué se aleja de ti.",
            isCorrect: false),
        QuizOption(
            id: "q_context_paso_atras_act_2",
            text:
                "Conserva el espacio nuevo y pregunta si ese lugar le resulta cómodo.",
            isCorrect: true),
      ],
      keyVisualClue: "Aumenta la separación manteniendo la conversación.",
      explanation:
          "El espacio puede ajustarse sin convertirlo en una evaluación de la relación. Puede estar ajustando su espacio disponible o preferido. Conserva el espacio nuevo y pregunta si ese lugar le resulta cómodo.",
    ),
    QuizQuestion(
      id: "q_context_saludo_sin_contacto_interpret",
      category: CategoryType.proxemica,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Una nueva colega saluda con la mano cuando le ofreces un apretón.",
      questionIllustrationKey: "proxemics_social",
      options: [
        QuizOption(
            id: "q_context_saludo_sin_contacto_interpret_0",
            text: "Quiere ofenderte públicamente.",
            isCorrect: false),
        QuizOption(
            id: "q_context_saludo_sin_contacto_interpret_1",
            text: "No desea colaborar contigo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_saludo_sin_contacto_interpret_2",
            text: "Está eligiendo una forma de saludo sin contacto.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Mantiene la mano a distancia y acompaña el saludo con palabras.",
      explanation:
          "Aceptar una modalidad de saludo evita convertir una preferencia corporal en un conflicto. Está eligiendo una forma de saludo sin contacto. Devuelve el saludo sin tocar y continúa la presentación.",
    ),
    QuizQuestion(
      id: "q_context_saludo_sin_contacto_act",
      category: CategoryType.proxemica,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Una nueva colega saluda con la mano cuando le ofreces un apretón.",
      questionIllustrationKey: "proxemics_social",
      options: [
        QuizOption(
            id: "q_context_saludo_sin_contacto_act_0",
            text: "Comenta su conducta con el resto del equipo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_saludo_sin_contacto_act_1",
            text: "Devuelve el saludo sin tocar y continúa la presentación.",
            isCorrect: true),
        QuizOption(
            id: "q_context_saludo_sin_contacto_act_2",
            text: "Insiste en el apretón para demostrar confianza.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Mantiene la mano a distancia y acompaña el saludo con palabras.",
      explanation:
          "Aceptar una modalidad de saludo evita convertir una preferencia corporal en un conflicto. Está eligiendo una forma de saludo sin contacto. Devuelve el saludo sin tocar y continúa la presentación.",
    ),
    QuizQuestion(
      id: "q_context_espacio_movilidad_interpret",
      category: CategoryType.proxemica,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una mesa de trabajo, una persona pide que apartes una silla del pasillo.",
      questionIllustrationKey: "proxemics_social",
      options: [
        QuizOption(
            id: "q_context_espacio_movilidad_interpret_0",
            text: "No quiere compartir el espacio.",
            isCorrect: false),
        QuizOption(
            id: "q_context_espacio_movilidad_interpret_1",
            text: "Puede necesitar una ruta despejada para desplazarse.",
            isCorrect: true),
        QuizOption(
            id: "q_context_espacio_movilidad_interpret_2",
            text: "Está intentando controlar dónde se sientan todos.",
            isCorrect: false),
      ],
      keyVisualClue: "Señala una zona de paso y espera antes de avanzar.",
      explanation:
          "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona. Puede necesitar una ruta despejada para desplazarse. Despeja el paso y pregunta antes de mover pertenencias o ayudas de movilidad.",
    ),
    QuizQuestion(
      id: "q_context_espacio_movilidad_act",
      category: CategoryType.proxemica,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una mesa de trabajo, una persona pide que apartes una silla del pasillo.",
      questionIllustrationKey: "proxemics_social",
      options: [
        QuizOption(
            id: "q_context_espacio_movilidad_act_0",
            text:
                "Despeja el paso y pregunta antes de mover pertenencias o ayudas de movilidad.",
            isCorrect: true),
        QuizOption(
            id: "q_context_espacio_movilidad_act_1",
            text: "Mueve su dispositivo sin consultarle.",
            isCorrect: false),
        QuizOption(
            id: "q_context_espacio_movilidad_act_2",
            text: "Decide que debe tomar otra ruta más larga.",
            isCorrect: false),
      ],
      keyVisualClue: "Señala una zona de paso y espera antes de avanzar.",
      explanation:
          "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona. Puede necesitar una ruta despejada para desplazarse. Despeja el paso y pregunta antes de mover pertenencias o ayudas de movilidad.",
    ),
    QuizQuestion(
      id: "q_context_privacidad_distancia_interpret",
      category: CategoryType.proxemica,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un compañero baja la voz y propone hablar lejos del mostrador.",
      questionIllustrationKey: "proxemics_personal",
      options: [
        QuizOption(
            id: "q_context_privacidad_distancia_interpret_0",
            text: "Puede buscar privacidad para el asunto que quiere tratar.",
            isCorrect: true),
        QuizOption(
            id: "q_context_privacidad_distancia_interpret_1",
            text: "Está a punto de revelar una mentira.",
            isCorrect: false),
        QuizOption(
            id: "q_context_privacidad_distancia_interpret_2",
            text: "Su petición prueba que el tema es peligroso.",
            isCorrect: false),
      ],
      keyVisualClue: "Señala un lugar apartado antes de dar detalles.",
      explanation:
          "La privacidad se acuerda; no necesitas anticipar el contenido para ofrecerla. Puede buscar privacidad para el asunto que quiere tratar. Pregunta si prefiere un lugar privado y acuerden dónde conversar.",
    ),
    QuizQuestion(
      id: "q_context_privacidad_distancia_act",
      category: CategoryType.proxemica,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un compañero baja la voz y propone hablar lejos del mostrador.",
      questionIllustrationKey: "proxemics_personal",
      options: [
        QuizOption(
            id: "q_context_privacidad_distancia_act_0",
            text: "Pide que explique el asunto ante la fila.",
            isCorrect: false),
        QuizOption(
            id: "q_context_privacidad_distancia_act_1",
            text: "Lo sigue a cualquier lugar sin comprobar comodidad mutua.",
            isCorrect: false),
        QuizOption(
            id: "q_context_privacidad_distancia_act_2",
            text:
                "Pregunta si prefiere un lugar privado y acuerden dónde conversar.",
            isCorrect: true),
      ],
      keyVisualClue: "Señala un lugar apartado antes de dar detalles.",
      explanation:
          "La privacidad se acuerda; no necesitas anticipar el contenido para ofrecerla. Puede buscar privacidad para el asunto que quiere tratar. Pregunta si prefiere un lugar privado y acuerden dónde conversar.",
    ),
    QuizQuestion(
      id: "q_context_contraluz_interpret",
      category: CategoryType.entornoApariencia,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una llamada, una ventana ilumina la espalda de la persona y su cara queda oscura.",
      questionIllustrationKey: "lighting_atmosphere",
      options: [
        QuizOption(
            id: "q_context_contraluz_interpret_0",
            text: "La persona está ocultando sus reacciones.",
            isCorrect: false),
        QuizOption(
            id: "q_context_contraluz_interpret_1",
            text: "Su rostro no cambia porque no le importa la reunión.",
            isCorrect: false),
        QuizOption(
            id: "q_context_contraluz_interpret_2",
            text: "La imagen limita lo que puedes observar de su expresión.",
            isCorrect: true),
      ],
      keyVisualClue:
          "La cámara muestra una silueta con pocos detalles faciales.",
      explanation:
          "La calidad de la imagen modifica tu información, no demuestra una actitud. La imagen limita lo que puedes observar de su expresión. Si necesita verse mejor, propone ajustar la luz sin convertirlo en obligación.",
    ),
    QuizQuestion(
      id: "q_context_contraluz_act",
      category: CategoryType.entornoApariencia,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una llamada, una ventana ilumina la espalda de la persona y su cara queda oscura.",
      questionIllustrationKey: "lighting_atmosphere",
      options: [
        QuizOption(
            id: "q_context_contraluz_act_0",
            text: "Exige encender más luces aunque le incomoden.",
            isCorrect: false),
        QuizOption(
            id: "q_context_contraluz_act_1",
            text:
                "Si necesita verse mejor, propone ajustar la luz sin convertirlo en obligación.",
            isCorrect: true),
        QuizOption(
            id: "q_context_contraluz_act_2",
            text: "Atribuye frialdad a una cara que apenas se ve.",
            isCorrect: false),
      ],
      keyVisualClue:
          "La cámara muestra una silueta con pocos detalles faciales.",
      explanation:
          "La calidad de la imagen modifica tu información, no demuestra una actitud. La imagen limita lo que puedes observar de su expresión. Si necesita verse mejor, propone ajustar la luz sin convertirlo en obligación.",
    ),
    QuizQuestion(
      id: "q_context_mesa_accesible_interpret",
      category: CategoryType.entornoApariencia,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En un taller, una columna y varias sillas impiden que dos personas vean el material.",
      questionIllustrationKey: "round_table",
      options: [
        QuizOption(
            id: "q_context_mesa_accesible_interpret_0",
            text: "El grupo rechaza la actividad.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mesa_accesible_interpret_1",
            text:
                "La disposición del espacio puede estar dificultando participar.",
            isCorrect: true),
        QuizOption(
            id: "q_context_mesa_accesible_interpret_2",
            text: "Quienes se mueven no saben comportarse.",
            isCorrect: false),
      ],
      keyVisualClue: "Parte del grupo gira el cuerpo y se estira para ver.",
      explanation:
          "Revisar quién puede ver, oír y acceder al material forma parte de preparar la conversación. La disposición del espacio puede estar dificultando participar. Pregunta si todos ven y redistribuye el material o los asientos con el grupo.",
    ),
    QuizQuestion(
      id: "q_context_mesa_accesible_act",
      category: CategoryType.entornoApariencia,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En un taller, una columna y varias sillas impiden que dos personas vean el material.",
      questionIllustrationKey: "round_table",
      options: [
        QuizOption(
            id: "q_context_mesa_accesible_act_0",
            text:
                "Pregunta si todos ven y redistribuye el material o los asientos con el grupo.",
            isCorrect: true),
        QuizOption(
            id: "q_context_mesa_accesible_act_1",
            text: "Continúa porque nadie se ha quejado formalmente.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mesa_accesible_act_2",
            text: "Asigna los mejores lugares solo a quienes hablan más.",
            isCorrect: false),
      ],
      keyVisualClue: "Parte del grupo gira el cuerpo y se estira para ver.",
      explanation:
          "Revisar quién puede ver, oír y acceder al material forma parte de preparar la conversación. La disposición del espacio puede estar dificultando participar. Pregunta si todos ven y redistribuye el material o los asientos con el grupo.",
    ),
    QuizQuestion(
      id: "q_context_ruido_fondo_interpret",
      category: CategoryType.entornoApariencia,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Una persona pide que repitas una instrucción junto a una máquina encendida.",
      questionIllustrationKey: "desk_barrier",
      options: [
        QuizOption(
            id: "q_context_ruido_fondo_interpret_0",
            text: "El ruido puede estar impidiendo entender la instrucción.",
            isCorrect: true),
        QuizOption(
            id: "q_context_ruido_fondo_interpret_1",
            text: "No presta atención porque no le interesa.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ruido_fondo_interpret_2",
            text: "No tiene capacidad para seguir instrucciones.",
            isCorrect: false),
      ],
      keyVisualClue: "Acerca el oído y pide repetir varias veces.",
      explanation:
          "Ajusta el canal antes de atribuir el problema a la motivación de la persona. El ruido puede estar impidiendo entender la instrucción. Reduce el ruido si es posible y ofrece la instrucción escrita o un lugar tranquilo.",
    ),
    QuizQuestion(
      id: "q_context_ruido_fondo_act",
      category: CategoryType.entornoApariencia,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Una persona pide que repitas una instrucción junto a una máquina encendida.",
      questionIllustrationKey: "desk_barrier",
      options: [
        QuizOption(
            id: "q_context_ruido_fondo_act_0",
            text: "Repite exactamente igual desde más lejos.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ruido_fondo_act_1",
            text: "Aumenta las instrucciones para aprovechar el tiempo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ruido_fondo_act_2",
            text:
                "Reduce el ruido si es posible y ofrece la instrucción escrita o un lugar tranquilo.",
            isCorrect: true),
      ],
      keyVisualClue: "Acerca el oído y pide repetir varias veces.",
      explanation:
          "Ajusta el canal antes de atribuir el problema a la motivación de la persona. El ruido puede estar impidiendo entender la instrucción. Reduce el ruido si es posible y ofrece la instrucción escrita o un lugar tranquilo.",
    ),
    QuizQuestion(
      id: "q_context_ropa_contexto_interpret",
      category: CategoryType.entornoApariencia,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un profesional llega con ropa informal a una reunión técnica.",
      questionIllustrationKey: "dress_casual",
      options: [
        QuizOption(
            id: "q_context_ropa_contexto_interpret_0",
            text: "La ropa demuestra que desconoce su trabajo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ropa_contexto_interpret_1",
            text: "Su aspecto permite conocer su nivel económico.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ropa_contexto_interpret_2",
            text:
                "La apariencia no basta para evaluar capacidad o preparación.",
            isCorrect: true),
      ],
      keyVisualClue: "La ropa difiere de la del resto del grupo.",
      explanation:
          "Distingue una norma explícita del contexto de una impresión personal sobre la apariencia. La apariencia no basta para evaluar capacidad o preparación. Evalúa su aporte y explica requisitos concretos de vestimenta solo si existen.",
    ),
    QuizQuestion(
      id: "q_context_ropa_contexto_act",
      category: CategoryType.entornoApariencia,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un profesional llega con ropa informal a una reunión técnica.",
      questionIllustrationKey: "dress_casual",
      options: [
        QuizOption(
            id: "q_context_ropa_contexto_act_0",
            text: "Deduce su personalidad a partir de la ropa.",
            isCorrect: false),
        QuizOption(
            id: "q_context_ropa_contexto_act_1",
            text:
                "Evalúa su aporte y explica requisitos concretos de vestimenta solo si existen.",
            isCorrect: true),
        QuizOption(
            id: "q_context_ropa_contexto_act_2",
            text: "Descarta su propuesta antes de escucharla.",
            isCorrect: false),
      ],
      keyVisualClue: "La ropa difiere de la del resto del grupo.",
      explanation:
          "Distingue una norma explícita del contexto de una impresión personal sobre la apariencia. La apariencia no basta para evaluar capacidad o preparación. Evalúa su aporte y explica requisitos concretos de vestimenta solo si existen.",
    ),
    QuizQuestion(
      id: "q_context_camara_apagada_interpret",
      category: CategoryType.comunicacionDigital,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "En una reunión remota, alguien mantiene la cámara apagada y responde por audio.",
      questionIllustrationKey: "digital_audio",
      options: [
        QuizOption(
            id: "q_context_camara_apagada_interpret_0",
            text: "Oculta algo al resto del equipo.",
            isCorrect: false),
        QuizOption(
            id: "q_context_camara_apagada_interpret_1",
            text:
                "La falta de vídeo no permite inferir desconexión del trabajo.",
            isCorrect: true),
        QuizOption(
            id: "q_context_camara_apagada_interpret_2",
            text: "Está haciendo otra actividad y no escucha.",
            isCorrect: false),
      ],
      keyVisualClue:
          "No hay imagen, pero sí preguntas y respuestas relacionadas con la tarea.",
      explanation:
          "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado. La falta de vídeo no permite inferir desconexión del trabajo. Acuerden cómo participar y confirma si el audio o chat le funciona.",
    ),
    QuizQuestion(
      id: "q_context_camara_apagada_act",
      category: CategoryType.comunicacionDigital,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "En una reunión remota, alguien mantiene la cámara apagada y responde por audio.",
      questionIllustrationKey: "digital_audio",
      options: [
        QuizOption(
            id: "q_context_camara_apagada_act_0",
            text:
                "Acuerden cómo participar y confirma si el audio o chat le funciona.",
            isCorrect: true),
        QuizOption(
            id: "q_context_camara_apagada_act_1",
            text: "Exige mostrar su habitación para probar presencia.",
            isCorrect: false),
        QuizOption(
            id: "q_context_camara_apagada_act_2",
            text: "Ignora sus aportes porque no ves su cara.",
            isCorrect: false),
      ],
      keyVisualClue:
          "No hay imagen, pero sí preguntas y respuestas relacionadas con la tarea.",
      explanation:
          "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado. La falta de vídeo no permite inferir desconexión del trabajo. Acuerden cómo participar y confirma si el audio o chat le funciona.",
    ),
    QuizQuestion(
      id: "q_context_reaccion_no_acuerdo_interpret",
      category: CategoryType.comunicacionDigital,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Envías una propuesta con dos fechas y recibes una reacción de pulgar arriba.",
      questionIllustrationKey: "digital_emojis",
      options: [
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_interpret_0",
            text:
                "Puede confirmar lectura o valoración sin resolver la elección.",
            isCorrect: true),
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_interpret_1",
            text: "Aceptó automáticamente la primera fecha.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_interpret_2",
            text: "Se comprometió a asistir a las dos fechas.",
            isCorrect: false),
      ],
      keyVisualClue:
          "Hay una reacción, sin texto que indique la fecha elegida.",
      explanation:
          "Cuando una decisión tiene consecuencias, solicita la información que falta de forma explícita. Puede confirmar lectura o valoración sin resolver la elección. Pregunta cuál fecha confirma antes de hacer la reserva.",
    ),
    QuizQuestion(
      id: "q_context_reaccion_no_acuerdo_act",
      category: CategoryType.comunicacionDigital,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Envías una propuesta con dos fechas y recibes una reacción de pulgar arriba.",
      questionIllustrationKey: "digital_emojis",
      options: [
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_act_0",
            text: "Reserva la opción más cara dando el acuerdo por hecho.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_act_1",
            text: "Envía la factura usando la reacción como autorización.",
            isCorrect: false),
        QuizOption(
            id: "q_context_reaccion_no_acuerdo_act_2",
            text: "Pregunta cuál fecha confirma antes de hacer la reserva.",
            isCorrect: true),
      ],
      keyVisualClue:
          "Hay una reacción, sin texto que indique la fecha elegida.",
      explanation:
          "Cuando una decisión tiene consecuencias, solicita la información que falta de forma explícita. Puede confirmar lectura o valoración sin resolver la elección. Pregunta cuál fecha confirma antes de hacer la reserva.",
    ),
    QuizQuestion(
      id: "q_context_respuesta_diferida_interpret",
      category: CategoryType.comunicacionDigital,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Un mensaje enviado por la tarde aparece leído y se responde a la mañana siguiente.",
      questionIllustrationKey: "digital_visto",
      options: [
        QuizOption(
            id: "q_context_respuesta_diferida_interpret_0",
            text: "Te está castigando con silencio.",
            isCorrect: false),
        QuizOption(
            id: "q_context_respuesta_diferida_interpret_1",
            text: "Leer obliga a contestar de inmediato.",
            isCorrect: false),
        QuizOption(
            id: "q_context_respuesta_diferida_interpret_2",
            text:
                "El intervalo por sí solo no explica la intención de la persona.",
            isCorrect: true),
      ],
      keyVisualClue: "Hay un intervalo entre lectura y respuesta.",
      explanation:
          "Las expectativas de respuesta deben acordarse según la tarea y el horario. El intervalo por sí solo no explica la intención de la persona. Indica un plazo concreto y acuerda un canal para urgencias reales.",
    ),
    QuizQuestion(
      id: "q_context_respuesta_diferida_act",
      category: CategoryType.comunicacionDigital,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Un mensaje enviado por la tarde aparece leído y se responde a la mañana siguiente.",
      questionIllustrationKey: "digital_visto",
      options: [
        QuizOption(
            id: "q_context_respuesta_diferida_act_0",
            text: "Publica una queja antes del plazo acordado.",
            isCorrect: false),
        QuizOption(
            id: "q_context_respuesta_diferida_act_1",
            text:
                "Indica un plazo concreto y acuerda un canal para urgencias reales.",
            isCorrect: true),
        QuizOption(
            id: "q_context_respuesta_diferida_act_2",
            text: "Envía mensajes repetidos para forzar respuesta.",
            isCorrect: false),
      ],
      keyVisualClue: "Hay un intervalo entre lectura y respuesta.",
      explanation:
          "Las expectativas de respuesta deben acordarse según la tarea y el horario. El intervalo por sí solo no explica la intención de la persona. Indica un plazo concreto y acuerda un canal para urgencias reales.",
    ),
    QuizQuestion(
      id: "q_context_mensaje_breve_interpret",
      category: CategoryType.comunicacionDigital,
      prompt: "¿Qué interpretación permite la información disponible?",
      scenarioText:
          "Una compañera responde «recibido» a un documento y continúa trabajando.",
      questionIllustrationKey: "digital_visto",
      options: [
        QuizOption(
            id: "q_context_mensaje_breve_interpret_0",
            text: "Desprecia el esfuerzo que hiciste.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mensaje_breve_interpret_1",
            text: "La brevedad no permite determinar su estado de ánimo.",
            isCorrect: true),
        QuizOption(
            id: "q_context_mensaje_breve_interpret_2",
            text: "Está enfadada por recibir el documento.",
            isCorrect: false),
      ],
      keyVisualClue: "Mensaje corto sin emojis ni otra información emocional.",
      explanation:
          "Aclara la tarea pendiente antes de atribuir emociones a la puntuación o longitud del mensaje. La brevedad no permite determinar su estado de ánimo. Si necesitas una revisión, pregunta cuándo podrá enviarte comentarios.",
    ),
    QuizQuestion(
      id: "q_context_mensaje_breve_act",
      category: CategoryType.comunicacionDigital,
      prompt:
          "¿Qué respuesta ayuda a aclarar la situación sin asumir intenciones?",
      scenarioText:
          "Una compañera responde «recibido» a un documento y continúa trabajando.",
      questionIllustrationKey: "digital_visto",
      options: [
        QuizOption(
            id: "q_context_mensaje_breve_act_0",
            text:
                "Si necesitas una revisión, pregunta cuándo podrá enviarte comentarios.",
            isCorrect: true),
        QuizOption(
            id: "q_context_mensaje_breve_act_1",
            text: "Responde con ironía porque interpretas hostilidad.",
            isCorrect: false),
        QuizOption(
            id: "q_context_mensaje_breve_act_2",
            text: "Pide una explicación sobre su mal humor.",
            isCorrect: false),
      ],
      keyVisualClue: "Mensaje corto sin emojis ni otra información emocional.",
      explanation:
          "Aclara la tarea pendiente antes de atribuir emociones a la puntuación o longitud del mensaje. La brevedad no permite determinar su estado de ánimo. Si necesitas una revisión, pregunta cuándo podrá enviarte comentarios.",
    ),
  ];
}
