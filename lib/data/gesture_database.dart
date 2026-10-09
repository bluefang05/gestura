import 'gesture_expansion.dart';
import '../models/gesture_item.dart';
import '../core/utils/search_utils.dart';
import '../models/category.dart';

class GestureDatabase {
  static const List<GestureItem> items = [
    // --- EXPRESIONES FACIALES ---
    GestureItem(
      id: 'sonrisa_genuina',
      name: 'Sonrisa con arrugas junto a los ojos',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos y Boca',
      summary:
          'Sonrisa que mueve la boca y eleva las mejillas, con arrugas junto a los ojos. No permite saber por sí sola qué siente alguien.',
      physiologicalDetails:
          'Se elevan las comisuras de los labios y las mejillas; pueden aparecer pequeñas arrugas junto a los ojos.',
      probableMeaning:
          'Puede acompañar alegría, cortesía, comodidad o una respuesta aprendida para la situación.',
      alternativeMeanings: [
        'Hábito expresivo personal',
        'Sonreír mientras se procesa información'
      ],
      contextGuidance:
          "La constricción alrededor de los ojos se ha asociado con emoción positiva y con la impresión de alegría en estudios. La relación depende del contexto y no basta para certificar una emoción o la sinceridad.",
      whatToDo:
          'Corresponde con calidez, sin asumir acuerdo ni bienestar; deja espacio para que la persona matice con palabras.',
      salesTip:
          'No la uses como señal de compra. Confirma necesidades, dudas y próximos pasos de forma explícita.',
      reading: GestureReading.possibleOpenness,
      illustrationKey: 'duchenne_smile',
      difficulty: 1,
    ),
    GestureItem(
      id: 'sonrisa_social',
      name: "Sonrisa con poco movimiento alrededor de los ojos",
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca',
      summary:
          "Los labios se mueven al sonreír y se observa poco cambio alrededor de los ojos.",
      physiologicalDetails:
          'Los labios se estiran hacia los lados. Las mejillas pueden subir menos y quizá no aparezcan arrugas junto a los ojos.',
      probableMeaning:
          'Puede ser cortesía, amabilidad, nerviosismo, concentración o la forma habitual de sonreír.',
      alternativeMeanings: [
        'Deseo de no crear tensión',
        'Una sonrisa breve o contenida'
      ],
      contextGuidance:
          "El movimiento de los ojos, la intensidad y la duración influyen en cómo se percibe una sonrisa. Sin arrugas visibles también puede haber alegría; «social» no significa falsa.",
      whatToDo:
          'No uses la sonrisa para decidir si hay acuerdo. Si necesitas saberlo, formula una pregunta clara y opcional.',
      salesTip:
          'Una sonrisa no sustituye la confirmación. Ofrece una pregunta abierta y permite que la respuesta sea “aún no lo sé”.',
      illustrationKey: 'polite_smile',
      difficulty: 2,
    ),
    GestureItem(
      id: 'ceno_fruncido',
      name: 'Ceño Fruncido',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Cejas y Frente',
      summary:
          'Cejas juntas y hacia abajo, con líneas verticales en el entrecejo.',
      physiologicalDetails:
          'Las cejas se juntan o bajan; a veces también se aprietan los labios.',
      probableMeaning:
          'Concentración profunda, desacuerdo, confusión o preocupación.',
      alternativeMeanings: [
        'Miopía/dificultad para ver',
        'Luz solar intensa',
        'Dolor de cabeza'
      ],
      contextGuidance:
          'Puede aparecer al pensar, hacer esfuerzo visual, sentir dolor o reaccionar a un tema. No distingue por sí solo entre duda y desacuerdo.',
      whatToDo:
          'Pregunta con calma: "¿Tiene sentido lo que acabo de explicar o hay alguna duda?"',
      salesTip:
          'Úsalo solo como invitación a comprobar comprensión: pausa y pregunta si quieres aclarar algo.',
      illustrationKey: 'frowning_brow',
      difficulty: 1,
    ),
    GestureItem(
      id: 'ojos_entrecerrados',
      name: 'Entrecerrar los ojos',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary: 'Entrecerrar los ojos mientras mira a la otra persona.',
      physiologicalDetails:
          'Se tensa un poco el párpado inferior, sin una sonrisa visible.',
      probableMeaning:
          'Puede acompañar enfoque visual, cansancio ocular, luz intensa, dolor de cabeza o evaluación de la información.',
      alternativeMeanings: ['Esfuerzo visual', 'Cansancio ocular'],
      contextGuidance:
          'El entorno, la iluminación y la salud visual importan tanto como el contenido de la conversación.',
      whatToDo:
          'Aporta datos concretos, ejemplos verificables o pregunta qué aspecto genera dudas.',
      salesTip:
          'No supongas escepticismo. Pregunta qué información sería útil y ofrece evidencia si la persona la solicita.',
      illustrationKey: 'narrowed_eyes',
      difficulty: 2,
    ),
    GestureItem(
      id: 'guino',
      name: 'El Guiño',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary: 'Cierre deliberado y rápido de un solo ojo.',
      physiologicalDetails: 'Cierre breve de un solo ojo.',
      probableMeaning:
          'Complicidad, broma compartida, entendimiento mutuo o coquetería.',
      alternativeMeanings: [
        'Tic nervioso ocular',
        'Molestia en el ojo (pestaña)'
      ],
      contextGuidance:
          'En amigos/pareja es cercanía afectuosa. En el trabajo puede ser broma entre colegas cercanos.',
      whatToDo:
          'Entiende que hay un código compartido o humor implícito; responde con una sonrisa ligera.',
      salesTip:
          'Usa la complicidad para cerrar acuerdos cuando ya existe alta simpatía mutua.',
      illustrationKey: 'winking_face',
      difficulty: 1,
    ),
    GestureItem(
      id: 'mirada_desden',
      name: 'Elevar un lado de la boca',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca y Ojos',
      summary: 'Un lado de la boca se eleva más que el otro.',
      physiologicalDetails:
          'Se eleva un lado del labio. Puede ser una forma habitual de sonreír o una diferencia natural entre ambos lados de la cara.',
      probableMeaning:
          'Puede ser una sonrisa, una costumbre o una diferencia natural entre ambos lados de la cara. No demuestra desprecio.',
      alternativeMeanings: ['Asimetría facial natural al hablar o sonreír'],
      contextGuidance:
          'En discusiones puede coexistir con humor, tensión, timidez o asimetría habitual; no permite asegurar por sí sola qué piensa la persona.',
      whatToDo:
          'Mantén la calma y el tono neutro. No supongas mala intención de inmediato; pide aclaraciones con tranquilidad.',
      salesTip:
          'Alerta de incomodidad: la persona puede sentirse incomprendida o en desacuerdo. Pide su opinión con humildad.',
      illustrationKey: 'smirk_contempt',
      difficulty: 2,
    ),
    GestureItem(
      id: 'labios_apretados',
      name: 'Labios Apretados / Comprimidos',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca',
      summary: 'Labios apretados formando una línea delgada y recta.',
      physiologicalDetails:
          'Los labios se aprietan y se meten un poco hacia dentro.',
      probableMeaning:
          "Puede acompañar concentración, molestias físicas, una costumbre o tensión. No permite deducir una opinión oculta.",
      alternativeMeanings: [
        "Hábito al concentrarse",
        "Molestia o sequedad en los labios"
      ],
      contextGuidance:
          "El movimiento puede aparecer en distintas situaciones; no indica por sí solo que la persona evite hablar o esté en desacuerdo.",
      whatToDo:
          "Si necesitas una respuesta, pregunta qué piensa y deja tiempo para responder, sin cuestionar su sinceridad.",
      salesTip:
          "Pregunta si quiere revisar algo de la propuesta; apretar los labios no identifica una objeción.",
      reading: GestureReading.possibleTension,
      illustrationKey: 'tight_lips',
      difficulty: 2,
    ),
    GestureItem(
      id: 'mirada_sorpresa',
      name: 'Mirada de Sorpresa',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Cejas y Boca',
      summary: 'Cejas elevadas, ojos muy abiertos y boca ligeramente abierta.',
      physiologicalDetails:
          'Se elevan las cejas, se abren los ojos y puede abrirse un poco la boca.',
      probableMeaning:
          'Puede acompañar sorpresa, atención intensa, esfuerzo visual, una reacción aprendida o una condición del entorno.',
      alternativeMeanings: [
        'Puede estar pensando, descansando la vista o prestando atención a otra cosa.'
      ],
      contextGuidance:
          'Una expresión breve no confirma el impacto emocional. Da tiempo y pregunta qué necesita la persona.',
      whatToDo:
          'Espera a que la persona asimile la información antes de continuar con más datos.',
      salesTip:
          'Si es una sorpresa positiva, consolida el beneficio. Si es negativa (ej. por el precio), desglosa el valor.',
      illustrationKey: 'surprised_look',
      difficulty: 1,
    ),
    GestureItem(
      id: 'mirada_esquiva',
      name: 'Mirada Esquiva',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary:
          'Evitar el contacto visual o mirar hacia abajo/lados repetidamente.',
      physiologicalDetails: 'Apartar la mirada por un momento.',
      probableMeaning:
          'Timidez, incomodidad, demasiados estímulos, inseguridad o ganas de cambiar de tema.',
      alternativeMeanings: [
        'En personas autistas es una forma de procesar mejor la información auditiva.',
        'Respeto en ciertas culturas asiáticas/indígenas.'
      ],
      contextGuidance:
          'En una entrevista, algunas personas pueden interpretar que mirar a otro sitio significa falta de confianza. Pero no mirar a los ojos no demuestra desinterés.',
      whatToDo:
          'No presiones el contacto visual; crea un ambiente relajado y habla sin invadir su espacio.',
      salesTip:
          'El cliente se siente presionado por una venta agresiva. Baja la intensidad y dale aire.',
      illustrationKey: 'averted_gaze',
      difficulty: 2,
    ),
    GestureItem(
      id: 'parpados_cerrados',
      name: 'Cierre breve de los ojos',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary: 'La persona cierra los ojos brevemente durante una conversación.',
      physiologicalDetails:
          'Es una observación del movimiento; por sí sola no permite saber si fue voluntario ni por qué ocurrió.',
      probableMeaning:
          'No tiene un significado único. Puede coincidir con un parpadeo, descanso ocular, concentración u otras circunstancias.',
      alternativeMeanings: [
        'Parpadeo o hábito individual.',
        'Descanso ocular, concentración o cansancio.',
      ],
      contextGuidance:
          'El momento y la situación ayudan a decidir si hace falta aclarar algo; el gesto no demuestra desconexión ni frustración.',
      whatToDo:
          'Continúa con naturalidad. Si la conversación se detuvo o algo quedó poco claro, pregunta si desea una pausa o una aclaración.',
      salesTip:
          'No concluyas que la explicación fue excesiva por este gesto. Puedes preguntar si quiere revisar algún punto.',
      reading: GestureReading.possibleTension,
      illustrationKey: 'closed_eyelids',
      difficulty: 3,
    ),
    GestureItem(
      id: 'mandibula_apretada',
      name: 'Mandíbula apretada',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca',
      summary:
          'Apretar los dientes. Puede notarse tensión a los lados de la mandíbula.',
      physiologicalDetails: 'La mandíbula se tensa al apretar los dientes.',
      probableMeaning:
          'Puede acompañar tensión, concentración, esfuerzo físico o el hábito de apretar los dientes. No permite saber por sí sola qué siente la persona.',
      alternativeMeanings: [
        'Apretar o rechinar los dientes sin darse cuenta.',
        'Esfuerzo físico o concentración motriz intensa.',
        'Reacción pasajera a un estímulo o tensión corporal general.',
      ],
      contextGuidance:
          'Observa si la tensión aparece también en otras situaciones. Si necesitas saber cómo se siente la persona, pregúntalo sin atribuirle enfado.',
      whatToDo:
          'Haz una pausa. Permite que la persona se exprese antes de continuar argumentando.',
      salesTip:
          'La persona podría tener una duda o sentirse incómoda. Pregunta con calma si quiere aclarar algo.',
      reading: GestureReading.possibleTension,
      illustrationKey: 'jaw_clenching',
      difficulty: 2,
    ),
    GestureItem(
      id: 'morder_labio',
      name: 'Morderse el Labio Inferior',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca',
      summary:
          'Atrapar el labio inferior con los dientes superiores suavemente.',
      physiologicalDetails:
          'Presión dental sobre el labio inferior con mirada fija o vacilante.',
      probableMeaning:
          'Puede haber varias razones; observa la situación y pregunta si necesitas saberlo.',
      alternativeMeanings: [
        'Labios resecos o búsqueda de humectación.',
        'Hábito oral de concentración motriz.',
        'Inseguridad o duda momentánea.',
      ],
      contextGuidance:
          "Puede aparecer al concentrarse o por comodidad, sequedad o hábito. No identifica una decisión arriesgada.",
      whatToDo:
          "Si hay una decisión pendiente, ofrece tiempo e información sin atribuir indecisión al gesto.",
      salesTip:
          'Si necesitas aclarar una decisión, pregunta qué información falta. El movimiento de los labios no permite deducir indecisión.',
      illustrationKey: 'lip_biting',
      difficulty: 2,
    ),
    GestureItem(
      id: 'flash_cejas',
      name: 'Flash de Cejas (Reconocimiento Rápido)',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Cejas',
      summary:
          'Elevación instantánea de ambas cejas (1/6 de segundo) al ver a alguien.',
      physiologicalDetails: 'Las cejas suben brevemente.',
      probableMeaning:
          'Puede acompañar reconocimiento, saludo o sorpresa. Su significado cambia según la persona y la situación.',
      alternativeMeanings: [
        'Sorpresa fugaz ante un estímulo repentino.',
        'Ajuste de visión o iluminación ambiental.',
      ],
      contextGuidance:
          'Algunas personas levantan las cejas brevemente al saludar.',
      whatToDo: 'Devuelve una sonrisa y un saludo cálido.',
      salesTip:
          'Puede ser un saludo o reconocimiento. Pregunta si es buen momento para conversar; el gesto no confirma disponibilidad.',
      reading: GestureReading.possibleOpenness,
      illustrationKey: 'eyebrow_flash',
      difficulty: 1,
    ),
    GestureItem(
      id: 'pupilas_dilatadas',
      name: 'Pupilas más grandes',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary: 'Las pupilas se ven más grandes aunque la luz parezca igual.',
      physiologicalDetails:
          'Las pupilas pueden cambiar por la luz, algunos medicamentos u otras causas. Mirarlas no permite saber qué piensa alguien.',
      probableMeaning:
          'Interés, atracción, cansancio o muchas cosas en las que pensar.',
      alternativeMeanings: [
        'Efecto de medicamentos o gotas oftálmicas.',
        'Adaptación a sombras o cambio de luz.',
        'Puede estar pensando mucho o prestando atención a varias cosas.',
      ],
      contextGuidance:
          'La luz y algunas medicinas también pueden cambiar el tamaño de las pupilas.',
      whatToDo:
          'No adivines el interés por el tamaño de las pupilas. Pregunta si quiere seguir hablando del tema.',
      salesTip:
          'Este cambio no confirma interés. Pregunta qué le parece la propuesta.',
      illustrationKey: 'pupil_dilation',
      difficulty: 3,
    ),
    GestureItem(
      id: 'aleteo_nasal',
      name: 'Aleteo Nasal (Expansión de Fosas)',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Nariz',
      summary:
          'Apertura y ensanchamiento de las aletas de la nariz mientras se respira.',
      physiologicalDetails:
          'Las aletas de la nariz se abren un poco al respirar.',
      probableMeaning:
          "Puede acompañar cambios en la respiración, esfuerzo físico o molestias nasales. No identifica una emoción.",
      alternativeMeanings: [
        'Falta de aire, congestión nasal o esfuerzo físico previo.',
        'Respiración profunda voluntaria para oxigenarse o relajarse.',
        'Reacción a olores o alérgenos en el ambiente.',
      ],
      contextGuidance:
          'Puede acompañar emociones intensas o respuestas fisiológicas respiratorias.',
      whatToDo:
          "No atribuyas agitación emocional al movimiento. Si necesitas saber si la persona quiere una pausa, pregúntalo.",
      salesTip:
          "Comprueba si es buen momento para continuar; el movimiento nasal no confirma tensión comercial.",
      reading: GestureReading.possibleTension,
      illustrationKey: 'nostril_flaring',
      difficulty: 2,
    ),

    // --- FACTORES PARALINGÜÍSTICOS (VOZ Y SILENCIOS) ---
    GestureItem(
      id: 'volumen_alto',
      name: 'Volumen de Voz Elevado',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Hablar con una intensidad y decibeles notablemente por encima del promedio del lugar.',
      physiologicalDetails:
          'Mayor presión del aire pulmonar a través de las cuerdas vocales.',
      probableMeaning:
          "Puede relacionarse con ruido ambiental, audición, hábito al hablar o entusiasmo. No identifica dominancia.",
      alternativeMeanings: [
        'Dificultades de audición (dificultad para oír) o ruido de fondo elevado.',
        'Hábito cultural o familiar de conversación enérgica.',
        'Entusiasmo genuino por el tema tratado.',
      ],
      contextGuidance:
          'En oficinas abiertas puede resultar invasivo o abrumador.',
      whatToDo:
          "Usa un volumen cómodo para ambos y pregunta si se oye bien o si conviene cambiar de lugar.",
      salesTip:
          "Acuerden un volumen y un canal que permitan entenderse; imitar la intensidad de la voz no garantiza sintonía.",
      reading: GestureReading.ambiguous,
      illustrationKey: 'voice_volume_high',
      difficulty: 1,
    ),
    GestureItem(
      id: 'volumen_bajo',
      name: 'Volumen de Voz Bajo (Susurro)',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          "La voz se oye con poca intensidad en ese entorno. Hablar bajo y susurrar no son lo mismo.",
      physiologicalDetails: 'La voz sale suave y con poco volumen.',
      probableMeaning:
          'Timidez, confidencialidad, reserva o necesidad de discreción.',
      alternativeMeanings: [
        'Afonía, fatiga vocal o molestia en la garganta.',
        'Respeto a normas de silencio del entorno.',
        'Preferencia por un canal de comunicación suave.',
      ],
      contextGuidance: 'En confidencias o cuando se tocan temas íntimos.',
      whatToDo:
          "Puedes pedir que repita, cambiar de lugar o proponer otro canal. Pregunta antes de acercarte.",
      salesTip:
          "Presenta los datos con un volumen audible; hablar bajo no garantiza expectación ni exclusividad.",
      illustrationKey: 'voice_volume_low',
      difficulty: 1,
    ),
    GestureItem(
      id: 'velocidad_rapida',
      name: 'Velocidad de Habla Acelerada',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          "Hablar a un ritmo que resulta rápido para quien escucha. No hay un umbral único de palabras por minuto para todas las situaciones.",
      physiologicalDetails:
          "El ritmo se puede describir contando palabras por minuto o comparando la duración de una misma frase. El valor depende del idioma, las pausas y la tarea.",
      probableMeaning:
          'Ansiedad, urgencia, nerviosismo, o pasión desbordante por el tema.',
      alternativeMeanings: [
        'Hábito cultural o dialecto de ritmo ágil.',
        'Entusiasmo o ganas de hablar en detalle sobre un tema que interesa.',
        'Urgencia temporal real o temor a ser interrumpido.',
      ],
      contextGuidance:
          "El ritmo cambia entre personas, idiomas y situaciones. No permite inferir temor a ser interrumpido.",
      whatToDo:
          'Haz pausas para que la otra persona pueda seguir la conversación a su ritmo.',
      salesTip:
          "Adaptar el ritmo puede reducir el esfuerzo de escucha en algunas condiciones. Ofrece pausas o un resumen escrito y comprueba qué ayuda; no hay una velocidad que garantice credibilidad.",
      illustrationKey: 'voice_speed_fast',
      difficulty: 2,
    ),
    GestureItem(
      id: 'tono_monotono',
      name: 'Tono Monótono o Plano',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary: 'Hablar en un solo tono sin subidas ni bajadas de frecuencia.',
      physiologicalDetails:
          'La voz cambia poco de tono. Puede ser una forma habitual de hablar.',
      probableMeaning:
          'Estilo de comunicación directo, agotamiento extremo o baja expresividad emocional.',
      alternativeMeanings: [
        'Algunas personas hablan con pocas subidas y bajadas en la voz. Eso no significa que estén desinteresadas.',
        'Agotamiento físico, estrés crónico o fatiga extrema.',
        'Foco analítico riguroso en datos objetivos sin florituras.',
      ],
      contextGuidance:
          'Una voz con pocas variaciones es una forma válida de hablar y no permite saber cuánto interés tiene alguien.',
      whatToDo:
          'No asumas desinterés: juzga por el contenido de sus ideas y facilita la conversación.',
      salesTip:
          'Si un cliente habla en tono monótono, mantente objetivo y enfócate en datos claros y comprobables.',
      illustrationKey: 'voice_monotone',
      difficulty: 1,
    ),
    GestureItem(
      id: 'tono_sarcastico',
      name: "Palabras y tono que pueden parecer irónicos",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Las palabras suenan positivas, pero la voz suena seria o apagada. Puede haber muchas razones; pregunta antes de sacar conclusiones.',
      physiologicalDetails:
          "Puede haber sílabas alargadas, una voz plana o cambios de entonación. Esas características también aparecen al hablar sin ironía.",
      probableMeaning:
          "En estudios de sarcasmo en inglés aparecen pistas vocales como un tono más grave o menor variación tonal. En una conversación también pueden tener otras causas; combina voz, palabras y contexto.",
      alternativeMeanings: [
        "Valoración literal con voz poco expresiva",
        "Humor compartido",
        "Cansancio o hábito vocal"
      ],
      contextGuidance:
          "Escucha si el tono cambia respecto a otras frases y cómo encajan las palabras con lo ocurrido. La frase «qué gran idea» podría ser literal o irónica; el contexto compartido ayuda a interpretarla.",
      whatToDo:
          "Si importa entender el sentido, pregunta: «¿Lo dices en serio o con ironía?». También puedes aclarar tu propia propuesta.",
      salesTip:
          "Aclara qué parte de la propuesta quiere revisar, sin etiquetar a la persona como sarcástica.",
      reading: GestureReading.ambiguous,
      illustrationKey: 'sarcastic_inflection',
      difficulty: 2,
    ),
    GestureItem(
      id: 'tono_asertivo',
      name: 'Hablar con claridad y respeto',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          "Expresar una petición, una opinión o un límite de forma comprensible y respetuosa.",
      physiologicalDetails:
          "El volumen, el ritmo y la entonación pueden variar. Una voz temblorosa, una pausa o hablar por escrito también permiten expresar un límite.",
      probableMeaning:
          "La asertividad se aprecia en lo que se comunica y en el respeto de las decisiones, no en una frecuencia de voz ni en una postura fija.",
      alternativeMeanings: [
        "Un tono firme puede acompañar mensajes respetuosos o irrespetuosos; importa el contenido."
      ],
      contextGuidance:
          "Por ejemplo: «No puedo hacerlo hoy. Puedo revisarlo mañana». Es una opción de comunicación, no una técnica que garantice obediencia.",
      whatToDo:
          "Aclara qué se solicita, qué puedes ofrecer y qué se ha acordado. Respeta un no y permite preguntas.",
      salesTip:
          'Explica lo que puedes ofrecer y sus límites con claridad. Pregunta si la información responde a sus necesidades.',
      illustrationKey: 'assertive_voice',
      difficulty: 1,
    ),
    GestureItem(
      id: 'silencio_incomodo',
      name: 'Pausa con cambios de postura',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz y Silencio',
      summary:
          'La conversación se detiene mientras la persona cambia la mirada o la postura.',
      physiologicalDetails:
          'Ausencia total de respuesta verbal mientras la respiración se contiene o se tensan hombros y labios.',
      probableMeaning:
          'Puede acompañar incomodidad, reflexión, cansancio o dificultad para encontrar una respuesta. El silencio no identifica su causa.',
      alternativeMeanings: [
        'La persona está procesando una noticia impactante.'
      ],
      contextGuidance:
          'Puede aparecer después de distintos comentarios o preguntas. El momento de la pausa no identifica su causa.',
      whatToDo:
          'Puedes dar tiempo o preguntar si prefiere seguir, hacer una pausa o cambiar de tema. Si sabes que tu comentario fue ofensivo, puedes disculparte sin interpretar el silencio.',
      salesTip:
          'Da tiempo para pensar después de presentar el precio. Pregunta si necesita aclaraciones o una pausa, sin usar el silencio para presionar.',
      reading: GestureReading.possibleTension,
      illustrationKey: 'silence_tense',
      difficulty: 2,
    ),
    GestureItem(
      id: 'silencio_reflexivo',
      name: "Pausa sin respuesta verbal",
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz y Silencio',
      summary:
          "La persona hace una pausa antes de responder. Mirar arriba o a otro sitio no permite saber si está pensando.",
      physiologicalDetails:
          'Rostro relajado, mirada desenfocada o arriba, ceño pensativo sin rigidez.',
      probableMeaning:
          'Puede estar preparando una respuesta, recordando información o pensando en cómo continuar. El silencio no permite evaluar honestidad ni interés.',
      alternativeMeanings: ['Búsqueda de memoria.'],
      contextGuidance:
          "Puede aparecer en cualquier conversación, por distintas razones. No es una medida de calidad de la respuesta.",
      whatToDo:
          "Da tiempo para responder. Si necesitas coordinar la conversación, pregunta si quiere más tiempo, otra explicación o cambiar de tema.",
      salesTip:
          'Deja tiempo para responder. Si la pausa se alarga, pregunta si quiere más tiempo o alguna aclaración.',
      illustrationKey: 'silence_reflective',
      difficulty: 1,
    ),

    // --- POSTURAS Y LENGUAJE CORPORAL ---
    GestureItem(
      id: 'postura_abierta',
      name: 'Postura con brazos y torso despejados',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Torso y Brazos',
      summary:
          'Brazos a los lados o con palmas visibles, torso despejado y orientación frontal.',
      physiologicalDetails:
          'Hombros relajados, pecho descubierto sin barreras de objetos o brazos cruzados, pies orientados hacia ti.',
      probableMeaning:
          'Puede ser una posición cómoda, una preferencia de movimiento, disposición a conversar o simple ausencia de apoyo cercano.',
      alternativeMeanings: [
        'Postura de descanso',
        'Normas culturales o del entorno'
      ],
      contextGuidance:
          'Una postura abierta no confirma comodidad, confianza ni acuerdo. Úsala solo como parte de un contexto más amplio.',
      whatToDo:
          'Comparte tus ideas sin aumentar la presión y comprueba con palabras si la persona quiere continuar.',
      salesTip:
          "Los gestos pueden aportar información mientras explicas: señalar un gráfico o representar un tamaño es una opción. Comprueba comprensión y próximos pasos con palabras; la postura sola no confirma una compra.",
      reading: GestureReading.ambiguous,
      illustrationKey: 'open_posture',
      difficulty: 1,
    ),
    GestureItem(
      id: 'postura_cerrada',
      name: 'Postura Cerrada (Brazos Cruzados)',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Brazos y Torso',
      summary:
          'Brazos cruzados firmemente sobre el pecho, a menudo con hombros encorvados.',
      physiologicalDetails: 'Poner un objeto entre el pecho y la otra persona.',
      probableMeaning:
          'Puede ser comodidad, temperatura, apoyo físico, hábito, reserva o una reacción a la situación.',
      alternativeMeanings: [
        'Frío ambiental en la habitación',
        'Hábito de comodidad al sentarse'
      ],
      contextGuidance:
          'Verifica la temperatura antes de asumir que está molesto.',
      whatToDo:
          'No intentes cambiar la postura de la persona. Ofrece opciones, ajusta el entorno si hace frío y pregunta si necesita una pausa.',
      salesTip:
          'No interpretes una barrera. Haz preguntas abiertas sin exigir respuesta y respeta la comodidad corporal de la persona.',
      illustrationKey: 'closed_posture',
      difficulty: 1,
    ),
    GestureItem(
      id: 'inclinacion_adelante',
      name: 'Inclinarse hacia Adelante (Leaning In)',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Cuerpo y Espina',
      summary:
          'Mover el torso y la cabeza hacia adelante en dirección al hablante.',
      physiologicalDetails:
          'Flexión de cadera y espina acercando el plano corporal al centro de la mesa o conversación.',
      probableMeaning:
          'Puede facilitar la escucha, acompañar interés, compensar una dificultad auditiva o responder a la distribución del espacio.',
      alternativeMeanings: [
        'Problemas auditivos o deseo de oír mejor.',
        'Ajuste ergonómico para ver una pantalla o documento.',
        'Interés genuino o cercanía en la conversación.',
      ],
      contextGuidance:
          'No mide atención ni acuerdo. Observa el contenido de la conversación y ofrece una oportunidad de confirmar.',
      whatToDo:
          'Ofrece la información a un ritmo acordado y pregunta si la persona quiere seguir o necesita que repitas algo.',
      salesTip:
          'No aceleres hacia un cierre por la postura. Pregunta qué le resulta útil y si desea revisar opciones.',
      reading: GestureReading.ambiguous,
      illustrationKey: 'leaning_forward',
      difficulty: 1,
    ),
    GestureItem(
      id: 'inclinacion_atras',
      name: 'Inclinarse hacia Atrás (Leaning Back)',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Cuerpo y Espina',
      summary: 'Inclinar el cuerpo hacia atrás y alejarse un poco.',
      physiologicalDetails:
          'Extensión de columna contra el respaldo de la silla, aumentando la distancia física.',
      probableMeaning:
          'Puede ser comodidad, cansancio, necesidad de espacio, una forma de pensar o evaluación de la situación.',
      alternativeMeanings: [
        'Comodidad ergonómica o descanso tras comer.',
        'Fatiga física o necesidad de estirar la espalda.',
        'Pausa reflexiva para procesar mentalmente la información.',
      ],
      contextGuidance:
          'Un cambio de posición puede responder al asiento, cansancio, dolor o reflexión; su momento no confirma una reacción emocional.',
      whatToDo:
          'Pregunta: "¿Qué te parece hasta aquí? ¿Hay algo que no termine de cuadrar?"',
      salesTip:
          'No asumas distanciamiento. Ofrece una pausa y pregunta si hay algo que aclarar o ajustar.',
      illustrationKey: 'leaning_back',
      difficulty: 2,
    ),
    GestureItem(
      id: 'frotar_manos',
      name: 'Frotarse las Manos',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos',
      summary: 'Frotar palma contra palma con velocidad variable.',
      physiologicalDetails: 'Las manos se frotan rápido o despacio.',
      probableMeaning:
          'Puede aportar calor, regular tensión, acompañar anticipación o ser un movimiento habitual de las manos.',
      alternativeMeanings: [
        'Manos frías o baja temperatura ambiental.',
        'Movimiento repetido que puede ayudar a regularse. Algunas personas lo llaman «stimming».',
        'Anticipación positiva o entusiasmo por una actividad.',
      ],
      contextGuidance: 'En negocios o comidas antes de un buen platillo.',
      whatToDo:
          'Evita atribuir intención según la velocidad. Pregunta directamente si hay alguna expectativa, duda o necesidad.',
      salesTip:
          'No lo uses como indicador de intención de compra. Prioriza lo que la persona expresa y el tiempo que solicita.',
      illustrationKey: 'hand_wringing',
      difficulty: 2,
    ),
    GestureItem(
      id: 'tamborilear_dedos',
      name: 'Tamborilear con los Dedos',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos',
      summary:
          'Golpear la mesa de forma rítmica y continua con la punta de los dedos.',
      physiologicalDetails:
          'Movimiento sucesivo repetitivo del meñique al índice contra una superficie.',
      probableMeaning:
          'Puede regular energía, acompañar una melodía interna, ser un hábito motor o expresar prisa, tensión o espera.',
      alternativeMeanings: [
        'Seguir un compás o melodía musical en la mente.',
        'Movimiento repetido que puede ayudar a concentrarse o regularse.',
        'Inquietud temporal o necesidad de respetar un horario límite.',
      ],
      contextGuidance:
          'Común cuando alguien tiene prisa o siente que se está perdiendo el tiempo.',
      whatToDo:
          'No cambies el ritmo solo por este gesto. Puedes preguntar si el tiempo disponible sigue siendo adecuado.',
      salesTip:
          'No concluyas que se perdió la atención. Puedes ofrecer un resumen o una pausa sin presionar una respuesta.',
      illustrationKey: 'finger_tapping',
      difficulty: 1,
    ),
    GestureItem(
      id: 'encogerse_hombros',
      name: 'Encogerse de Hombros',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Hombros y Manos',
      summary:
          'Elevar ambos hombros hacia las orejas, a menudo mostrando palmas hacia arriba.',
      physiologicalDetails:
          'Se elevan los hombros y las palmas pueden girar hacia arriba.',
      probableMeaning:
          'Suele acompañar incertidumbre o la comunicación de “no lo sé”, pero también puede ser humor, hábito o una respuesta corporal breve.',
      alternativeMeanings: [
        'Indecisión o falta de información sincera.',
        'Gesto casual de modestia o humor.',
        'Reajuste muscular por frío o incomodidad en el cuello.',
      ],
      contextGuidance:
          'La combinación de gestos tampoco resuelve la ambigüedad; el contenido y el contexto siguen siendo necesarios.',
      whatToDo:
          'Si es falta de conocimiento, brinda opciones claras para elegir en lugar de preguntas abiertas.',
      salesTip:
          'Puedes ofrecer opciones simples, dejando claro que la persona también puede pedir más información o no decidir ahora.',
      illustrationKey: 'shrug',
      difficulty: 1,
    ),
    GestureItem(
      id: 'manos_caderas',
      name: 'Manos en Jarra / Caderas',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Brazos y Torso',
      summary:
          'Manos apoyadas en la cintura con los codos abiertos hacia afuera.',
      physiologicalDetails:
          'Extensión lateral de los codos aumentando el espacio visual ocupado por el torso.',
      probableMeaning:
          'Puede ser una forma de descansar, ocupar espacio, prepararse para actuar o un hábito corporal.',
      alternativeMeanings: [
        'Descanso lumbar tras caminar o estar de pie mucho rato.',
        'Comodidad postural de descanso biomecánico.',
        'Disposición activa para emprender una tarea física o mental.',
      ],
      contextGuidance:
          'Puede ser una forma de descansar, ocupar espacio o prepararse para actuar; no confirma autoridad ni confrontación.',
      whatToDo:
          'Mantén una postura que te resulte cómoda y no supongas una competencia. Regula el ritmo con comunicación clara.',
      salesTip:
          'No infieras exigencia. Pregunta qué criterios o información ayudarían a evaluar la propuesta.',
      illustrationKey: 'hands_on_hips',
      difficulty: 2,
    ),
    GestureItem(
      id: 'manos_nuca',
      name: 'Manos Detrás de la Cabeza',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Brazos y Cabeza',
      summary:
          'Manos entrelazadas en la nuca con los codos abiertos y cuerpo recostado.',
      physiologicalDetails:
          'Apertura máxima del pecho y elevación de brazos mientras se ocupa el respaldo.',
      probableMeaning:
          'Puede ser estiramiento, alivio para la espalda, comodidad en el asiento o una manera habitual de escuchar.',
      alternativeMeanings: [
        'Estiramiento muscular por rigidez o tensión lumbar.',
        'Cambio ergonómico de postura en sillas de trabajo.',
        'Sensación de relax y familiaridad con el entorno.',
      ],
      contextGuidance:
          'Común en personas que buscan comodidad física en su espacio.',
      whatToDo:
          "Presenta tu información con claridad y permite una postura cómoda, sin exigir contacto visual.",
      salesTip:
          'No deduzcas jerarquía ni intención. Presenta la información con claridad y pregunta qué desea explorar.',
      illustrationKey: 'hands_behind_head',
      difficulty: 2,
    ),
    GestureItem(
      id: 'manos_ojiva',
      name: 'Yemas de los dedos juntas',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos',
      summary:
          'Yemas de los dedos de ambas manos en contacto formando una pirámide hacia arriba o hacia el frente.',
      physiologicalDetails:
          'Alineación simétrica de las puntas de los dedos sin entrelazar las palmas.',
      probableMeaning:
          'Puede ser una costumbre, una forma de concentrarse o una posición cómoda para las manos.',
      alternativeMeanings: [
        'Costumbre al concentrarse o hablar en público.',
        'Una posición cómoda para las manos.',
        'Una posición aprendida al hablar en público.',
      ],
      contextGuidance:
          'Algunas personas usan esta posición al explicar una idea.',
      whatToDo:
          'Si te resulta cómoda, puedes usar esta posición al hablar. No hace que otras personas te crean más.',
      salesTip:
          'No supone interés técnico. Invita a compartir preguntas o criterios de evaluación, sin presuponerlos.',
      illustrationKey: 'steepling_hands',
      difficulty: 2,
    ),
    GestureItem(
      id: 'cabeza_inclinada',
      name: 'Cabeza Inclinada / Ladeada',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Cabeza y Cuello',
      summary:
          'Inclinar la cabeza hacia un lado exponiendo el cuello mientras se escucha.',
      physiologicalDetails:
          'La cabeza se inclina hacia un lado y deja parte del cuello más visible.',
      probableMeaning:
          'Puede acompañar escucha, curiosidad, una mejor audición por un lado, comodidad cervical o hábito postural.',
      alternativeMeanings: [
        'Esfuerzo por enfocar la audición con un oído específico.',
        'Alivio de fatiga cervical o apoyo de cuello.',
        'Disposición atenta y curiosa hacia el mensaje.',
      ],
      contextGuidance:
          'El significado depende de la conversación, la relación, la audición y la comodidad física; no identifica por sí solo afinidad.',
      whatToDo:
          'No lo tomes como confirmación. Antes de entrar en más detalle, pregunta si la persona quiere continuar o necesita una pausa.',
      salesTip:
          'No infieras afinidad. Construye confianza mediante opciones claras, escucha y acuerdos explícitos.',
      illustrationKey: 'head_tilt',
      difficulty: 1,
    ),
    GestureItem(
      id: 'tocarse_cuello',
      name: 'Tocarse el Cuello / Frotarse la Nuca',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Cuello y Manos',
      summary:
          'Llevar la mano a la garganta, tocar el hueco del cuello o frotar la nuca.',
      physiologicalDetails:
          'La persona se toca o frota el cuello. Puede ser una costumbre, una molestia o una forma de autorregularse; el gesto no revela la causa.',
      probableMeaning:
          'Puede ser una forma de sentirse más cómodo, una costumbre o una reacción a lo que ocurre.',
      alternativeMeanings: [
        'Molestia muscular o dolor cervical real.',
        'Ajuste por temperatura, calor o prenda ajustada.',
        'Un movimiento repetido que puede ayudar a concentrarse o sentirse más cómodo.',
      ],
      contextGuidance:
          'Puede presentarse ante preguntas complejas o temas delicados, pero también por tensión muscular, frío/calor o costumbre corporal.',
      whatToDo:
          'Baja la presión de la conversación y formula preguntas suaves para devolver la tranquilidad, o simplemente permite una pausa natural.',
      salesTip:
          'Puede tener una duda o querer revisar el precio o las condiciones. Haz una pausa y pregunta qué le gustaría aclarar.',
      illustrationKey: 'touching_neck',
      difficulty: 2,
    ),
    GestureItem(
      id: 'brazos_espalda',
      name: 'Manos Tomadas a la Espalda',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Brazos y Torso',
      summary:
          'Caminar o estar de pie con las manos entrelazadas detrás de la espalda y pecho erguido.',
      physiologicalDetails:
          "Las manos se sitúan detrás de la espalda; el torso puede mantenerse erguido.",
      probableMeaning:
          "Puede ser descanso, comodidad, hábito o una postura de espera. No identifica autoridad ni autocontrol.",
      alternativeMeanings: [
        'Contención de tensión si una mano sujeta fuertemente la muñeca contraria.',
        'Postura cómoda para descansar los brazos caminando.',
        'Hábito ergonómico para mantener la espalda erguida.',
      ],
      contextGuidance:
          "Puede aparecer al caminar, esperar o conversar, en personas con distintos roles.",
      whatToDo:
          "Responde a lo que la persona dice y no deduzcas su rol por la postura.",
      salesTip:
          "Pregunta qué información necesita para revisar la propuesta, sin asignarle un papel de evaluador por sus manos.",
      illustrationKey: 'hands_behind_back',
      difficulty: 2,
    ),
    GestureItem(
      id: 'manos_bolsillos',
      name: 'Manos en los Bolsillos',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos y Brazos',
      summary: "La persona coloca las manos dentro de los bolsillos.",
      physiologicalDetails:
          "Las manos descansan en los bolsillos y pueden quedar parcial o totalmente fuera de la vista.",
      probableMeaning:
          'Reserva, timidez, búsqueda de comodidad informal o descanso postural.',
      alternativeMeanings: [
        'Sensación térmica de frío en las manos.',
        'Búsqueda de confort postural casual.',
        'Prendas holgadas o costumbre corporal al estar de pie.',
      ],
      contextGuidance:
          'En ambientes informales es común y relajado; en reuniones muy formales puede leerse erróneamente como desinterés.',
      whatToDo:
          'Invita a la persona a participar haciéndole una pregunta sencilla para que se integre.',
      salesTip:
          "Si te sirve para explicar, puedes usar una mano para señalar un paso de un diagrama o representar un tamaño. Los gestos que acompañan información pueden ayudar a comprenderla; no hace falta mostrar las palmas como prueba de confianza.",
      illustrationKey: 'hands_in_pockets',
      difficulty: 1,
    ),
    GestureItem(
      id: 'piernas_cruzadas',
      name: 'Piernas Cruzadas en 4 o Rodilla',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Piernas y Torso',
      summary: 'Cruzar una pierna sobre la otra mientras se está sentado.',
      physiologicalDetails:
          "Una pierna se coloca sobre la otra. Este cambio puede modificar la inclinación del tronco y la pelvis; se han medido diferencias en estudios de postura sentada.",
      probableMeaning:
          "Puede ser una posición cómoda, un hábito o una forma de descansar. La forma del cruce no identifica dominio ni competitividad.",
      alternativeMeanings: ['Hábito ergonómico de descanso.'],
      contextGuidance:
          "La dirección de una rodilla puede depender del asiento y del espacio. No confirma conexión ni rechazo.",
      whatToDo:
          "Respeta la postura y pregunta si el espacio permite conversar con comodidad.",
      salesTip:
          "Valora las condiciones de negociación expresadas con palabras; cruzar las piernas o sostener un tobillo no define una negociación dura.",
      illustrationKey: 'legs_crossed',
      difficulty: 2,
    ),
    GestureItem(
      id: 'apreton_manos',
      name: 'Apretón de Manos Profesional',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos',
      summary:
          'Contacto manual firme, con las palmas verticales y 2 a 3 oscilaciones.',
      physiologicalDetails:
          'Unión del espacio interdigital entre pulgar e índice con presión simétrica y contacto visual directo.',
      probableMeaning:
          'Puede ser un saludo acordado o una costumbre del entorno. La fuerza del apretón no permite inferir confianza, inseguridad ni intención de intimidar.',
      alternativeMeanings: [
        'La presión puede variar por comodidad, dolor, fuerza física, hábito o preferencia personal.'
      ],
      contextGuidance:
          'Saludo frecuente en algunos entornos profesionales. Las preferencias personales y culturales sobre el contacto varían.',
      whatToDo:
          'Ofrece un saludo sin imponer contacto, presión, sonrisa ni mirada. Respeta si la persona prefiere otra forma de saludar.',
      salesTip:
          'Fíjate en la fuerza del apretón de manos y ofrece uno cómodo. También puedes saludar sin contacto.',
      reading: GestureReading.possibleOpenness,
      illustrationKey: 'handshake_firm',
      difficulty: 1,
    ),
    GestureItem(
      id: 'manos_entrelazadas_frente',
      name: 'Manos Entrelazadas al Frente',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos y Torso',
      summary:
          'Manos unidas de forma suave delante del abdomen, con los codos relajados.',
      physiologicalDetails:
          'Dedos entrelazados o una mano contenida dentro de la otra, sin bloquear el pecho.',
      probableMeaning:
          'Puede acompañar espera, escucha, formalidad o una manera cómoda de colocar las manos.',
      alternativeMeanings: [
        'Frío en las manos',
        'Hábito postural',
        'Necesidad de mantener las manos ocupadas',
      ],
      contextGuidance:
          'Léela junto con el tono, el contexto y los cambios respecto a la postura habitual de la persona.',
      whatToDo:
          'No fuerces una interpretación. Si necesitas claridad, deja espacio para que la persona responda a su ritmo.',
      salesTip:
          'Úsala como señal de pausa: verifica comprensión con una pregunta abierta antes de avanzar.',
      illustrationKey: 'hands_clasped_front',
      difficulty: 1,
    ),
    GestureItem(
      id: 'mano_menton',
      name: 'Mano en el Mentón',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos y Cabeza',
      summary:
          'Una mano sostiene el mentón o descansa junto a la mejilla mientras la persona permanece sentada.',
      physiologicalDetails:
          'Índice sobre la mejilla, pulgar debajo de la mandíbula y apoyo parcial de la cabeza.',
      probableMeaning:
          'Puede coincidir con reflexión, comodidad, cansancio físico o un hábito al escuchar.',
      alternativeMeanings: [
        'Apoyo por fatiga',
        'Molestia mandibular',
        'Postura habitual'
      ],
      contextGuidance:
          'No equivale por sí sola a acuerdo, desacuerdo ni interés; observa qué ocurre antes y después.',
      whatToDo:
          'Dale tiempo para pensar y haz una pregunta sencilla. El gesto no es una respuesta.',
      salesTip:
          'Presenta un dato a la vez y pregunta qué información adicional ayudaría a evaluar la propuesta.',
      illustrationKey: 'hand_on_chin',
      difficulty: 1,
    ),
    GestureItem(
      id: 'cambio_peso',
      name: 'Cambio de Peso al Estar de Pie',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Piernas y Torso',
      summary:
          'El peso descansa principalmente en una pierna y una cadera se desplaza hacia un lado.',
      physiologicalDetails:
          'Una rodilla queda más relajada, mientras la otra pierna sostiene la mayor parte del cuerpo.',
      probableMeaning:
          'Puede ser una forma de descanso, ajuste de comodidad, dolor corporal o preparación para moverse.',
      alternativeMeanings: ['Calzado incómodo', 'Cansancio', 'Hábito postural'],
      contextGuidance:
          'Es más útil observar cambios repetidos o movimientos hacia una salida que una postura aislada.',
      whatToDo:
          'Facilita una pausa, una silla o una salida clara si el contexto sugiere que la persona la necesita.',
      salesTip:
          'Haz un resumen breve y pregunta si es buen momento para continuar, sin suponer impaciencia.',
      illustrationKey: 'weight_shift',
      difficulty: 2,
    ),
    GestureItem(
      id: 'orientacion_pies',
      name: 'Orientación de los Pies',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Piernas y Pies',
      summary:
          'Pies y rodillas se orientan juntos hacia un lado mientras el torso puede seguir mirando al frente.',
      physiologicalDetails:
          'Rotación de tobillos, rodillas o caderas que modifica la dirección de la base corporal.',
      probableMeaning:
          'Puede responder a comodidad, distribución del espacio, preparación para caminar o atención hacia otra zona.',
      alternativeMeanings: [
        'Distribución de muebles',
        'Lesión o rigidez',
        'Costumbre de sentarse de lado'
      ],
      contextGuidance:
          'Comprueba si se repite y contrástala con palabras, mirada y posibilidad real de moverse.',
      whatToDo:
          'No la conviertas en una lectura de intención. Ofrece opciones claras: continuar, pausar o cambiar de lugar.',
      salesTip:
          'Si la conversación se alarga, pregunta si la persona dispone de unos minutos más antes de abrir un tema nuevo.',
      illustrationKey: 'foot_orientation',
      difficulty: 2,
    ),
    GestureItem(
      id: 'autocontacto_brazo',
      name: 'Sujetar el Propio Brazo',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Brazos y Torso',
      summary:
          'Una mano sostiene suavemente el brazo opuesto mientras los brazos quedan cerca del torso.',
      physiologicalDetails:
          'Contacto de la palma o dedos sobre el bíceps o antebrazo contrario, sin presión visible.',
      probableMeaning:
          'Puede ser una postura de comodidad, regulación, frío o una preferencia personal.',
      alternativeMeanings: [
        'Temperatura baja',
        'Dolor de hombro',
        'Hábito al esperar'
      ],
      contextGuidance:
          'Evita etiquetarla como “defensiva”. Una sola postura no explica el estado interno de alguien.',
      whatToDo:
          'Baja la exigencia social y ofrece alternativas concretas si la conversación parece intensa o larga.',
      salesTip:
          'Reduce el ritmo, explica el siguiente paso y permite que la persona decida si desea continuar.',
      illustrationKey: 'self_hold_arm',
      difficulty: 2,
    ),
    GestureItem(
      id: 'sincronia_postural',
      name: 'Posturas parecidas',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Cuerpo y Espacio',
      summary:
          'Dos personas adoptan configuraciones corporales parecidas durante una interacción.',
      physiologicalDetails:
          'Coincidencia temporal de inclinación, apoyo de brazos o orientación, sin que necesariamente sea exacta.',
      probableMeaning:
          'Puede aparecer por comodidad compartida, imitación espontánea, mobiliario similar o ritmo de conversación.',
      alternativeMeanings: [
        'Sillas iguales',
        'Indicaciones del entorno',
        'Casualidad'
      ],
      contextGuidance:
          'La sincronía no demuestra afinidad ni acuerdo; importa si aparece junto con comunicación clara y consentimiento.',
      whatToDo:
          'Úsala sólo como invitación a seguir observando el contexto, no como prueba de conexión.',
      salesTip:
          'Confirma los acuerdos y las dudas con palabras; no los deduzcas por la postura.',
      illustrationKey: 'postural_mirroring',
      difficulty: 3,
    ),

    // --- PROXÉMICA Y ESPACIO ---
    GestureItem(
      id: 'espacio_intimo',
      name: 'Distancia muy cercana',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary: 'Poca separación física entre dos personas.',
      physiologicalDetails: 'Distancia menor a la longitud de un antebrazo.',
      probableMeaning:
          'Puede responder a la relación, al espacio disponible, a una tarea compartida o a una preferencia de distancia. La cercanía no confirma intimidad ni permiso para tocar.',
      alternativeMeanings: [
        'Ascensores o transporte público abarrotado (donde se tolera neutralizando la mirada).'
      ],
      contextGuidance:
          'La comodidad depende de la persona, la cultura, el entorno y la accesibilidad. Pregunta antes de acercarte, también con familiares o pareja.',
      whatToDo:
          'Respeta el espacio que la persona pide o busca. Si necesitas acercarte o tocarla, pregunta y espera su respuesta.',
      salesTip:
          'Pregunta si quiere revisar el material contigo y permite que elija la distancia.',
      illustrationKey: 'proxemics_intima',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_personal',
      name: 'Distancia de conversación cercana',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary:
          'Separación que permite conversar de cerca, según las preferencias y el entorno.',
      physiologicalDetails:
          'Longitud de un brazo extendido entre dos personas.',
      probableMeaning:
          'Puede facilitar una conversación o responder al mobiliario y al espacio disponible. No demuestra amistad ni confianza.',
      alternativeMeanings: ['Interacción casual.'],
      contextGuidance:
          'Las distancias descritas son referencias aproximadas. Acuerden una separación cómoda para ambos.',
      whatToDo:
          'Permite que la otra persona ajuste la distancia. Puedes preguntar si desde ahí oye y se siente cómoda.',
      salesTip:
          'Organiza la mesa para que ambos puedan ver el material y elegir dónde sentarse.',
      illustrationKey: 'proxemics_personal',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_social',
      name: 'Distancia de interacción en un espacio amplio',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary: 'Separación de varios pasos o de un mueble entre las personas.',
      physiologicalDetails:
          'Distancia equivalente a una mesa de juntas o un mostrador de atención.',
      probableMeaning:
          'Puede responder al tamaño del lugar, a una actividad o a preferencias de espacio. La distancia no permite deducir formalidad ni rechazo.',
      alternativeMeanings: ['Espacio seguro para interacción formal.'],
      contextGuidance:
          'Las necesidades de audición, movilidad, privacidad y comodidad pueden requerir otra distribución.',
      whatToDo:
          'Pregunta si desde ahí puede seguir la conversación y ajusten el lugar cuando haga falta.',
      salesTip:
          'Acuerden una ubicación que permita conversar y consultar el material con comodidad.',
      illustrationKey: 'proxemics_social',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_publico',
      name: 'Distancia para hablar a un grupo',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary:
          'Distancia para dirigirse a grupos grandes o cruzar por la calle.',
      physiologicalDetails:
          'Separación de varios metros, variable según el tamaño y la disposición del lugar.',
      probableMeaning:
          'Puede corresponder a una presentación o a la distribución del lugar. No describe por sí sola la relación entre las personas.',
      alternativeMeanings: ['Transeúntes.'],
      contextGuidance:
          'El tamaño del grupo, la acústica y la accesibilidad importan más que un umbral fijo de metros.',
      whatToDo:
          'Comprueba que se pueda ver y escuchar; ofrece micrófono, texto u otro apoyo si es útil.',
      salesTip:
          'Elige una ubicación donde el grupo pueda ver el material y participar.',
      illustrationKey: 'proxemics_publica',
      difficulty: 1,
    ),

    // --- COMUNICACIÓN NO VERBAL DIGITAL ---
    GestureItem(
      id: 'digital_mayusculas',
      name: 'Escribir TODO EN MAYÚSCULAS',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary: 'Escribir oraciones completas en letras mayúsculas.',
      physiologicalDetails:
          'Uso exclusivo de caracteres mayúsculos en mensajería digital.',
      probableMeaning:
          'Puede percibirse como énfasis, urgencia o intensidad, según la comunidad y la relación.',
      alternativeMeanings: [
        'Accesibilidad visual',
        'Preferencia de formato',
        'Convención interna del equipo'
      ],
      contextGuidance:
          'No siempre se percibe como agresión. Considera las normas compartidas y el contenido del mensaje.',
      whatToDo:
          'Evita escribir en mayúsculas sostenidas salvo siglas o alertas indispensables.',
      salesTip:
          'Reserva las mayúsculas sostenidas para alertas necesarias y adapta el estilo al canal acordado.',
      illustrationKey: 'digital_mayusculas',
      difficulty: 1,
    ),
    GestureItem(
      id: 'digital_ok_seco',
      name: 'El "Ok." Seco y Visto',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary: 'Responder únicamente "Ok" o "Ok." a un mensaje elaborado.',
      physiologicalDetails:
          'Respuesta monosilábica con punto final sin emojis ni explicaciones.',
      probableMeaning:
          'Puede significar recepción, brevedad, falta de tiempo, un estilo directo o el deseo de responder más tarde.',
      alternativeMeanings: [
        'Preferencia por respuestas concisas',
        'Necesidad de procesar antes de ampliar la respuesta'
      ],
      contextGuidance:
          'Un cambio de estilo puede tener muchas causas. Si la claridad importa, pregunta sin atribuir conflicto.',
      whatToDo:
          'Si deseas sonar cálido, añade un emoji o un signo: "¡Ok, perfecto!" o "Entendido 👍".',
      salesTip:
          'Si alguien responde "Ok", pregunta con amabilidad si entendió y si quiere seguir.',
      illustrationKey: 'digital_visto',
      difficulty: 2,
    ),
    GestureItem(
      id: 'digital_ghosting',
      name: 'Ghosting y Retraso Prolongado',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary:
          'Dejar mensajes en visto indefinidamente o desaparecer sin cerrar la conversación.',
      physiologicalDetails:
          'Confirmación de lectura (doble check azul) sin respuesta durante días o semanas.',
      probableMeaning:
          'Puede reflejar prioridades, saturación, olvido, una emergencia, límites personales o falta de interés; el motivo no se conoce sin comunicación.',
      alternativeMeanings: [
        'Saturación de tareas, olvido involuntario o emergencia.'
      ],
      contextGuidance: 'En relaciones y procesos de selección laboral.',
      whatToDo:
          'No insistas repetidamente. Envía un solo mensaje de cierre cordial.',
      salesTip:
          'Acordar una cadencia de seguimiento y un cierre respetuoso evita presión. La ausencia de respuesta no revela por sí sola el motivo.',
      illustrationKey: 'digital_ghosting',
      difficulty: 2,
    ),
    GestureItem(
      id: 'digital_emojis',
      name: 'Uso de emojis según la conversación',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary:
          'Incluir emoticonos para suavizar el tono o aclarar la intención emocional.',
      physiologicalDetails:
          'Símbolos gráficos que sustituyen la entonación y las gestos faciales breves faciales en texto.',
      probableMeaning:
          'Puede añadir tono, matizar una intención o reducir el esfuerzo de escribir; el significado cambia según el emoji y la relación.',
      alternativeMeanings: [
        'Uso excesivo puede restar formalidad en ciertos contratos.'
      ],
      contextGuidance: 'En mensajería instantánea profesional y personal.',
      whatToDo:
          'No es necesario imitar el uso de emojis. Pregunta o observa las normas del canal y usa el estilo que resulte claro y cómodo.',
      salesTip:
          'Un emoji cordial (👍 o 😊) al inicio o final humaniza el mensaje comercial sin perder seriedad.',
      illustrationKey: 'digital_emojis',
      difficulty: 1,
    ),
    GestureItem(
      id: 'digital_audio',
      name: 'Mensajes de Voz y Duración',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary:
          'Enviar notas de voz de duración breve vs audios extensos de más de 3 minutos.',
      physiologicalDetails:
          'Audio grabado que permite escuchar el tono, el volumen y el ritmo de la voz.',
      probableMeaning:
          'Puede ser una elección de accesibilidad, contexto, costumbre o disponibilidad; la duración por sí sola no define cercanía ni consideración.',
      alternativeMeanings: [
        'Imposibilidad de escribir por estar conduciendo o caminando.'
      ],
      contextGuidance:
          'En entornos de trabajo, pregunta primero: "¿Te viene bien una nota de voz corta?".',
      whatToDo:
          'Pregunta si un audio resulta conveniente y ofrece una alternativa escrita o un resumen cuando sea útil.',
      salesTip:
          'No presupongas que el audio es preferible. Ofrece el formato que la persona haya indicado como más accesible.',
      illustrationKey: 'digital_audio',
      difficulty: 1,
    ),
    GestureItem(
      id: 'audible_pause_before_reply',
      name: 'Pausa Audible Antes de Responder',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Una exhalación o breve suspiro antes de contestar una pregunta.',
      physiologicalDetails:
          'La persona toma aire, baja la mirada o mantiene una pausa breve mientras organiza su respuesta.',
      probableMeaning:
          'Puede indicar que está procesando, regulándose, sintiendo cansancio o preparando una respuesta cuidadosa.',
      alternativeMeanings: [
        'Alivio por haber entendido la pregunta',
        'Tensión por un tema complejo',
        'Costumbre personal de hablar'
      ],
      contextGuidance:
          'Interprétalo junto al contexto, el contenido y la posibilidad de pedir tiempo. No presupone rechazo ni desinterés.',
      whatToDo:
          'Deja espacio sin completar el silencio: “Tómate tu tiempo; si prefieres, puedo repetir la pregunta o volver a ella luego”.',
      salesTip:
          'En una conversación comercial, una pausa puede señalar evaluación. Evita llenar el silencio con presión; ofrece claridad y tiempo.',
      illustrationKey: 'pause_before_reply',
      difficulty: 2,
      reading: GestureReading.ambiguous,
    ),
    GestureItem(
      id: 'single_emoji_support',
      name: 'Un Emoji como Apoyo',
      category: CategoryType.comunicacionDigital,
      bodyPart: 'Digital',
      summary:
          'Responder a un mensaje largo o emotivo con un único emoji, como 🫶, ❤️ o 👍.',
      physiologicalDetails:
          'Un emoji puede ayudar a mostrar el tono de un mensaje, aunque su sentido depende de la persona y la conversación.',
      probableMeaning:
          'Puede confirmar recepción, expresar acompañamiento o reducir el esfuerzo de formular una respuesta completa.',
      alternativeMeanings: [
        'Respuesta apresurada',
        'Preferencia por mensajes breves',
        'Necesidad de procesar antes de escribir más'
      ],
      contextGuidance:
          'El significado depende del emoji, la relación y el historial de conversación. Si necesitas claridad, pregunta en vez de asumir.',
      whatToDo:
          'Puedes responder: “Gracias por reaccionar. Cuando tengas energía, me gustaría saber cómo lo ves”.',
      salesTip:
          'En conversaciones de trabajo, usa pocos emojis y pregunta qué tono prefiere la otra persona.',
      illustrationKey: 'emoji_support',
      difficulty: 1,
    ),
    GestureItem(
      id: 'abrupt_topic_change',
      name: 'Cambio Abrupto de Tema',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Conversación',
      summary:
          'Una persona introduce de pronto un tema distinto durante una conversación grupal.',
      physiologicalDetails:
          'El turno de palabra cambia de dirección rápidamente y puede venir acompañado de más energía, mirada desviada o necesidad de salir de un tema.',
      probableMeaning:
          'Puede reflejar entusiasmo, asociación de ideas, incomodidad, necesidad de regularse o dificultad para sostener el tema actual.',
      alternativeMeanings: [
        'Urgencia por compartir una idea',
        'Costumbre conversacional',
        'Intento de incluir un interés propio'
      ],
      contextGuidance:
          'No hay una lectura universal. Comprueba si la persona quiere cambiar de tema o si necesita una pausa.',
      whatToDo:
          'Responde con curiosidad: “Suena importante. ¿Quieres que sigamos con esa idea o prefieres retomar lo anterior después?”.',
      salesTip:
          'En reuniones, puedes dar estructura sin corregir: anota el tema nuevo y acuerda cuándo abordarlo.',
      illustrationKey: 'abrupt_topic_change',
      difficulty: 2,
      reading: GestureReading.ambiguous,
    ),
    GestureItem(
      id: 'prosodia_variable',
      name: 'Variación de Tono y Entonación',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'La voz sube y baja de forma natural para marcar énfasis, preguntas o partes importantes de una idea.',
      physiologicalDetails:
          'Cambios de altura, duración y acento en una misma frase sin que necesariamente cambie el volumen.',
      probableMeaning:
          'Puede ayudar a organizar el mensaje, expresar estilo personal o facilitar la comprensión. No permite deducir una emoción específica.',
      alternativeMeanings: [
        'Costumbre regional o familiar',
        'Adaptación a una audiencia',
        'Preferencia comunicativa personal'
      ],
      contextGuidance:
          'Observa qué palabras se enfatizan y pregunta si el significado importa; la entonación se interpreta distinto entre comunidades.',
      whatToDo:
          'Si no entiendes el tono, pide una aclaración concreta: “¿Quieres decirlo como una pregunta, una propuesta o una broma?”.',
      salesTip:
          'Usa una entonación clara sin teatralizar. Confirma por escrito los puntos importantes en vez de confiar solo en el tono.',
      illustrationKey: 'voice_prosody',
      difficulty: 2,
    ),
    GestureItem(
      id: 'voz_temorosa',
      name: 'Voz Temblorosa o Inestable',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'La voz presenta pequeñas variaciones involuntarias de estabilidad, volumen o respiración.',
      physiologicalDetails:
          'Oscilaciones en el flujo de aire y la vibración de las cuerdas vocales durante el habla.',
      probableMeaning:
          'Puede aparecer por emoción, cansancio, frío, esfuerzo vocal, una condición física o variación individual. No identifica por sí sola una causa.',
      alternativeMeanings: [
        'Recuperación de voz',
        'Ambiente frío',
        'Forma habitual de hablar'
      ],
      contextGuidance:
          'Evita completar la historia de la otra persona. Ofrece tiempo, agua o un formato alternativo solo si le resulta útil.',
      whatToDo:
          'Responde al contenido, no a una supuesta emoción: “Podemos ir más despacio o continuar por escrito si te sirve”.',
      salesTip:
          'No lo uses como una forma de negociar. Mantén un ritmo cómodo y confirma las decisiones con palabras.',
      illustrationKey: 'voice_tremor',
      difficulty: 2,
      reading: GestureReading.ambiguous,
    ),
    GestureItem(
      id: 'turnos_conversacion',
      name: 'Turnos, Solapamientos e Interrupciones',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Conversación',
      summary:
          'Dos o más voces comienzan a hablar a la vez, o una persona entra antes de que otra termine.',
      physiologicalDetails:
          'Solapamiento temporal de turnos, cambios rápidos de ritmo y señales corporales para pedir o ceder la palabra.',
      probableMeaning:
          'Puede expresar entusiasmo, estilos culturales distintos, una idea urgente, dificultad para calcular turnos o necesidad de aclarar. No equivale automáticamente a falta de respeto.',
      alternativeMeanings: [
        'Conversación animada entre personas cercanas',
        'Entorno con retraso de audio',
        'Necesidad de participar antes de olvidar una idea'
      ],
      contextGuidance:
          'Si el solapamiento dificulta entenderse, acuerden una estructura sencilla en vez de atribuir intención a quien habló primero.',
      whatToDo:
          'Puedes decir: “Quiero escuchar ambas ideas. ¿Terminamos una y luego vamos con la otra?”.',
      salesTip:
          'En reuniones, registra los puntos y ofrece turnos claros. La decisión debe basarse en lo expresado, no en quién ocupa más tiempo de voz.',
      illustrationKey: 'turn_taking',
      difficulty: 2,
    ),

    // --- ENTORNO, ESPACIO Y APARIENCIA ---
    GestureItem(
      id: 'vestimenta_formal_contextual',
      name: 'Vestimenta Formal de Negocios',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Apariencia',
      summary: 'Traje, corbata o vestimenta estructurada de alta etiqueta.',
      physiologicalDetails:
          'Prendas con cortes limpios y colores sobrios (azul marino, gris, negro).',
      probableMeaning:
          "La ropa puede influir en impresiones de profesionalidad y confianza. Su efecto depende también de la postura, del tipo de prenda y de quien observa; una impresión no acredita competencia real.",
      alternativeMeanings: [
        "Preferencia personal",
        "Requisito de la organización"
      ],
      contextGuidance:
          'Reuniones de directorio, juntas de accionistas y eventos formales.',
      whatToDo:
          "Consulta si existe un código de vestimenta y elige ropa adecuada a tus necesidades y al evento.",
      salesTip:
          "La apariencia puede influir en la primera impresión. Consulta las expectativas del entorno y acompaña la presentación con experiencia, alcance y condiciones comprobables.",
      illustrationKey: 'dress_formal',
      difficulty: 1,
    ),
    GestureItem(
      id: 'vestimenta_casual',
      name: "Vestimenta informal",
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Apariencia',
      summary:
          "Prendas consideradas informales en un entorno concreto; esa valoración cambia entre lugares y ocasiones.",
      physiologicalDetails:
          'Prendas relajadas, tejidos flexibles y calzado cómodo.',
      probableMeaning:
          "La ropa informal puede modificar cómo se perciben accesibilidad y competencia, con resultados que varían según la prenda y la persona. No permite deducir creatividad ni capacidad real.",
      alternativeMeanings: [
        "Preferencia personal",
        "Necesidades de comodidad o movimiento"
      ],
      contextGuidance:
          "Las normas varían incluso entre empresas del mismo sector; consulta las del lugar concreto.",
      whatToDo:
          "Si hay dudas, pregunta qué ropa se espera sin juzgar a otras personas por cómo se visten.",
      salesTip:
          "Considera las expectativas del encuentro: la ropa y la postura pueden influir juntas en las impresiones. Comprueba con información el trabajo ofrecido y no deduzcas cercanía por el atuendo.",
      illustrationKey: 'dress_casual',
      difficulty: 1,
    ),
    GestureItem(
      id: 'mesa_barrera',
      name: 'Escritorio entre dos personas',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          'Un escritorio separa físicamente a las personas durante una conversación.',
      physiologicalDetails:
          'Interposición de un objeto físico masivo entre los dos torsos.',
      probableMeaning:
          'Puede responder al mobiliario, al trabajo que se realiza o a necesidades de espacio. No revela por sí solo jerarquía, control ni distancia emocional.',
      alternativeMeanings: ['Espacio de trabajo habitual del despacho.'],
      contextGuidance:
          'Puede ser la distribución habitual del despacho. La forma de conversar y los acuerdos aportan más información que el tamaño del escritorio.',
      whatToDo:
          'Si cuesta ver el material o escucharse, pregunta si conviene cambiar de ubicación.',
      salesTip:
          'Propón una distribución cómoda para revisar la propuesta y deja que la persona elija.',
      illustrationKey: 'desk_barrier',
      difficulty: 2,
    ),
    GestureItem(
      id: 'mesa_redonda',
      name: 'Mesa redonda',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary: 'Las sillas se distribuyen alrededor de una mesa circular.',
      physiologicalDetails:
          'Distribución radial equidistante de todas las sillas respecto al centro.',
      probableMeaning:
          'Puede facilitar que varias personas vean el mismo material. La forma de la mesa no garantiza igualdad ni colaboración.',
      alternativeMeanings: ['Diseño estético del mobiliario.'],
      contextGuidance:
          'Sesiones de lluvia de ideas, acuerdos colaborativos y resolución de quejas.',
      whatToDo:
          'Aprovecha este formato para fomentar la participación de todos.',
      salesTip:
          'Acuerden turnos y formas de participar; la organización de la reunión importa además del mobiliario.',
      reading: GestureReading.ambiguous,
      illustrationKey: 'round_table',
      difficulty: 1,
    ),
    GestureItem(
      id: 'angulo_noventa',
      name: 'Asientos en ángulo',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          'Sentarse en la esquina de una mesa a 90 grados en lugar de frente a frente (180°).',
      physiologicalDetails:
          'Sentarse de lado para poder mirar a la persona y el documento compartido.',
      probableMeaning:
          'Puede facilitar mirar un documento juntos o responder a la disposición del lugar. No prueba cooperación ni garantiza reducir tensión.',
      alternativeMeanings: ['Mobiliario en L.'],
      contextGuidance:
          'Excelente para explicar cotizaciones, resolver problemas o enseñar un tema.',
      whatToDo:
          'Pregunta dónde prefiere sentarse y comprueba que ambos puedan ver el material.',
      salesTip:
          'Elige con la otra persona una ubicación cómoda para revisar la propuesta.',
      reading: GestureReading.ambiguous,
      illustrationKey: 'seating_angle',
      difficulty: 2,
    ),
    GestureItem(
      id: 'iluminacion_ambiente',
      name: "Iluminación del entorno",
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          "La intensidad, el color y la dirección de la luz cambian entre espacios.",
      physiologicalDetails:
          "Puede haber reflejos, sombras, parpadeo o luz directa que dificulten ver con comodidad.",
      probableMeaning:
          "La luz influye en las condiciones para ver documentos, pantallas y rostros. La comodidad depende de reflejos, intensidad, tarea y necesidades personales.",
      alternativeMeanings: [
        "Necesidades de visibilidad de una tarea",
        "Preferencias personales",
        "Características de las instalaciones"
      ],
      contextGuidance:
          "La comodidad depende de la persona y de la tarea; pregunta si la luz permite ver bien.",
      whatToDo:
          "Si es posible, ajusta reflejos e intensidad según lo que las personas necesiten.",
      salesTip:
          "Revisa reflejos y legibilidad para facilitar el acceso a la información. Ajustar la luz puede mejorar las condiciones de trabajo; no garantiza un acuerdo.",
      illustrationKey: 'lighting_atmosphere',
      difficulty: 1,
    ),
    ...GestureExpansion.items,
  ];

  static List<GestureItem> getByCategory(CategoryType category) {
    return items.where((item) => item.category == category).toList();
  }

  static GestureItem? getById(String id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<GestureItem> getByBodyPart(String bodyPart) {
    final clean = bodyPart.trim().toLowerCase();
    if (clean.isEmpty || clean == 'todos' || clean == 'all') return items;
    return items
        .where((item) => item.bodyPart.toLowerCase().contains(clean))
        .toList();
  }

  static List<GestureItem> search(String query) {
    final q = normalizeSearchText(query);
    if (q.isEmpty) return items;
    final terms = q.split(' ');
    return items.where((item) {
      final text = _searchIndex[item.id]!;
      return terms.every(text.contains);
    }).toList();
  }

  static final Map<String, String> _searchIndex = {
    for (final item in items)
      item.id: normalizeSearchText([
        item.name,
        item.summary,
        item.probableMeaning,
        item.bodyPart,
        item.contextGuidance,
        item.whatToDo,
        ...item.alternativeMeanings,
      ].join(' ')),
  };
}
