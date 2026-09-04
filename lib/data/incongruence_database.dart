import '../models/incongruence_item.dart';

class IncongruenceDatabase {
  static const List<IncongruenceItem> items = [
    // --- CASO 1 (Ventas): Objeción de precio encubierta ---
    IncongruenceItem(
      id: 'inc_sales_price',
      speakerRole: 'Director de Compras en reunión comercial',
      spokenPhrase:
          'El precio me parece bastante razonable y está dentro de nuestro rango...',
      illustrationKey: 'closed_posture',
      physicalSignals: [
        'Brazos fuertemente cruzados formando una barrera',
        'Labios comprimidos en una línea delgada',
        'Cuerpo reclinado ligeramente hacia atrás',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Reserva o duda sobre el retorno real de la inversión',
        'Cálculo mental y procesamiento reflexivo del presupuesto',
        'Cautela negociadora habitual para no mostrar entusiasmo',
        'Frío en la sala de juntas o postura física habitual',
      ],
      explanation:
          'Las palabras expresan acuerdo inicial, pero los brazos cruzados y labios apretados sugieren reserva interna, necesidad de procesar la cifra o simple cautela antes de comprometer fondos.',
      recommendedAction:
          'No asumas que el precio está cerrado ni presiones. Haz una pausa y pregunta: "Noto que estás evaluando el impacto, ¿cómo se compara esta inversión con el presupuesto asignado para esta área?"',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 2 (Autismo/Social): Cortesía que oculta impaciencia ---
    IncongruenceItem(
      id: 'inc_social_impatience',
      speakerRole: 'Compañero de trabajo durante una conversación',
      spokenPhrase:
          'No te preocupes, tómate todo el tiempo que necesites para explicarlo...',
      illustrationKey: 'finger_tapping',
      physicalSignals: [
        'Tamborileo rítmico e insistente de los dedos en la mesa',
        'Pestañeo acelerado y mirada frecuente hacia la puerta',
        'Cuerpo orientado hacia la salida',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Prisa por un compromiso o reunión pendiente',
        'Sobrecarga sensorial o fatiga atencional acumulada',
        'Inquietud motora involuntaria o hábito de autorregulación (stimming)',
      ],
      explanation:
          'El mensaje verbal otorga permiso cordial para continuar, pero el tamborileo y la orientación física hacia la salida sugieren que su capacidad de escucha está al límite o tiene un apremio temporal.',
      recommendedAction:
          'Sintetiza tu mensaje en una frase y ofrece una salida airosa: "En resumen, ese es el punto clave. Si quieres lo revisamos con calma más tarde cuando tengas tiempo".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 3 (Ventas): Alta receptividad y alineación positiva (ALINEADO) ---
    IncongruenceItem(
      id: 'inc_sales_buying_signal',
      speakerRole: 'Cliente potencial tras ver la demostración',
      spokenPhrase: 'Me gusta mucho cómo resuelve nuestro problema operativo.',
      illustrationKey: 'leaning_forward',
      physicalSignals: [
        'Inclinación del torso hacia adelante sobre la mesa',
        'Sonrisa de Duchenne (mejillas elevadas y arrugas en los ojos)',
        'Palmas de las manos abiertas y visibles',
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        'Sintonía positiva y alta receptividad con la solución planteada',
        'Entusiasmo genuino por solucionar una dificultad operativa inmediata',
        'Comodidad y apertura en la relación comercial',
      ],
      explanation:
          'Tanto el mensaje verbal como la inclinación corporal abierta y la sonrisa sincera convergen en mostrar comodidad y buena disposición hacia la propuesta.',
      recommendedAction:
          'Aprovecha la receptividad para proponer el paso siguiente con naturalidad: "¿Te gustaría que coordinemos el cronograma de implementación?"',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 4 (Autismo/Social): Desdén o burla oculta ---
    IncongruenceItem(
      id: 'inc_social_contempt',
      speakerRole: 'Conocido en un grupo social tras tu comentario',
      spokenPhrase:
          '¡Vaya, qué brillante tu opinión! Nunca se me hubiera ocurrido...',
      illustrationKey: 'smirk_contempt',
      physicalSignals: [
        'Tono de voz alargado y descendente, en contradicción con las palabras',
        'Rostro neutro o serio (cara de póker), o a veces una ligera asimetría labial',
        'Cabeza ligeramente ladeada o mirada de reojo',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Sarcasmo o ironía social como forma de descarte sutil',
        'Desacuerdo velado transmitido mediante entonación prosódica',
        'Broma seca o estilo de humor peculiar sin intención lesiva',
      ],
      explanation:
          'El sarcasmo cotidiano suele presentarse con rostro inexpresivo ("cara de póker"); la discrepancia no radica en una mueca evidente, sino en la entonación alargada o burlona que contradice el sentido literal de la frase.',
      recommendedAction:
          'No busques su aprobación ni reacciones con enfado. Responde con calma y tono neutro: "Es una perspectiva más. Sigamos con el tema central".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 5 (Ventas): Insatisfacción oculta con proveedor actual ---
    IncongruenceItem(
      id: 'inc_sales_supplier_doubt',
      speakerRole: 'Gerente General que evalúa alternativas',
      spokenPhrase:
          'Ya tenemos un proveedor actual y la verdad estamos perfectamente con ellos.',
      illustrationKey: 'touching_neck',
      physicalSignals: [
        'Mano tocando y frotando la parte posterior del cuello',
        'Mirada baja esquivando el contacto visual directo',
        'Hombros asimétricos con tensión visible',
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        'Incomodidad o fricción no resuelta con el proveedor actual',
        'Molestia o dolor cervical puramente físico',
        'Presión o incomodidad por tener que justificar una decisión ante terceros',
      ],
      explanation:
          'Tocarse el cuello suele funcionar como gesto pacificador ante estrés o como alivio de tensión muscular física. Aunque exprese conformidad verbal, la combinación sugiere que pueden existir consideraciones no compartidas.',
      recommendedAction:
          'Abre la conversación con una pregunta empática y sin presión: "Entiendo perfectamente. Si hubiera un aspecto puntual que te gustaría optimizar en los tiempos de entrega, ¿cuál sería?"',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 6 (Autismo/Social): Alegría sincera de bienvenida (ALINEADO) ---
    IncongruenceItem(
      id: 'inc_social_sincere_welcome',
      speakerRole: 'Amigo que te recibe en su casa',
      spokenPhrase: '¡Qué alegría que hayas podido venir hoy!',
      illustrationKey: 'eyebrow_flash',
      physicalSignals: [
        'Elevación rápida y espontánea de las cejas (flash de cejas)',
        'Sonrisa amplia mostrando dientes con ojos achinados',
        'Brazos abiertos listos para el saludo',
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        'Alegría genuina, afecto y bienvenida auténtica',
        'Reconocimiento positivo espontáneo en un entorno de confianza',
        'Alivio y satisfacción por compartir el momento',
      ],
      explanation:
          'El flash de cejas dura un tercio de segundo y actúa universalmente como señal de reconocimiento positivo y afecto en relaciones de confianza.',
      recommendedAction:
          'Sonríe con calidez y responde con naturalidad: "¡Muchas gracias por invitarme! Tenía muchas ganas de verte".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 7 (Ventas): Autoridad y poder de decisión (ALINEADO) ---
    IncongruenceItem(
      id: 'inc_sales_authority_steepling',
      speakerRole: 'Director Ejecutivo al escuchar tu propuesta',
      spokenPhrase: 'Entiendo el alcance. Tomaremos la decisión hoy mismo.',
      illustrationKey: 'steepling_hands',
      physicalSignals: [
        'Manos en ojiva (yemas de los dedos tocándose en forma de pirámide)',
        'Contacto visual sereno y sostenido',
        'Respiración pausada y postura erguida',
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        'Deliberación reflexiva y confianza en los criterios propios',
        'Concentración profunda en la toma de decisión',
        'Hábito postural consolidado en entornos de dirección',
      ],
      explanation:
          'Las manos en ojiva y la postura erguida acompañan habitualmente momentos de concentración, deliberación reflexiva y seguridad en el propio criterio.',
      recommendedAction:
          'Mantén una postura formal y asertiva, sin sobreexplicar: "Quedo a su disposición para coordinar los contratos hoy mismo".',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 8 (Autismo/Social): Tristeza oculta tras un "Todo bien" ---
    IncongruenceItem(
      id: 'inc_social_hidden_sadness',
      speakerRole: 'Familiar o amigo cercano',
      spokenPhrase:
          'No te preocupes por mí, estoy totalmente bien, todo en orden...',
      illustrationKey: 'turned_down_lips',
      physicalSignals: [
        'Comisuras labiales ligeramente caídas',
        'Voz monótona, baja y con pausas prolongadas',
        'Hombros encorvados hacia adelante y mirada fija en el piso',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Desánimo, tristeza o deseo de no ser una carga para los demás',
        'Agotamiento físico extremo o somnolencia',
        'Preocupación personal que prefiere no ventilar en ese momento',
      ],
      explanation:
          'Las palabras intentan protegerte o restar importancia a la situación, pero la caída de comisuras y la voz apagada sugieren vulnerabilidad o necesidad de apoyo.',
      recommendedAction:
          'No tomes el "estoy bien" de forma literal. Acércate con suavidad: "Noto que algo te preocupa. Aquí estoy si te apetece charlar o simplemente estar acompañados".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 9 (Social/Reunión Larga): Cooperación forzada vs autorregulación ---
    IncongruenceItem(
      id: 'inc_forced_cooperation_regulation',
      speakerRole: 'Compañero durante una reunión larga',
      spokenPhrase: 'Sí, claro, sigamos. Estoy bien.',
      illustrationKey: 'social_fatigue',
      physicalSignals: [
        'Manipula repetidamente un objeto pequeño entre las manos',
        'Sonrisa social breve con poca energía',
        'Cuerpo orientado hacia la salida',
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        'Fatiga cognitiva o necesidad de una pausa tras reunión prolongada',
        'Autorregulación motora natural mediante manipulación de objetos (fidgeting)',
        'Deseo genuino de colaborar a pesar del agotamiento',
      ],
      explanation:
          'Los movimientos repetitivos suelen ser estrategias neurodivergentes de autorregulación; no prueban ansiedad ni deshonestidad por sí solos. Al combinarse con cansancio visible y orientación de salida, sugieren que una pausa resultaría muy beneficiosa.',
      recommendedAction:
          'Ofrece una opción concreta y sin presión: "Podemos cerrar aquí, tomar cinco minutos o enviarte el resumen para que lo revises después. ¿Qué te viene mejor?".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 10 (Social/Amistad): Batería social al límite ---
    IncongruenceItem(
      id: 'inc_social_fatigue_participation',
      speakerRole: 'Amistad en una reunión social',
      spokenPhrase: 'La estoy pasando bien, podemos quedarnos un poco más.',
      illustrationKey: 'social_fatigue',
      physicalSignals: [
        'Manos entrelazadas con tensión',
        'Miradas frecuentes hacia la puerta',
        'Postura lista para salir mientras mantiene una sonrisa educada',
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        'Batería social agotada y deseo de finalizar la interacción',
        'Esfuerzo de cortesía para complacer al grupo (fawning)',
        'Preocupación logística por el transporte o la hora de regreso',
      ],
      explanation:
          'La sonrisa y las palabras de cortesía pueden coexistir con cansancio social profundo. No se debe diagnosticar ni exigir una explicación; lo más constructivo es abrir una salida respetuosa y airosa.',
      recommendedAction:
          'Di con empatía: "Gracias por venir. Si quieres que nos vayamos o prefieres descansar, me parece estupendo; no tienes que quedarte por mí".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 11 (Social/Pareja/Familia): Supresión Emocional ("Estoy bien") ---
    IncongruenceItem(
      id: 'inc_social_im_fine',
      speakerRole: 'Amigo, pareja o compañero tras un momento tenso',
      spokenPhrase: 'No me pasa absolutamente nada. Estoy bien.',
      illustrationKey: 'jaw_clenching',
      physicalSignals: [
        'Mandíbula fuertemente apretada con músculos maseteros marcados',
        'Suspiro hondo y prolongado con la mirada clavada en el suelo',
        'Hombros rígidos y elevados hacia las orejas',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Molestia o frustración que prefiere procesar en silencio',
        'Tensión física real, bruxismo o cefalea',
        'Deseo de calmarse antes de iniciar una conversación',
      ],
      explanation:
          'La frase declara bienestar absoluto, pero la mandíbula tensa, el suspiro pesado y la rigidez de hombros sugieren una contención activa de tensión que no se ha disipado.',
      recommendedAction:
          'No interrogues ni presiones. Responde con tono calmo: "Entiendo. Si en algún momento quieres que lo hablemos con calma o si prefieres espacio y silencio, aquí estoy".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 12 (Social/Tecnología): Atención Secuestrada por el Teléfono ---
    IncongruenceItem(
      id: 'inc_social_phone_distraction',
      speakerRole: 'Colega o conocido mientras le cuentas una historia',
      spokenPhrase:
          'Sí, sí, continúa, te estoy escuchando con toda atención...',
      illustrationKey: 'narrowed_eyes',
      physicalSignals: [
        'Ojos fijos en la pantalla iluminada del smartphone',
        'Pulgares tecleando activamente a gran velocidad',
        'Asentimiento mecánico de cabeza sin modular la mirada',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Atención visual y motora absorbida por el dispositivo',
        'Urgencia laboral o imprevisto que debe resolver en el acto',
        'Dificultad de multitarea atencional involuntaria',
      ],
      explanation:
          'El cerebro humano no puede redactar mensajes y procesar a fondo una narración compleja al mismo tiempo. Las palabras prometen escucha plena, pero los canales visual y motor están ocupados.',
      recommendedAction:
          'Haz una pausa natural con amabilidad: "Parece que te entró un mensaje urgente; respóndelo tranquilo y en cuanto termines te sigo contando".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 13 (Ventas): El Escudo Presupuestario con Interés Real ---
    IncongruenceItem(
      id: 'inc_sales_budget_shield',
      speakerRole: 'Gerente de Operaciones durante una propuesta comercial',
      spokenPhrase:
          'La verdad es que no tenemos nada de presupuesto para este trimestre.',
      illustrationKey: 'leaning_forward',
      physicalSignals: [
        'Torso inclinado hacia adelante con las palmas abiertas sobre la mesa',
        'Toma notas activas en su libreta sobre las características de tu servicio',
        'Preguntas continuas sobre plazos de entrega, soporte y garantías',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Interés técnico real condicionado por un protocolo presupuestario estricto',
        'Exploración previa de viabilidad para presupuestos del siguiente ejercicio',
        'Estrategia negociadora habitual para comprobar la flexibilidad comercial',
      ],
      explanation:
          'Las palabras levantan la habitual barrera presupuestaria, pero la inclinación del cuerpo, las anotaciones y el interés por el soporte sugieren que la solución le resulta atractiva y viable en el fondo.',
      recommendedAction:
          'No bajes el precio en pánico. Valida su interés: "Entiendo que el flujo trimestral sea estricto. Veo que las funciones operativas te encajan muy bien; ¿si estructuramos pagos por hitos tendría sentido avanzar?".',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 14 (Laboral/Liderazgo): Puertas Abiertas con Cuerpo Inaccesible ---
    IncongruenceItem(
      id: 'inc_work_open_door_closed_body',
      speakerRole: 'Líder de área en su despacho',
      spokenPhrase:
          'Mi puerta siempre está 100% abierta para cualquier duda que tengan.',
      illustrationKey: 'desk_barrier',
      physicalSignals: [
        'Escritorio amplio de madera usado como barrera frontal completa',
        'Mirada fija en la pantalla del ordenador sin girar el rostro hacia ti',
        'Vistazo impaciente al reloj de pared al verte entrar',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        'Saturación de agenda o fecha límite inmediata de entrega',
        'Disposición teórica de liderazgo que choca con falta de tiempo real',
        'Hábito ergonómico de no desviar la vista de la pantalla',
      ],
      explanation:
          'El discurso formal predica disponibilidad total, pero las señales físicas (barrera del mueble, ausencia de contacto visual y consulta del reloj) sugieren que este no es el momento propicio para una charla profunda.',
      recommendedAction:
          'Reconoce la situación con tacto: "Veo que estás con el tiempo muy justo cerrando tareas. ¿Te parece si te robo 10 minutos mañana a primera hora para revisarlo con calma?".',
      targetAudience: 'sales_focus',
    ),
  ];

  static List<IncongruenceItem> getByAudience(String audience) {
    if (audience == 'all') return items;
    return items
        .where((i) =>
            i.targetAudience == audience || i.targetAudience == 'general')
        .toList();
  }
}
