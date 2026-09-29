import '../models/gesture_item.dart';
import '../models/category.dart';

/// Original practice content; see CONTENT_SOURCES.md for editorial principles.
class GestureExpansion {
  static const List<GestureItem> items = [
    GestureItem(
      id: "context_mirada_notas",
      name: "Mirada alternada entre persona y notas",
      category: CategoryType.expresionesFaciales,
      bodyPart: "Ojos",
      summary:
          "En una cafetería, una persona consulta sus notas mientras escucha una pregunta.",
      physiologicalDetails:
          "La mirada pasa del interlocutor al papel; sigue tomando notas.",
      probableMeaning:
          "Puede estar organizando información y prestando atención por otra vía.",
      alternativeMeanings: [
        "Consultar palabras clave",
        "reducir distracciones visuales"
      ],
      contextGuidance:
          "La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
      whatToDo:
          "Pregunta si necesita unos segundos y permite consultar sus notas.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. La calidad de la respuesta aporta más información que mantener la mirada de forma continua.",
      illustrationKey: "context_mirada_notas",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_sonrisa_error",
      name: "Sonrisa después de un error",
      category: CategoryType.expresionesFaciales,
      bodyPart: "Boca",
      summary:
          "Un compañero sonríe justo después de enterarse de que envió un archivo equivocado.",
      physiologicalDetails:
          "Sonrisa breve seguida de una disculpa y una petición de corregir el envío.",
      probableMeaning:
          "Puede ser una respuesta de incomodidad mientras intenta reparar el error.",
      alternativeMeanings: [
        "Hábito social",
        "intento de suavizar un momento incómodo"
      ],
      contextGuidance:
          "No necesitas decidir qué emoción expresa para acordar una reparación verificable.",
      whatToDo: "Describe el archivo correcto y acuerda cómo reemplazarlo.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. No necesitas decidir qué emoción expresa para acordar una reparación verificable.",
      illustrationKey: "polite_smile",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_ceno_lectura",
      name: "Ceño al leer una pantalla",
      category: CategoryType.expresionesFaciales,
      bodyPart: "Cejas",
      summary:
          "Durante una demostración, una clienta frunce el ceño al mirar una tabla pequeña.",
      physiologicalDetails:
          "Las cejas se acercan cuando aparece la tabla y se relajan al cambiar de pantalla.",
      probableMeaning: "Puede estar intentando leer o comprender los datos.",
      alternativeMeanings: [
        "Letra pequeña",
        "reflejos",
        "concentración en cifras"
      ],
      contextGuidance:
          "Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
      whatToDo: "Amplía la tabla y pregunta qué dato conviene aclarar.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Cambiar una condición observable ayuda a comprobar una hipótesis sin atribuir intenciones.",
      illustrationKey: "context_revisar_documento",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_rostro_neutro",
      name: "Rostro poco expresivo durante la escucha",
      category: CategoryType.expresionesFaciales,
      bodyPart: "Rostro",
      summary:
          "Una participante mantiene una expresión poco cambiante y luego hace una pregunta precisa.",
      physiologicalDetails:
          "Pocos cambios visibles en boca y cejas durante una explicación.",
      probableMeaning:
          "La expresividad limitada no permite concluir falta de atención.",
      alternativeMeanings: [
        "Estilo personal",
        "cansancio",
        "atención centrada en escuchar"
      ],
      contextGuidance:
          "La participación puede aparecer en preguntas, decisiones o aportes escritos, además de gestos.",
      whatToDo:
          "Comprueba la comprensión con una pregunta concreta y sin exigir una expresión.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. La participación puede aparecer en preguntas, decisiones o aportes escritos, además de gestos.",
      illustrationKey: "closed_eyelids",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_pausa_traduccion",
      name: "Pausa al conversar en otro idioma",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: "Voz",
      summary:
          "En una reunión bilingüe, un proveedor tarda en responder una pregunta nueva.",
      physiologicalDetails:
          "Hay varios segundos de silencio antes de una respuesta pertinente.",
      probableMeaning:
          "Puede necesitar tiempo para comprender o formular la respuesta.",
      alternativeMeanings: [
        "Traducción mental",
        "búsqueda de un término técnico"
      ],
      contextGuidance:
          "Una pausa no es un turno libre para decidir por otra persona.",
      whatToDo: "Deja tiempo y ofrece reformular una sola idea por vez.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Una pausa no es un turno libre para decidir por otra persona.",
      illustrationKey: "context_pausa_conversacion",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_volumen_ruido",
      name: "Volumen elevado en un lugar ruidoso",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: "Voz",
      summary:
          "En una cafetería llena, una amiga eleva la voz para contar cómo le fue.",
      physiologicalDetails:
          "Habla más fuerte cuando sube la música y baja el volumen al salir.",
      probableMeaning: "Puede estar compensando el ruido ambiental.",
      alternativeMeanings: [
        "Dificultad para escucharse",
        "distancia entre asientos"
      ],
      contextGuidance:
          "Compara la voz en distintos entornos antes de atribuirle una intención interpersonal.",
      whatToDo:
          "Propón un sitio más tranquilo y comprueba si se escuchan mejor.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Compara la voz en distintos entornos antes de atribuirle una intención interpersonal.",
      illustrationKey: "context_ruido_cafeteria",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_solapamiento_video",
      name: "Solapamiento de turnos en videollamada",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: "Voz",
      summary:
          "Dos colegas comienzan a hablar al mismo tiempo y vuelven a detenerse.",
      physiologicalDetails:
          "Las intervenciones se superponen tras pequeñas pausas de conexión.",
      probableMeaning:
          "El retraso de audio puede dificultar coordinar los turnos.",
      alternativeMeanings: [
        "Latencia",
        "señales visuales incompletas",
        "entusiasmo"
      ],
      contextGuidance:
          "Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
      whatToDo:
          "Acuerden una señal de turno y deja una pausa entre intervenciones.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Un acuerdo explícito de turnos reduce la ambigüedad del canal.",
      illustrationKey: "turn_taking",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_reparacion_verbal",
      name: "Reformular una frase a mitad de camino",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: "Voz",
      summary:
          "Un colega dice una cifra, se detiene y corrige el dato consultando el informe.",
      physiologicalDetails:
          "Repite el inicio de la frase y sustituye una cantidad por otra.",
      probableMeaning:
          "Puede estar corrigiendo una imprecisión mientras habla.",
      alternativeMeanings: [
        "Recuerdo incompleto",
        "error de lectura",
        "precisión técnica"
      ],
      contextGuidance:
          "Verificar el dato es más útil que juzgar la fluidez de quien lo comunica.",
      whatToDo: "Pide confirmar el dato final en el documento compartido.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Verificar el dato es más útil que juzgar la fluidez de quien lo comunica.",
      illustrationKey: "voice_prosody",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_movimiento_escucha",
      name: "Movimiento repetido mientras se escucha",
      category: CategoryType.lenguajeCorporal,
      bodyPart: "Manos",
      summary:
          "Una persona mueve los dedos durante una explicación y responde sobre el tema.",
      physiologicalDetails:
          "Movimiento repetido de manos sin abandonar la actividad.",
      probableMeaning: "El movimiento puede coexistir con la atención.",
      alternativeMeanings: ["Hábito motor", "comodidad", "ajuste al entorno"],
      contextGuidance:
          "Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
      whatToDo:
          "Permite el movimiento y comprueba si el ritmo de la explicación le sirve.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Evalúa la comunicación por el intercambio y pregunta preferencias antes de corregir movimientos.",
      illustrationKey: "context_movimiento_escucha",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_postura_dolor",
      name: "Cambios frecuentes de postura",
      category: CategoryType.lenguajeCorporal,
      bodyPart: "Torso",
      summary:
          "Durante una sesión larga, alguien se inclina, se recoloca y pide levantarse.",
      physiologicalDetails:
          "Traslada el peso y cambia el apoyo de la espalda varias veces.",
      probableMeaning: "Puede necesitar comodidad o una pausa de movimiento.",
      alternativeMeanings: [
        "Asiento incómodo",
        "rigidez",
        "preferencia por estar de pie"
      ],
      contextGuidance:
          "Puedes facilitar comodidad sin conocer ni divulgar información personal.",
      whatToDo:
          "Ofrece una pausa o libertad para cambiar de posición sin pedir explicaciones personales.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Puedes facilitar comodidad sin conocer ni divulgar información personal.",
      illustrationKey: "weight_shift",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_asentir_seguimiento",
      name: "Asentir para indicar seguimiento",
      category: CategoryType.lenguajeCorporal,
      bodyPart: "Cabeza",
      summary:
          "Un cliente asiente mientras explicas opciones, pero aún no ha elegido ninguna.",
      physiologicalDetails:
          "Pequeños movimientos de cabeza durante tu intervención.",
      probableMeaning:
          "Puede indicar que sigue la explicación, sin comprometerse a comprar.",
      alternativeMeanings: [
        "Señal de escucha",
        "cortesía",
        "invitación a continuar"
      ],
      contextGuidance:
          "Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
      whatToDo:
          "Pregunta qué opción prefiere y solicita una confirmación explícita antes de tramitar.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Seguir una explicación, comprenderla y aceptar una propuesta son cosas distintas.",
      illustrationKey: "head_tilt",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_orientacion_material",
      name: "Cuerpo orientado hacia un material compartido",
      category: CategoryType.lenguajeCorporal,
      bodyPart: "Torso",
      summary:
          "En una tutoría, el estudiante gira hacia la pantalla en vez de hacia ti.",
      physiologicalDetails:
          "Torso y mirada se orientan al ejemplo que están revisando.",
      probableMeaning: "Puede estar atendiendo al objeto de trabajo conjunto.",
      alternativeMeanings: [
        "Necesidad de leer",
        "búsqueda de un detalle",
        "postura cómoda"
      ],
      contextGuidance:
          "En tareas conjuntas, la atención puede dirigirse al mismo objeto y no al rostro.",
      whatToDo:
          "Ubica el material donde ambos puedan verlo y pregunta qué paso revisan.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. En tareas conjuntas, la atención puede dirigirse al mismo objeto y no al rostro.",
      illustrationKey: "context_tarea_compartida",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_paso_atras",
      name: "Retroceder para ajustar la distancia",
      category: CategoryType.proxemica,
      bodyPart: "Espacio",
      summary:
          "Al iniciar una conversación en un pasillo, tu interlocutor da un paso atrás.",
      physiologicalDetails:
          "Aumenta la separación manteniendo la conversación.",
      probableMeaning:
          "Puede estar ajustando su espacio disponible o preferido.",
      alternativeMeanings: [
        "Paso de otras personas",
        "necesidad de ver mejor",
        "comodidad"
      ],
      contextGuidance:
          "El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
      whatToDo:
          "Conserva el espacio nuevo y pregunta si ese lugar le resulta cómodo.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. El espacio puede ajustarse sin convertirlo en una evaluación de la relación.",
      illustrationKey: "proxemics_personal",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_saludo_sin_contacto",
      name: "Saludo sin contacto físico",
      category: CategoryType.proxemica,
      bodyPart: "Espacio",
      summary:
          "Una nueva colega saluda con la mano cuando le ofreces un apretón.",
      physiologicalDetails:
          "Mantiene la mano a distancia y acompaña el saludo con palabras.",
      probableMeaning: "Está eligiendo una forma de saludo sin contacto.",
      alternativeMeanings: [
        "Preferencia personal",
        "costumbre",
        "cuidado del espacio"
      ],
      contextGuidance:
          "Aceptar una modalidad de saludo evita convertir una preferencia corporal en un conflicto.",
      whatToDo: "Devuelve el saludo sin tocar y continúa la presentación.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Aceptar una modalidad de saludo evita convertir una preferencia corporal en un conflicto.",
      illustrationKey: "proxemics_social",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_espacio_movilidad",
      name: "Espacio para moverse y maniobrar",
      category: CategoryType.proxemica,
      bodyPart: "Espacio",
      summary:
          "En una mesa de trabajo, una persona pide que apartes una silla del pasillo.",
      physiologicalDetails:
          "Señala una zona de paso y espera antes de avanzar.",
      probableMeaning: "Puede necesitar una ruta despejada para desplazarse.",
      alternativeMeanings: [
        "Movilidad",
        "transporte de objetos",
        "acceso a una salida"
      ],
      contextGuidance:
          "Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
      whatToDo:
          "Despeja el paso y pregunta antes de mover pertenencias o ayudas de movilidad.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Facilitar el acceso no autoriza a manipular objetos personales ni a decidir por otra persona.",
      illustrationKey: "proxemics_social",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_privacidad_distancia",
      name: "Elegir distancia para una conversación privada",
      category: CategoryType.proxemica,
      bodyPart: "Espacio",
      summary: "Un compañero baja la voz y propone hablar lejos del mostrador.",
      physiologicalDetails: "Señala un lugar apartado antes de dar detalles.",
      probableMeaning:
          "Puede buscar privacidad para el asunto que quiere tratar.",
      alternativeMeanings: [
        "Datos personales",
        "evitar interrupciones",
        "discreción"
      ],
      contextGuidance:
          "La privacidad se acuerda; no necesitas anticipar el contenido para ofrecerla.",
      whatToDo:
          "Pregunta si prefiere un lugar privado y acuerden dónde conversar.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. La privacidad se acuerda; no necesitas anticipar el contenido para ofrecerla.",
      illustrationKey: "proxemics_personal",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_contraluz",
      name: "Contraluz que oculta el rostro",
      category: CategoryType.entornoApariencia,
      bodyPart: "Espacio y Entorno",
      summary:
          "En una llamada, una ventana ilumina la espalda de la persona y su cara queda oscura.",
      physiologicalDetails:
          "La cámara muestra una silueta con pocos detalles faciales.",
      probableMeaning:
          "La imagen limita lo que puedes observar de su expresión.",
      alternativeMeanings: [
        "Posición de la cámara",
        "exposición automática",
        "iluminación"
      ],
      contextGuidance:
          "La calidad de la imagen modifica tu información, no demuestra una actitud.",
      whatToDo:
          "Si necesita verse mejor, propone ajustar la luz sin convertirlo en obligación.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. La calidad de la imagen modifica tu información, no demuestra una actitud.",
      illustrationKey: "lighting_atmosphere",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_mesa_accesible",
      name: "Distribución que facilita la participación",
      category: CategoryType.entornoApariencia,
      bodyPart: "Espacio y Entorno",
      summary:
          "En un taller, una columna y varias sillas impiden que dos personas vean el material.",
      physiologicalDetails:
          "Parte del grupo gira el cuerpo y se estira para ver.",
      probableMeaning:
          "La disposición del espacio puede estar dificultando participar.",
      alternativeMeanings: [
        "Líneas de visión bloqueadas",
        "distancia al material"
      ],
      contextGuidance:
          "Revisar quién puede ver, oír y acceder al material forma parte de preparar la conversación.",
      whatToDo:
          "Pregunta si todos ven y redistribuye el material o los asientos con el grupo.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Revisar quién puede ver, oír y acceder al material forma parte de preparar la conversación.",
      illustrationKey: "context_acceso_espacio",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_ruido_fondo",
      name: "Ruido de fondo y comprensión",
      category: CategoryType.entornoApariencia,
      bodyPart: "Espacio y Entorno",
      summary:
          "Una persona pide que repitas una instrucción junto a una máquina encendida.",
      physiologicalDetails: "Acerca el oído y pide repetir varias veces.",
      probableMeaning:
          "El ruido puede estar impidiendo entender la instrucción.",
      alternativeMeanings: [
        "Sonidos que compiten",
        "distancia",
        "términos desconocidos"
      ],
      contextGuidance:
          "Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
      whatToDo:
          "Reduce el ruido si es posible y ofrece la instrucción escrita o un lugar tranquilo.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Ajusta el canal antes de atribuir el problema a la motivación de la persona.",
      illustrationKey: "desk_barrier",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_ropa_contexto",
      name: "Vestimenta y expectativas del contexto",
      category: CategoryType.entornoApariencia,
      bodyPart: "Espacio y Entorno",
      summary: "Un profesional llega con ropa informal a una reunión técnica.",
      physiologicalDetails: "La ropa difiere de la del resto del grupo.",
      probableMeaning:
          "La apariencia no basta para evaluar capacidad o preparación.",
      alternativeMeanings: [
        "Comodidad",
        "costumbre del equipo",
        "necesidades de la tarea"
      ],
      contextGuidance:
          "Distingue una norma explícita del contexto de una impresión personal sobre la apariencia.",
      whatToDo:
          "Evalúa su aporte y explica requisitos concretos de vestimenta solo si existen.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Distingue una norma explícita del contexto de una impresión personal sobre la apariencia.",
      illustrationKey: "dress_casual",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_camara_apagada",
      name: "Cámara apagada con participación activa",
      category: CategoryType.comunicacionDigital,
      bodyPart: "Digital",
      summary:
          "En una reunión remota, alguien mantiene la cámara apagada y responde por audio.",
      physiologicalDetails:
          "No hay imagen, pero sí preguntas y respuestas relacionadas con la tarea.",
      probableMeaning:
          "La falta de vídeo no permite inferir desconexión del trabajo.",
      alternativeMeanings: [
        "Conexión limitada",
        "privacidad",
        "preferencia de participación"
      ],
      contextGuidance:
          "La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
      whatToDo:
          "Acuerden cómo participar y confirma si el audio o chat le funciona.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. La participación se puede comprobar por sus aportes y acuerdos, no por vigilar el entorno privado.",
      illustrationKey: "context_chat_remoto",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_reaccion_no_acuerdo",
      name: "Reacción a un mensaje y acuerdo explícito",
      category: CategoryType.comunicacionDigital,
      bodyPart: "Digital",
      summary:
          "Envías una propuesta con dos fechas y recibes una reacción de pulgar arriba.",
      physiologicalDetails:
          "Hay una reacción, sin texto que indique la fecha elegida.",
      probableMeaning:
          "Puede confirmar lectura o valoración sin resolver la elección.",
      alternativeMeanings: [
        "Acuse de recibo",
        "apoyo general",
        "costumbre del chat"
      ],
      contextGuidance:
          "Cuando una decisión tiene consecuencias, solicita la información que falta de forma explícita.",
      whatToDo: "Pregunta cuál fecha confirma antes de hacer la reserva.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Cuando una decisión tiene consecuencias, solicita la información que falta de forma explícita.",
      illustrationKey: "digital_emojis",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_respuesta_diferida",
      name: "Respuesta diferida en trabajo asíncrono",
      category: CategoryType.comunicacionDigital,
      bodyPart: "Digital",
      summary:
          "Un mensaje enviado por la tarde aparece leído y se responde a la mañana siguiente.",
      physiologicalDetails: "Hay un intervalo entre lectura y respuesta.",
      probableMeaning:
          "El intervalo por sí solo no explica la intención de la persona.",
      alternativeMeanings: [
        "Horario",
        "prioridades",
        "necesidad de comprobar información"
      ],
      contextGuidance:
          "Las expectativas de respuesta deben acordarse según la tarea y el horario.",
      whatToDo:
          "Indica un plazo concreto y acuerda un canal para urgencias reales.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Las expectativas de respuesta deben acordarse según la tarea y el horario.",
      illustrationKey: "digital_visto",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
    GestureItem(
      id: "context_mensaje_breve",
      name: "Brevedad sin tono audible",
      category: CategoryType.comunicacionDigital,
      bodyPart: "Digital",
      summary:
          "Una compañera responde «recibido» a un documento y continúa trabajando.",
      physiologicalDetails:
          "Mensaje corto sin emojis ni otra información emocional.",
      probableMeaning: "La brevedad no permite determinar su estado de ánimo.",
      alternativeMeanings: [
        "Estilo directo",
        "respuesta desde móvil",
        "falta de tiempo"
      ],
      contextGuidance:
          "Aclara la tarea pendiente antes de atribuir emociones a la puntuación o longitud del mensaje.",
      whatToDo:
          "Si necesitas una revisión, pregunta cuándo podrá enviarte comentarios.",
      salesTip:
          "En una conversación profesional, verifica necesidades y acuerdos antes de avanzar. Aclara la tarea pendiente antes de atribuir emociones a la puntuación o longitud del mensaje.",
      illustrationKey: "digital_visto",
      difficulty: 2,
      signalType: SignalTrafficLight.yellow,
    ),
  ];
}
