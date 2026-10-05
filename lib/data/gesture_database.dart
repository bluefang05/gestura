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
          'La activación alrededor de los ojos no confirma una emoción concreta. Observa el intercambio completo y, si importa, pregúntalo.',
      whatToDo:
          'Corresponde con calidez, sin asumir acuerdo ni bienestar; deja espacio para que la persona matice con palabras.',
      salesTip:
          'No la uses como señal de compra. Confirma necesidades, dudas y próximos pasos de forma explícita.',
      illustrationKey: 'duchenne_smile',
      difficulty: 1,
    ),
    GestureItem(
      id: 'sonrisa_social',
      name: 'Sonrisa de Cortesía / Social',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Boca',
      summary:
          'Sonrisa funcional donde solo se mueven los labios, mientras los ojos permanecen estáticos.',
      physiologicalDetails:
          'Los labios se estiran hacia los lados. Las mejillas pueden subir menos y quizá no aparezcan arrugas junto a los ojos.',
      probableMeaning:
          'Puede ser cortesía, amabilidad, nerviosismo, concentración o la forma habitual de sonreír.',
      alternativeMeanings: [
        'Deseo de no crear tensión',
        'Una sonrisa breve o contenida'
      ],
      contextGuidance:
          'Muy común en atención al cliente, recepciones o cuando alguien no quiere parecer descortés.',
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
          'Contención de opiniones, desacuerdo no verbalizado, frustración o rechazo silencioso.',
      alternativeMeanings: ['Concentración motriz intensa'],
      contextGuidance:
          'Ocurre cuando la persona no quiere hablar para no empeorar una situación o generar conflicto.',
      whatToDo:
          'Da espacio: "Me gustaría conocer tu opinión sincera antes de continuar."',
      salesTip:
          'Puede sugerir reserva, duda no expresada o necesidad de procesar. Haz una pausa amable y pregunta: "¿Hay algún aspecto sobre esto que quieras que revisemos en detalle?".',
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
      name: 'Párpados Cerrados Prolongados',
      category: CategoryType.expresionesFaciales,
      bodyPart: 'Ojos',
      summary: 'Cerrar los ojos durante 1 a 3 segundos mientras el otro habla.',
      physiologicalDetails:
          'Cierre voluntario prolongado del párpado superior sin dormirse.',
      probableMeaning:
          'Desconexión emocional momentánea, fatiga mental, frustración ("no puedo con esto") o intento de autocontrol.',
      alternativeMeanings: [
        'Concentración interna para visualizar algo mentalmente.',
        'Meditación, descanso ocular o fatiga.',
      ],
      contextGuidance:
          'Puede acompañar reflexión profunda, demasiada información de una vez o necesidad de procesar lo escuchado.',
      whatToDo:
          'Permite un momento de silencio o resume tu punto con claridad.',
      salesTip:
          'Pausa tu explicación. Permite que la persona asimile el argumento antes de continuar.',
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
          'Ira contenida, frustración reprimida, estrés agudo o determinación obstinada.',
      alternativeMeanings: [
        'Apretar o rechinar los dientes sin darse cuenta.',
        'Esfuerzo físico o concentración motriz intensa.',
        'Reacción pasajera a un estímulo o tensión corporal general.',
      ],
      contextGuidance:
          'Común cuando se escucha una crítica injusta o se recibe una mala noticia.',
      whatToDo:
          'Haz una pausa. Permite que la persona se exprese antes de continuar argumentando.',
      salesTip:
          'La persona podría tener una duda o sentirse incómoda. Pregunta con calma si quiere aclarar algo.',
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
          'Frecuente en situaciones de toma de decisiones arriesgadas.',
      whatToDo:
          'Transmite seguridad y valida que no hay prisa para tomar una decisión.',
      salesTip:
          'El cliente está indeciso en el filo del cierre. Brinda una garantía de tranquilidad.',
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
          'Saludo universal inconsciente, agrado, reconocimiento y apertura social.',
      alternativeMeanings: [
        'Sorpresa fugaz ante un estímulo repentino.',
        'Ajuste de visión o iluminación ambiental.',
      ],
      contextGuidance:
          'Algunas personas levantan las cejas brevemente al saludar.',
      whatToDo: 'Devuelve una sonrisa y un saludo cálido.',
      salesTip:
          'Si el cliente te recibe con flash de cejas, te reconoce y está predispuesto a escucharte.',
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
          'Preparación para la acción física, indignación, agitación o necesidad de aire.',
      alternativeMeanings: [
        'Falta de aire, congestión nasal o esfuerzo físico previo.',
        'Respiración profunda voluntaria para oxigenarse o relajarse.',
        'Reacción a olores o alérgenos en el ambiente.',
      ],
      contextGuidance:
          'Puede acompañar emociones intensas o respuestas fisiológicas respiratorias.',
      whatToDo:
          'Mantén un tono de voz bajo y pausado para desacelerar la agitación del otro.',
      salesTip: 'No presiones más en este momento. Desescala la tensión.',
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
          'Dominancia, entusiasmo desbordante, búsqueda de atención o intensidad emocional.',
      alternativeMeanings: [
        'Dificultades de audición (dificultad para oír) o ruido de fondo elevado.',
        'Hábito cultural o familiar de conversación enérgica.',
        'Entusiasmo genuino por el tema tratado.',
      ],
      contextGuidance:
          'En oficinas abiertas puede resultar invasivo o abrumador.',
      whatToDo:
          'Responde con volumen moderado y controlado para modular la energía del ambiente.',
      salesTip:
          'En ventas, ajustar tu volumen al del cliente ayuda a generar sintonía sin gritar.',
      illustrationKey: 'voice_volume_high',
      difficulty: 1,
    ),
    GestureItem(
      id: 'volumen_bajo',
      name: 'Volumen de Voz Bajo (Susurro)',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Hablar con decibeles muy tenues que requieren acercarse para escuchar.',
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
          'Acércate ligeramente y responde con suavidad respetando su espacio.',
      salesTip:
          'Bajar el volumen al decir un dato clave genera expectación y sensación de exclusividad.',
      illustrationKey: 'voice_volume_low',
      difficulty: 1,
    ),
    GestureItem(
      id: 'velocidad_rapida',
      name: 'Velocidad de Habla Acelerada',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary: 'Pronunciar más de 180 palabras por minuto sin pausas claras.',
      physiologicalDetails: 'Se habla rápido y a veces se respira más deprisa.',
      probableMeaning:
          'Ansiedad, urgencia, nerviosismo, o pasión desbordante por el tema.',
      alternativeMeanings: [
        'Hábito cultural o dialecto de ritmo ágil.',
        'Entusiasmo o ganas de hablar en detalle sobre un tema que interesa.',
        'Urgencia temporal real o temor a ser interrumpido.',
      ],
      contextGuidance: 'Común en personas que temen ser interrumpidas.',
      whatToDo:
          'Haz pausas para que la otra persona pueda seguir la conversación a su ritmo.',
      salesTip:
          'Hablar demasiado rápido en ventas reduce la credibilidad percibida. Respira y desacelera.',
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
      name: 'Tono Sarcástico o Irónico',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Las palabras suenan positivas, pero la voz suena seria o apagada. Puede haber muchas razones; pregunta antes de sacar conclusiones.',
      physiologicalDetails:
          'En la vida cotidiana, la persona suele mantener cara inexpresiva o neutra (poker face). La señal clave está en la voz: alargamiento exagerado de sílabas ("Quéee bueeeno..."), caída tonal al final y contradicción con el contexto.',
      probableMeaning:
          'Ironía o desacuerdo velado. La persona comunica lo opuesto al sentido literal de las palabras.',
      alternativeMeanings: [
        'Humor seco habitual entre personas de mucha confianza.'
      ],
      contextGuidance:
          'Si alguien dice "¡Qué gran idea!" con cara seria y tono arrastrado tras un problema, significa: "Es una mala idea".',
      whatToDo:
          'No te quedes con las palabras literales ni esperes ver una cara burlona. Pregunta de forma directa y calmada: "¿Prefieres que busquemos otra opción?"',
      salesTip:
          'Si notas sarcasmo en un cliente, aclara los puntos dudosos de forma transparente y sin ironía.',
      illustrationKey: 'sarcastic_inflection',
      difficulty: 2,
    ),
    GestureItem(
      id: 'tono_asertivo',
      name: 'Hablar con claridad y respeto',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz',
      summary:
          'Voz firme, velocidad constante y volumen medio sin vacilaciones.',
      physiologicalDetails:
          'Respiración diafragmática, cadencia rítmica clara y final de frase con tono neutro (no hacia arriba como pregunta).',
      probableMeaning:
          'Claridad en las ideas, convicción, autoridad serena y límites sanos.',
      alternativeMeanings: ['Puede sonar seco si no se acompaña de calidez.'],
      contextGuidance:
          'Indispensable en liderazgo, acuerdos profesionales y resolución de conflictos.',
      whatToDo:
          'Escucha activamente y responde con la misma claridad y profesionalismo.',
      salesTip:
          'Inspira confianza inmediata. Transmite certeza en la solución que ofreces.',
      illustrationKey: 'assertive_voice',
      difficulty: 1,
    ),
    GestureItem(
      id: 'silencio_incomodo',
      name: 'Silencio Incómodo (Tensión)',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz y Silencio',
      summary:
          'Pausa repentina y pesada en la conversación acompañada de miradas esquivas o rigidez.',
      physiologicalDetails:
          'Ausencia total de respuesta verbal mientras la respiración se contiene o se tensan hombros y labios.',
      probableMeaning:
          'Se dijo algo inapropiado, ofensivo, o se tocó un tema tabú que nadie sabe cómo manejar.',
      alternativeMeanings: [
        'La persona está procesando una noticia impactante.'
      ],
      contextGuidance:
          'Ocurre tras un chiste desafortunado, una confesión repentina o una pregunta indiscreta.',
      whatToDo:
          'Rompe la tensión con naturalidad: "Disculpa si sonó imprudente, quise decir..." o cambia de tema suavemente.',
      salesTip:
          'Si lanzaste el precio final, ¡guarda silencio! El primero que habla después del precio pierde poder de negociación.',
      illustrationKey: 'silence_tense',
      difficulty: 2,
    ),
    GestureItem(
      id: 'silencio_reflexivo',
      name: 'Silencio Reflexivo',
      category: CategoryType.factoresParalinguisticos,
      bodyPart: 'Voz y Silencio',
      summary:
          'Pausa con mirada hacia arriba o al infinito para pensar antes de responder.',
      physiologicalDetails:
          'Rostro relajado, mirada desenfocada o arriba, ceño pensativo sin rigidez.',
      probableMeaning:
          'La persona valora la conversación y está estructurando una respuesta madura y honesta.',
      alternativeMeanings: ['Búsqueda de memoria.'],
      contextGuidance: 'Muy positivo en entrevistas y debates profundos.',
      whatToDo:
          'NO interrumpas el silencio. Espera pacientemente a que termine de formular su pensamiento.',
      salesTip:
          'El cliente está haciendo cálculos mentales o visualizando el impacto. Déjalo pensar.',
      illustrationKey: 'silence_reflective',
      difficulty: 1,
    ),

    // --- POSTURAS Y LENGUAJE CORPORAL ---
    GestureItem(
      id: 'postura_abierta',
      name: 'Postura Abierta y Receptiva',
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
          'No es una luz verde de compra. Confirma prioridades y consentimiento antes de avanzar.',
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
          'No te sientas intimidado. Mantén contacto visual equilibrado y presenta tu propuesta con profesionalismo.',
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
          'No la tomes como luz verde. Antes de entrar en más detalle, pregunta si la persona quiere continuar o necesita una pausa.',
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
          'Pecho expuesto y brazos fuera de la línea de defensa frontal.',
      probableMeaning:
          'Autoridad, confianza, observación tranquila o autocontrol.',
      alternativeMeanings: [
        'Contención de tensión si una mano sujeta fuertemente la muñeca contraria.',
        'Postura cómoda para descansar los brazos caminando.',
        'Hábito ergonómico para mantener la espalda erguida.',
      ],
      contextGuidance:
          'Común en profesores, supervisores o personas en paseos reflexivos.',
      whatToDo:
          'Muestra respeto por su rol y responde con claridad cuando se dirija a ti.',
      salesTip:
          'Postura de evaluador observador. Permítele examinar las opciones sin atosigarlo.',
      illustrationKey: 'hands_behind_back',
      difficulty: 2,
    ),
    GestureItem(
      id: 'manos_bolsillos',
      name: 'Manos en los Bolsillos',
      category: CategoryType.lenguajeCorporal,
      bodyPart: 'Manos y Brazos',
      summary:
          'Ocultar las manos completamente dentro de los bolsillos del pantalón o saco.',
      physiologicalDetails:
          'Retracción de las extremidades superiores y ocultamiento de las palmas.',
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
          'No expongas con las manos en los bolsillos; mantener las palmas visibles genera un 40% más de confianza percibida.',
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
          'Colocación del tobillo sobre la rodilla (en 4) o rodilla sobre rodilla.',
      probableMeaning:
          'En 4: competitividad, comodidad informal o dominio. Rodilla sobre rodilla: contención, elegancia o barrera según la orientación del cuerpo.',
      alternativeMeanings: ['Hábito ergonómico de descanso.'],
      contextGuidance:
          'Si la rodilla cruzada apunta HACIA ti, indica conexión. Si apunta LEJOS de ti, es barrera.',
      whatToDo:
          'Observa la orientación general del torso y los pies hacia dónde apuntan.',
      salesTip:
          'Si el cliente cruza las piernas en 4 y se toma el tobillo, está en postura de negociación dura.',
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
          'Respeto mutuo, acuerdo de igualdad, saludo formal y profesionalismo.',
      alternativeMeanings: [
        'Si es débil ("pescado muerto"): inseguridad. Si es triturador: deseo de intimidar.'
      ],
      contextGuidance:
          'El saludo universal estándar en el mundo profesional y de negocios.',
      whatToDo:
          'Ofrece la mano en posición vertical (ni arriba ni abajo) con firmeza serena mientras miras a los ojos y sonríes.',
      salesTip:
          'Fíjate en la fuerza del apretón de manos y ofrece uno cómodo. También puedes saludar sin contacto.',
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
      name: 'Espacio Íntimo (0 a 45 cm)',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary:
          'Burbuja inmediata alrededor del cuerpo reservada para afecto cercano.',
      physiologicalDetails: 'Distancia menor a la longitud de un antebrazo.',
      probableMeaning:
          'Intimidad, romance, protección familiar o confrontación física extrema.',
      alternativeMeanings: [
        'Ascensores o transporte público abarrotado (donde se tolera neutralizando la mirada).'
      ],
      contextGuidance:
          'Invadir este espacio con conocidos casuales o en el trabajo se percibe como amenaza o acoso.',
      whatToDo:
          'Respeta esta burbuja rigurosamente excepto con pareja, hijos o familiares muy cercanos.',
      salesTip:
          'Nunca te acerques a menos de 50 cm de un cliente a menos que te invite explícitamente a ver algo.',
      illustrationKey: 'proxemics_intima',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_personal',
      name: 'Espacio Personal (45 cm a 1.2 m)',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary: 'Distancia de un brazo extendido para amigos y familiares.',
      physiologicalDetails:
          'Longitud de un brazo extendido entre dos personas.',
      probableMeaning:
          'Amistad, confianza mutua, conversación cómoda y relajada.',
      alternativeMeanings: ['Interacción casual.'],
      contextGuidance:
          'Ideal para charlar en un café, reuniones de amigos o caminatas compartidas.',
      whatToDo:
          'Colócate a esta distancia con personas con las que ya existe simpatía o trato previo.',
      salesTip: 'Distancia ideal en reuniones 1 a 1 en mesas pequeñas.',
      illustrationKey: 'proxemics_personal',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_social',
      name: 'Espacio Social (1.2 m a 3.6 m)',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary:
          'Distancia profesional para reuniones de trabajo, clientes y conocidos.',
      physiologicalDetails:
          'Distancia equivalente a una mesa de juntas o un mostrador de atención.',
      probableMeaning: 'Trato profesional, respeto formal y neutralidad.',
      alternativeMeanings: ['Espacio seguro para interacción formal.'],
      contextGuidance:
          'Entrevistas de trabajo, consultas médicas, trato comercial.',
      whatToDo:
          'Es la distancia base recomendada para interactuar con personas que acabas de conocer.',
      salesTip: 'Mantén esta distancia en salas de juntas para no incomodar.',
      illustrationKey: 'proxemics_social',
      difficulty: 1,
    ),
    GestureItem(
      id: 'espacio_publico',
      name: 'Espacio Público (+3.6 m)',
      category: CategoryType.proxemica,
      bodyPart: 'Espacio',
      summary:
          'Distancia para dirigirse a grupos grandes o cruzar por la calle.',
      physiologicalDetails: 'Más allá de 3.6 metros.',
      probableMeaning: 'Anonimato, discurso público o interacción comunitaria.',
      alternativeMeanings: ['Transeúntes.'],
      contextGuidance:
          'Conferencias, presentaciones en auditorios, clases magistrales.',
      whatToDo:
          'Proyecta la voz y amplifica los gestos para que se entiendan a distancia.',
      salesTip:
          'En presentaciones grupales ante comités de compras, ubícate en el espacio público para abarcar visualmente a todos.',
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
      signalType: SignalTrafficLight.yellow,
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
      signalType: SignalTrafficLight.yellow,
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
      signalType: SignalTrafficLight.yellow,
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
          'Autoridad, respeto institucional, solemnidad y rigor profesional.',
      alternativeMeanings: ['Requisito obligatorio de código corporativo.'],
      contextGuidance:
          'Reuniones de directorio, juntas de accionistas y eventos formales.',
      whatToDo:
          'Utilízala cuando desees proyectar la máxima solvencia y seriedad.',
      salesTip:
          'En ventas corporativas B2B de alto valor, vestir formal transmite respaldo y solidez.',
      illustrationKey: 'dress_formal',
      difficulty: 1,
    ),
    GestureItem(
      id: 'vestimenta_casual',
      name: 'Vestimenta Casual / Creativa',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Apariencia',
      summary: 'Ropa cómoda, polo o camisa sin corbata en entornos modernos.',
      physiologicalDetails:
          'Prendas relajadas, tejidos flexibles y calzado cómodo.',
      probableMeaning:
          'Accesibilidad, horizontalidad, innovación y cercanía interpersonal.',
      alternativeMeanings: ['Cultura relajada de startups o viernes casual.'],
      contextGuidance:
          'Empresas de tecnología, agencias de diseño y reuniones entre pares.',
      whatToDo:
          'Viste acorde al entorno para no parecer inaccesible o demasiado rígido.',
      salesTip:
          'Si visitas una empresa tecnológica, vestir de traje estricto puede crear una barrera psicológica.',
      illustrationKey: 'dress_casual',
      difficulty: 1,
    ),
    GestureItem(
      id: 'mesa_barrera',
      name: 'El Escritorio como Barrera de Poder',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          'Colocarse detrás de un escritorio ancho y macizo separando físicamente a las personas.',
      physiologicalDetails:
          'Interposición de un objeto físico masivo entre los dos torsos.',
      probableMeaning:
          'Jerarquía marcada, control, distancia emocional y dominio del territorio.',
      alternativeMeanings: ['Espacio de trabajo habitual del despacho.'],
      contextGuidance:
          'Típica en jefes tradicionales o entrevistas de evaluación severa.',
      whatToDo:
          'Mantén una postura erguida sin encogerte ni recostarte sobre la mesa del otro.',
      salesTip:
          'Si puedes, invita al cliente a sentarse en una mesa lateral o retira objetos que obstruyan la vista.',
      illustrationKey: 'desk_barrier',
      difficulty: 2,
    ),
    GestureItem(
      id: 'mesa_redonda',
      name: 'Mesa Redonda (Disposición Igualitaria)',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary: 'Mesa circular donde nadie ocupa una cabecera dominante.',
      physiologicalDetails:
          'Distribución radial equidistante de todas las sillas respecto al centro.',
      probableMeaning:
          'Igualdad de voces, colaboración abierta, trabajo en equipo y ausencia de jerarquía dominante.',
      alternativeMeanings: ['Diseño estético del mobiliario.'],
      contextGuidance:
          'Sesiones de lluvia de ideas, acuerdos colaborativos y resolución de quejas.',
      whatToDo:
          'Aprovecha este formato para fomentar la participación de todos.',
      salesTip:
          'La mejor configuración para vender proyectos consultivos en equipo.',
      illustrationKey: 'round_table',
      difficulty: 1,
    ),
    GestureItem(
      id: 'angulo_noventa',
      name: 'Ubicación en Ángulo de 90° (Esquina Cooperativa)',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          'Sentarse en la esquina de una mesa a 90 grados en lugar de frente a frente (180°).',
      physiologicalDetails:
          'Sentarse de lado para poder mirar a la persona y el documento compartido.',
      probableMeaning:
          'Cooperación, revisión conjunta de soluciones, reducción de la tensión competitiva.',
      alternativeMeanings: ['Mobiliario en L.'],
      contextGuidance:
          'Excelente para explicar cotizaciones, resolver problemas o enseñar un tema.',
      whatToDo:
          'Adopta esta posición cuando desees que ambos se sientan aliados frente al problema.',
      salesTip:
          'La posición reina para cerrar ventas: ambos miran juntos la propuesta.',
      illustrationKey: 'seating_angle',
      difficulty: 2,
    ),
    GestureItem(
      id: 'iluminacion_ambiente',
      name: 'Iluminación y Calidez del Entorno',
      category: CategoryType.entornoApariencia,
      bodyPart: 'Espacio y Entorno',
      summary:
          'Luz cálida e indirecta vs luz fría fluorescente de alta intensidad.',
      physiologicalDetails:
          'La luz del día puede influir en el sueño y en el nivel de alerta.',
      probableMeaning:
          'Luz cálida: relajación, confidencia y confort. Luz fría: alerta, actividad clínica o vigilancia.',
      alternativeMeanings: ['Requisitos técnicos de quirófanos o fábricas.'],
      contextGuidance:
          'En cafeterías y salas de estar se usa luz cálida; en auditorios de examen, luz fría.',
      whatToDo:
          'Adapta la iluminación según el objetivo emocional de la reunión.',
      salesTip:
          'Una luz cálida y acogedora invita a quedarse más tiempo y facilita acuerdos amigables.',
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
