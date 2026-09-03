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
      isCongruent: false,
      realEmotion: 'Objeción silenciosa sobre el presupuesto o el valor',
      explanation:
          'Las palabras dicen que el precio es razonable, pero los brazos cruzados y labios apretados revelan resistencia inconsciente y contención de una queja.',
      recommendedAction:
          'No asumas que el precio está cerrado. Haz una pausa y pregunta: "Noto que estás evaluando el impacto, ¿cómo se compara esta inversión con el presupuesto asignado para esta área?"',
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
      isCongruent: false,
      realEmotion: 'Impaciencia, sobrecarga o prisa por terminar',
      explanation:
          'El mensaje verbal da permiso cordial de continuar, pero el tamborileo y la orientación hacia la salida indican que su nivel de atención está agotado.',
      recommendedAction:
          'Resume tu idea principal en 1 frase y concluye: "En resumen, ese es el punto clave. Si quieres lo revisamos con calma más tarde cuando estés libre".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 3 (Ventas): Interés genuino y señal de compra (CONGRUENTE) ---
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
      isCongruent: true,
      realEmotion: 'Aprobación genuina, entusiasmo y receptividad de compra',
      explanation:
          'Tanto las palabras como la inclinación corporal y la sonrisa de Duchenne concuerdan plenamente. Es una luz verde transparente.',
      recommendedAction:
          'Avanza inmediatamente a la propuesta de cierre: "¿Te gustaría que agendemos el inicio de la instalación para este lunes?"',
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
      isCongruent: false,
      realEmotion: 'Sarcasmo, ironía o desacuerdo velado',
      explanation:
          'El sarcasmo cotidiano suele presentarse con rostro neutro o serio ("cara de póker"); la clave no está en buscar una mueca evidente, sino en la entonación alargada o burlona que contradice el sentido literal de la frase.',
      recommendedAction:
          'No reacciones con enfado ni busques su aprobación. Responde de forma neutra y tranquila: "Es una perspectiva más. Sigamos con el tema central".',
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
      isCongruent: false,
      realEmotion:
          'Incomodidad, estrés o frustración no confesada con su proveedor',
      explanation:
          'Tocarse el cuello es un gesto apaciguador que denota estrés e inseguridad. Aunque dice que todo está bien, su cuerpo revela que hay un punto de dolor no resuelto.',
      recommendedAction:
          'Abre la brecha con una pregunta no amenazante: "Entiendo perfectamente. Si hubiera una sola cosa que tu proveedor actual pudiera mejorar en los tiempos de entrega, ¿cuál sería?"',
      targetAudience: 'sales_focus',
    ),

    // --- CASO 6 (Autismo/Social): Alegría sincera de bienvenida (CONGRUENTE) ---
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
      isCongruent: true,
      realEmotion: 'Alegría sincera, afecto y bienvenida auténtica',
      explanation:
          'El flash de cejas dura un tercio de segundo y es una señal biológica involuntaria de reconocimiento positivo y afecto genuino.',
      recommendedAction:
          'Sonríe con calidez y responde con entusiasmo: "¡Muchas gracias por invitarme! Tenía muchas ganas de verte".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 7 (Ventas): Autoridad y poder de decisión (CONGRUENTE) ---
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
      isCongruent: true,
      realEmotion: 'Máxima seguridad, confianza y autoridad en la decisión',
      explanation:
          'Las manos en campanario u ojiva son el reflejo físico de convicción y dominio técnico. El interlocutor tiene el poder y sabe lo que quiere.',
      recommendedAction:
          'Mantén una postura asertiva y formal, sin titubear ni sobreexplicar: "Quedo a su disposición para coordinar los contratos hoy mismo".',
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
      isCongruent: false,
      realEmotion: 'Tristeza, desánimo o necesidad de apoyo emocional',
      explanation:
          'Las palabras intentan no ser una carga, pero la caída de comisuras y la voz apagada indican vulnerabilidad y dolor emocional.',
      recommendedAction:
          'No tomes el "estoy bien" de forma literal. Acércate con calidez y di: "Noto que algo te preocupa. Aquí estoy si te apetece charlar o simplemente estar acompañados".',
      targetAudience: 'autism_focus',
    ),
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
      isCongruent: false,
      realEmotion: 'Posible fatiga social, sobrecarga o necesidad de una pausa',
      explanation:
          'Los movimientos repetitivos pueden ser una forma de autorregulación; no prueban ansiedad ni deshonestidad por sí solos. Al combinarse con cansancio visible y orientación de salida, invitan a comprobar si una pausa ayudaría.',
      recommendedAction:
          'Ofrece una opción concreta y sin presión: “Podemos cerrar aquí, tomar cinco minutos o enviarte el resumen para que lo revises después. ¿Qué te viene mejor?”.',
      targetAudience: 'autism_focus',
    ),
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
      isCongruent: false,
      realEmotion:
          'Posible cansancio, necesidad de espacio o deseo de terminar la interacción',
      explanation:
          'La sonrisa y las palabras de cortesía pueden coexistir con cansancio social. No se debe diagnosticar ni forzar una explicación; es útil abrir una salida respetuosa.',
      recommendedAction:
          'Di: “Gracias por venir. Si quieres irnos o tomar aire, me parece perfecto; no tienes que quedarte por mí”.',
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
      isCongruent: false,
      realEmotion: 'Molestia, contención emocional o sobrecarga de frustración',
      explanation:
          'La frase afirma bienestar absoluto, pero la mandíbula apretada, el suspiro pesado y la rigidez de hombros revelan tensión activa y contención de emociones difíciles.',
      recommendedAction:
          'No insistas diciendo "sé que estás enojado" ni interrogues. Di con tono suave y calmado: "Entiendo. Si en algún momento quieres que lo hablemos con calma o si prefieres espacio y silencio, aquí estoy".',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 12 (Social/Tecnología): Atención Secuestrada por el Teléfono ---
    IncongruenceItem(
      id: 'inc_social_phone_distraction',
      speakerRole: 'Colega o conocido mientras le cuentas una historia',
      spokenPhrase: 'Sí, sí, continúa, te estoy escuchando con toda atención...',
      illustrationKey: 'narrowed_eyes',
      physicalSignals: [
        'Ojos fijos en la pantalla iluminada del smartphone',
        'Pulgares tecleando activamente a gran velocidad',
        'Asentimiento mecánico de cabeza sin modular la mirada',
      ],
      isCongruent: false,
      realEmotion: 'Atención secuestrada por el dispositivo digital',
      explanation:
          'El cerebro humano no puede redactar mensajes complejos y a la vez procesar una narración profunda. Las palabras prometen atención plena, pero el canal visual y motor están absorbidos por la pantalla.',
      recommendedAction:
          'Haz una pausa natural en tu relato con una sonrisa y di amablemente: "Parece que te entró un mensaje urgente; respóndelo tranquilo y en cuanto termines te sigo contando". Evitas frustrarte y le permites desocuparse.',
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
      isCongruent: false,
      realEmotion:
          'Alto interés y deseo de compra oculto tras un escudo presupuestario',
      explanation:
          'Las palabras verbales levantan la típica barrera defensiva del presupuesto, pero el cuerpo inclinado, las notas manuscritas y el interés por los detalles operativos revelan que la solución le resulta sumamente atractiva.',
      recommendedAction:
          'No te desanimes ni bajes el precio en pánico. Valida su interés: "Entiendo que el flujo de caja trimestral sea estricto. Veo que las funciones operativas te encajan muy bien; ¿si estructuramos los pagos en fases o para el siguiente mes, tendría sentido avanzar?".',
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
      isCongruent: false,
      realEmotion: 'Saturación de agenda, prisa o inaccesibilidad momentánea',
      explanation:
          'El discurso corporativo predica accesibilidad total, pero el lenguaje corporal (barrera del mueble, falta de contacto visual y mirada al reloj) comunica que este no es el momento propicio para una conversación reflexiva.',
      recommendedAction:
          'Reconoce la situación sin juzgar: "Veo que estás con el tiempo muy justo cerrando pendientes. ¿Te parece si te robo 10 minutos mañana a primera hora con un café para revisarlo con calma?". Te ganas su agradecimiento.',
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
