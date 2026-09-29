import '../models/scenario.dart';

/// Original fictional situations for guided practice.
class ScenarioExpansion {
  static const List<Scenario> scenarios = [
    Scenario(
      id: "scenario_context_mirada_notas",
      title: "Conversación con espacio para pensar",
      domain: "Ámbito Laboral",
      description:
          "La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
      contextOverview:
          "En una cafetería, una persona consulta sus notas mientras escucha una pregunta.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "mirada_notas_0",
          narrative:
              "En una cafetería, una persona consulta sus notas mientras escucha una pregunta.",
          characterAction:
              "La mirada pasa del interlocutor al papel; sigue tomando notas.",
          illustrationKey: "averted_gaze",
          visibleSignals: [
            "La mirada pasa del interlocutor al papel; sigue tomando notas."
          ],
          learningTakeaway:
              "La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
          choices: [
            ScenarioChoice(
                text:
                    "Pregunta si necesita unos segundos y permite consultar sus notas.",
                analysis:
                    "La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Exige que te mire para demostrar sinceridad.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Retira la libreta para evaluar su reacción.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "mirada_notas_1",
          narrative:
              "La persona explica que escribir le ayuda a ordenar sus ideas. Propone responder con un esquema breve.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "averted_gaze",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Acordar el formato no elimina los criterios de evaluación: permite aplicarlos a información relevante.",
          choices: [
            ScenarioChoice(
                text:
                    "Exige responder de memoria aunque las notas estaban permitidas.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Acordar el formato no elimina los criterios de evaluación: permite aplicarlos a información relevante.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Reduce su valoración por usar una estrategia distinta de la tuya.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Acordar el formato no elimina los criterios de evaluación: permite aplicarlos a información relevante.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Acepta el esquema y evalúa la respuesta con los mismos criterios del puesto.",
                analysis:
                    "Acordar el formato no elimina los criterios de evaluación: permite aplicarlos a información relevante.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La candidata presenta un ejemplo concreto que puedes contrastar con los requisitos del puesto."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_ceno_lectura",
      title: "Una tabla difícil de leer",
      domain: "Ventas & Negociación",
      description:
          "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
      contextOverview:
          "Durante una demostración, una clienta frunce el ceño al mirar una tabla pequeña.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "ceno_lectura_0",
          narrative:
              "Durante una demostración, una clienta frunce el ceño al mirar una tabla pequeña.",
          characterAction:
              "Las cejas se acercan cuando aparece la tabla y se relajan al cambiar de pantalla.",
          illustrationKey: "frowning_brow",
          visibleSignals: [
            "Las cejas se acercan cuando aparece la tabla y se relajan al cambiar de pantalla."
          ],
          learningTakeaway:
              "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
          choices: [
            ScenarioChoice(
                text:
                    "Ofrece un descuento inmediato para vencer su resistencia.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Oculta la tabla para evitar preguntas.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Amplía la tabla y pregunta qué dato conviene aclarar.",
                analysis:
                    "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
          ],
        ),
        ScenarioStep(
          id: "ceno_lectura_1",
          narrative:
              "Con la tabla ampliada, la clienta pregunta por un cargo recurrente que no estaba explicado.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "frowning_brow",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Una mejora en la expresión no sustituye la respuesta a una duda ni la autorización de compra.",
          choices: [
            ScenarioChoice(
                text:
                    "Interpreta la pregunta económica como una intención de compra definitiva.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una mejora en la expresión no sustituye la respuesta a una duda ni la autorización de compra.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Aclara qué incluye el cargo y pregunta si desea comparar opciones antes de decidir.",
                analysis:
                    "Una mejora en la expresión no sustituye la respuesta a una duda ni la autorización de compra.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La clienta puede comparar el costo total antes de confirmar o rechazar la propuesta."),
            ScenarioChoice(
                text:
                    "Da el problema por resuelto porque dejó de fruncir el ceño.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una mejora en la expresión no sustituye la respuesta a una duda ni la autorización de compra.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_pausa_traduccion",
      title: "Reunión en un segundo idioma",
      domain: "Ámbito Laboral",
      description:
          "Una pausa no es un turno libre para decidir por otra persona.",
      contextOverview:
          "En una reunión bilingüe, un proveedor tarda en responder una pregunta nueva.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "pausa_traduccion_0",
          narrative:
              "En una reunión bilingüe, un proveedor tarda en responder una pregunta nueva.",
          characterAction:
              "Hay varios segundos de silencio antes de una respuesta pertinente.",
          illustrationKey: "silence_reflective",
          visibleSignals: [
            "Hay varios segundos de silencio antes de una respuesta pertinente."
          ],
          learningTakeaway:
              "Una pausa no es un turno libre para decidir por otra persona.",
          choices: [
            ScenarioChoice(
                text: "Contesta en su nombre para terminar antes.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una pausa no es un turno libre para decidir por otra persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Deja tiempo y ofrece reformular una sola idea por vez.",
                analysis:
                    "Una pausa no es un turno libre para decidir por otra persona.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Repite la pregunta cada segundo con otras palabras.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una pausa no es un turno libre para decidir por otra persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "pausa_traduccion_1",
          narrative:
              "El proveedor explica que entendió la fecha de entrega, pero no qué archivos deben acompañarla.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "silence_reflective",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "La verificación de un acuerdo debe centrarse en su contenido y no en juzgar el acento o la rapidez.",
          choices: [
            ScenarioChoice(
                text:
                    "Enumera los archivos por escrito y pide comprobar que la lista coincide con lo acordado.",
                analysis:
                    "La verificación de un acuerdo debe centrarse en su contenido y no en juzgar el acento o la rapidez.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "Ambas partes identifican los entregables y pueden señalar dudas concretas."),
            ScenarioChoice(
                text: "Repite todo el contrato más rápido.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La verificación de un acuerdo debe centrarse en su contenido y no en juzgar el acento o la rapidez.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Le pregunta si realmente domina el idioma frente al equipo.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La verificación de un acuerdo debe centrarse en su contenido y no en juzgar el acento o la rapidez.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_solapamiento_video",
      title: "Turnos en una reunión remota",
      domain: "Ámbito Laboral",
      description:
          "Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
      contextOverview:
          "Dos colegas comienzan a hablar al mismo tiempo y vuelven a detenerse.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "solapamiento_video_0",
          narrative:
              "Dos colegas comienzan a hablar al mismo tiempo y vuelven a detenerse.",
          characterAction:
              "Las intervenciones se superponen tras pequeñas pausas de conexión.",
          illustrationKey: "turn_taking",
          visibleSignals: [
            "Las intervenciones se superponen tras pequeñas pausas de conexión."
          ],
          learningTakeaway:
              "Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
          choices: [
            ScenarioChoice(
                text:
                    "Acuerden una señal de turno y deja una pausa entre intervenciones.",
                analysis:
                    "Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Asigna falta de respeto a cada interrupción.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Desactiva el micrófono de una persona sin avisar.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "solapamiento_video_1",
          narrative:
              "Tras acordar turnos, una participante escribe que su micrófono falla y pide intervenir por chat.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "turn_taking",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Un turno accesible puede usar un canal distinto al de la mayoría.",
          choices: [
            ScenarioChoice(
                text: "Ignora el chat porque el turno era por voz.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Un turno accesible puede usar un canal distinto al de la mayoría.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text: "Da por aceptadas las decisiones porque no habló.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Un turno accesible puede usar un canal distinto al de la mayoría.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Lee su aporte con permiso e incorpóralo al acuerdo de la reunión.",
                analysis:
                    "Un turno accesible puede usar un canal distinto al de la mayoría.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "Su observación queda incluida y el grupo confirma el siguiente paso."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_movimiento_escucha",
      title: "Escuchar con las manos en movimiento",
      domain: "Relaciones Sociales",
      description:
          "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
      contextOverview:
          "Una persona mueve los dedos durante una explicación y responde sobre el tema.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "movimiento_escucha_0",
          narrative:
              "Una persona mueve los dedos durante una explicación y responde sobre el tema.",
          characterAction:
              "Movimiento repetido de manos sin abandonar la actividad.",
          illustrationKey: "finger_tapping",
          visibleSignals: [
            "Movimiento repetido de manos sin abandonar la actividad."
          ],
          learningTakeaway:
              "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
          choices: [
            ScenarioChoice(
                text: "Le sujeta las manos para que atienda.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Interpreta cada movimiento como una objeción.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Permite el movimiento y comprueba si el ritmo de la explicación le sirve.",
                analysis:
                    "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
          ],
        ),
        ScenarioStep(
          id: "movimiento_escucha_1",
          narrative:
              "La persona dice que puede seguirte, pero el golpeteo resulta molesto a alguien que comparte la mesa.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "finger_tapping",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Las necesidades de distintas personas se negocian sin convertir una de ellas en un defecto.",
          choices: [
            ScenarioChoice(
                text: "Se burla del movimiento para que cese.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Las necesidades de distintas personas se negocian sin convertir una de ellas en un defecto.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Pregunta si pueden buscar un objeto silencioso o cambiar de superficie, sin exigir inmovilidad.",
                analysis:
                    "Las necesidades de distintas personas se negocian sin convertir una de ellas en un defecto.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "El grupo busca una alternativa que permita escuchar y moverse con menos ruido."),
            ScenarioChoice(
                text:
                    "Decide que una de las dos personas debe abandonar la conversación.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Las necesidades de distintas personas se negocian sin convertir una de ellas en un defecto.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_asentir_seguimiento",
      title: "Asentir no es autorizar un pedido",
      domain: "Ventas & Negociación",
      description:
          "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
      contextOverview:
          "Un cliente asiente mientras explicas opciones, pero aún no ha elegido ninguna.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "asentir_seguimiento_0",
          narrative:
              "Un cliente asiente mientras explicas opciones, pero aún no ha elegido ninguna.",
          characterAction:
              "Pequeños movimientos de cabeza durante tu intervención.",
          illustrationKey: "head_tilt",
          visibleSignals: [
            "Pequeños movimientos de cabeza durante tu intervención."
          ],
          learningTakeaway:
              "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
          choices: [
            ScenarioChoice(
                text: "Interpreta la falta de compra como deshonestidad.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Pregunta qué opción prefiere y solicita una confirmación explícita antes de tramitar.",
                analysis:
                    "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Procesa el pedido al ver el primer asentimiento.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "asentir_seguimiento_1",
          narrative:
              "El cliente aclara que comprendió la oferta, pero necesita consultar al equipo y no confirma la compra.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "head_tilt",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "La autorización debe ser explícita; la presión no resuelve la falta de acuerdo.",
          choices: [
            ScenarioChoice(
                text:
                    "Envía un resumen y pregunta si quiere acordar una fecha para retomar la decisión.",
                analysis:
                    "La autorización debe ser explícita; la presión no resuelve la falta de acuerdo.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La propuesta queda pendiente de confirmación y cada parte conoce el siguiente paso."),
            ScenarioChoice(
                text: "Emite el pedido porque ya había asentido.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La autorización debe ser explícita; la presión no resuelve la falta de acuerdo.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text: "Inventa una fecha límite para que acepte de inmediato.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La autorización debe ser explícita; la presión no resuelve la falta de acuerdo.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_paso_atras",
      title: "Distancia cómoda en un pasillo",
      domain: "Relaciones Sociales",
      description:
          "El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
      contextOverview:
          "Al iniciar una conversación en un pasillo, tu interlocutor da un paso atrás.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "paso_atras_0",
          narrative:
              "Al iniciar una conversación en un pasillo, tu interlocutor da un paso atrás.",
          characterAction: "Aumenta la separación manteniendo la conversación.",
          illustrationKey: "proxemics_personal",
          visibleSignals: [
            "Aumenta la separación manteniendo la conversación."
          ],
          learningTakeaway:
              "El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
          choices: [
            ScenarioChoice(
                text:
                    "Conserva el espacio nuevo y pregunta si ese lugar le resulta cómodo.",
                analysis:
                    "El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Avanza cada vez que retrocede.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Le exige explicar por qué se aleja de ti.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "paso_atras_1",
          narrative:
              "La persona señala que están bloqueando el paso y propone continuar junto a una zona más amplia.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "proxemics_personal",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Una conducta espacial puede tener una explicación práctica ajena a la relación.",
          choices: [
            ScenarioChoice(
                text: "Insiste en el sitio original para mantener cercanía.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una conducta espacial puede tener una explicación práctica ajena a la relación.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Interpreta su propuesta como una excusa para terminar la amistad.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una conducta espacial puede tener una explicación práctica ajena a la relación.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Comprueba que ambos estén cómodos y deja libre la ruta de paso.",
                analysis:
                    "Una conducta espacial puede tener una explicación práctica ajena a la relación.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La conversación continúa sin obstaculizar a otras personas."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_espacio_movilidad",
      title: "Preparar una sala accesible",
      domain: "Vida Diaria",
      description:
          "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
      contextOverview:
          "En una mesa de trabajo, una persona pide que apartes una silla del pasillo.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "espacio_movilidad_0",
          narrative:
              "En una mesa de trabajo, una persona pide que apartes una silla del pasillo.",
          characterAction: "Señala una zona de paso y espera antes de avanzar.",
          illustrationKey: "proxemics_social",
          visibleSignals: [
            "Señala una zona de paso y espera antes de avanzar."
          ],
          learningTakeaway:
              "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
          choices: [
            ScenarioChoice(
                text: "Mueve su dispositivo sin consultarle.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Decide que debe tomar otra ruta más larga.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Despeja el paso y pregunta antes de mover pertenencias o ayudas de movilidad.",
                analysis:
                    "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
          ],
        ),
        ScenarioStep(
          id: "espacio_movilidad_1",
          narrative:
              "Después de despejar el pasillo, la persona indica dónde quiere colocarse y pide que no muevas su ayuda de movilidad.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "proxemics_social",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "La ayuda se ofrece y se acuerda; no reemplaza la autonomía.",
          choices: [
            ScenarioChoice(
                text: "Habla con su acompañante sobre dónde debería sentarse.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La ayuda se ofrece y se acuerda; no reemplaza la autonomía.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Respeta su ubicación y pregunta si necesita algún ajuste adicional.",
                analysis:
                    "La ayuda se ofrece y se acuerda; no reemplaza la autonomía.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La persona conserva el control de sus pertenencias y de su participación."),
            ScenarioChoice(
                text:
                    "Mueve el dispositivo para que la sala quede más simétrica.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La ayuda se ofrece y se acuerda; no reemplaza la autonomía.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_contraluz",
      title: "Videollamada con luz y privacidad",
      domain: "Ámbito Laboral",
      description:
          "La calidad de la imagen modifica tu información, no demuestra una actitud.",
      contextOverview:
          "En una llamada, una ventana ilumina la espalda de la persona y su cara queda oscura.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "contraluz_0",
          narrative:
              "En una llamada, una ventana ilumina la espalda de la persona y su cara queda oscura.",
          characterAction:
              "La cámara muestra una silueta con pocos detalles faciales.",
          illustrationKey: "lighting_atmosphere",
          visibleSignals: [
            "La cámara muestra una silueta con pocos detalles faciales."
          ],
          learningTakeaway:
              "La calidad de la imagen modifica tu información, no demuestra una actitud.",
          choices: [
            ScenarioChoice(
                text: "Exige encender más luces aunque le incomoden.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La calidad de la imagen modifica tu información, no demuestra una actitud.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Si necesita verse mejor, propone ajustar la luz sin convertirlo en obligación.",
                analysis:
                    "La calidad de la imagen modifica tu información, no demuestra una actitud.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Atribuye frialdad a una cara que apenas se ve.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La calidad de la imagen modifica tu información, no demuestra una actitud.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "contraluz_1",
          narrative:
              "La persona explica que no puede cambiar la luz y prefiere apagar el vídeo durante la revisión.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "lighting_atmosphere",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Una limitación visual del canal se puede resolver sin pedir acceso al espacio privado.",
          choices: [
            ScenarioChoice(
                text:
                    "Acordad revisar el documento con audio o chat y confirmar las decisiones por escrito.",
                analysis:
                    "Una limitación visual del canal se puede resolver sin pedir acceso al espacio privado.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La tarea sigue por un canal acordado y quedan decisiones comprobables."),
            ScenarioChoice(
                text:
                    "Suspende su participación porque no puedes interpretar su cara.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una limitación visual del canal se puede resolver sin pedir acceso al espacio privado.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text: "Exige que muestre otra habitación.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una limitación visual del canal se puede resolver sin pedir acceso al espacio privado.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_ruido_fondo",
      title: "Instrucciones en un entorno ruidoso",
      domain: "Vida Diaria",
      description:
          "Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
      contextOverview:
          "Una persona pide que repitas una instrucción junto a una máquina encendida.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "ruido_fondo_0",
          narrative:
              "Una persona pide que repitas una instrucción junto a una máquina encendida.",
          characterAction: "Acerca el oído y pide repetir varias veces.",
          illustrationKey: "desk_barrier",
          visibleSignals: ["Acerca el oído y pide repetir varias veces."],
          learningTakeaway:
              "Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
          choices: [
            ScenarioChoice(
                text:
                    "Reduce el ruido si es posible y ofrece la instrucción escrita o un lugar tranquilo.",
                analysis:
                    "Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Repite exactamente igual desde más lejos.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Aumenta las instrucciones para aprovechar el tiempo.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "ruido_fondo_1",
          narrative:
              "En un rincón tranquilo, la persona entiende la primera parte, pero pide que anotes dos pasos en orden.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "desk_barrier",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Una instrucción útil tiene una secuencia comprensible y admite formas distintas de consulta.",
          choices: [
            ScenarioChoice(
                text: "Responde que ya lo explicaste demasiadas veces.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una instrucción útil tiene una secuencia comprensible y admite formas distintas de consulta.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text: "Añade todos los detalles posibles en un único párrafo.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Una instrucción útil tiene una secuencia comprensible y admite formas distintas de consulta.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Escribe los pasos brevemente y confirma qué hará primero.",
                analysis:
                    "Una instrucción útil tiene una secuencia comprensible y admite formas distintas de consulta.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "La persona dispone de una referencia para seguir la secuencia."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_camara_apagada",
      title: "Participación sin cámara",
      domain: "Ámbito Laboral",
      description:
          "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
      contextOverview:
          "En una reunión remota, alguien mantiene la cámara apagada y responde por audio.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "camara_apagada_0",
          narrative:
              "En una reunión remota, alguien mantiene la cámara apagada y responde por audio.",
          characterAction:
              "No hay imagen, pero sí preguntas y respuestas relacionadas con la tarea.",
          illustrationKey: "digital_audio",
          visibleSignals: [
            "No hay imagen, pero sí preguntas y respuestas relacionadas con la tarea."
          ],
          learningTakeaway:
              "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
          choices: [
            ScenarioChoice(
                text: "Exige mostrar su habitación para probar presencia.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text: "Ignora sus aportes porque no ves su cara.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Acuerden cómo participar y confirma si el audio o chat le funciona.",
                analysis:
                    "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
          ],
        ),
        ScenarioStep(
          id: "camara_apagada_1",
          narrative:
              "La persona participa por audio, pero necesita desconectarse antes del cierre por un compromiso ya avisado.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "digital_audio",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Salir de una reunión no equivale a aceptar ni rechazar lo que todavía no se ha tratado.",
          choices: [
            ScenarioChoice(
                text:
                    "Le exige permanecer conectada en silencio aunque no pueda participar.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Salir de una reunión no equivale a aceptar ni rechazar lo que todavía no se ha tratado.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text:
                    "Resume lo decidido y acuerda cómo revisará lo que quede pendiente.",
                analysis:
                    "Salir de una reunión no equivale a aceptar ni rechazar lo que todavía no se ha tratado.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "Quedan claros los acuerdos conocidos y los puntos que requieren confirmación posterior."),
            ScenarioChoice(
                text:
                    "Toma su salida como desacuerdo con todas las decisiones.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Salir de una reunión no equivale a aceptar ni rechazar lo que todavía no se ha tratado.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
    Scenario(
      id: "scenario_context_respuesta_diferida",
      title: "Un mensaje pendiente de respuesta",
      domain: "Límites & Asertividad",
      description:
          "Las expectativas de respuesta deben acordarse según la tarea y el horario.",
      contextOverview:
          "Un mensaje enviado por la tarde aparece leído y se responde a la mañana siguiente.",
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: "respuesta_diferida_0",
          narrative:
              "Un mensaje enviado por la tarde aparece leído y se responde a la mañana siguiente.",
          characterAction: "Hay un intervalo entre lectura y respuesta.",
          illustrationKey: "digital_visto",
          visibleSignals: ["Hay un intervalo entre lectura y respuesta."],
          learningTakeaway:
              "Las expectativas de respuesta deben acordarse según la tarea y el horario.",
          choices: [
            ScenarioChoice(
                text: "Publica una queja antes del plazo acordado.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Las expectativas de respuesta deben acordarse según la tarea y el horario.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
            ScenarioChoice(
                text:
                    "Indica un plazo concreto y acuerda un canal para urgencias reales.",
                analysis:
                    "Las expectativas de respuesta deben acordarse según la tarea y el horario.",
                isBestAction: true,
                nextStepIndex: 1,
                consequenceSummary:
                    "En el siguiente paso se aporta información adicional para volver a evaluar la situación."),
            ScenarioChoice(
                text: "Envía mensajes repetidos para forzar respuesta.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Las expectativas de respuesta deben acordarse según la tarea y el horario.",
                isBestAction: false,
                nextStepIndex: 1,
                consequenceSummary:
                    "Puede añadir presión o dejar sin resolver la necesidad planteada. Puedes reconsiderar tu respuesta con la información del siguiente paso."),
          ],
        ),
        ScenarioStep(
          id: "respuesta_diferida_1",
          narrative:
              "La compañera responde dentro del plazo y explica que agrupa los mensajes al inicio y al final de su turno.",
          characterAction:
              "La persona expresa una necesidad o aclara el acuerdo con palabras.",
          illustrationKey: "digital_visto",
          visibleSignals: [
            "La persona expresa una necesidad o aclara el acuerdo con palabras."
          ],
          learningTakeaway:
              "Los indicadores digitales no sustituyen un acuerdo sobre disponibilidad.",
          choices: [
            ScenarioChoice(
                text:
                    "Acuerden ese ritmo y un canal específico para asuntos realmente urgentes.",
                analysis:
                    "Los indicadores digitales no sustituyen un acuerdo sobre disponibilidad.",
                isBestAction: true,
                nextStepIndex: null,
                consequenceSummary:
                    "El equipo sabe cuándo esperar respuesta y cómo comunicar una urgencia real."),
            ScenarioChoice(
                text:
                    "Le exige contestar en cuanto aparezca el indicador de lectura.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Los indicadores digitales no sustituyen un acuerdo sobre disponibilidad.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
            ScenarioChoice(
                text: "Envía todo como urgente para saltarse el acuerdo.",
                analysis:
                    "Esta opción añade una conclusión o una exigencia que la información disponible no justifica. Los indicadores digitales no sustituyen un acuerdo sobre disponibilidad.",
                isBestAction: false,
                nextStepIndex: null,
                consequenceSummary:
                    "La necesidad expresada queda sin resolver y el acuerdo requiere reparación."),
          ],
        ),
      ],
    ),
  ];
}
