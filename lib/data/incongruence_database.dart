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
        'Brazos cruzados delante del torso',
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
          'Las palabras expresan una valoración del precio. Los brazos y labios no permiten saber si existe una reserva; también pueden reflejar comodidad, frío o hábito. El acuerdo se confirma de forma explícita.',
      recommendedAction:
          'Pregunta sin atribuirle una emoción: «¿Cómo encaja esta propuesta en el presupuesto? ¿Hay algo que quieras revisar antes de decidir?». Da tiempo para responder.',
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
        'Movimiento repetido o una forma de regularse (a veces llamado «stimming»)',
      ],
      explanation:
          'La persona ha dicho que puedes continuar. Los movimientos o la orientación del cuerpo no prueban impaciencia ni falta de escucha; si necesitas coordinar el tiempo, puedes preguntarlo.',
      recommendedAction:
          'Puedes decir: «¿Te viene bien que siga ahora o prefieres que lo retomemos después?». Respeta la respuesta sin discutir sus gestos.',
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
        'Sonrisa con mejillas elevadas y arrugas junto a los ojos',
        'Palmas de las manos abiertas y visibles',
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        "La persona expresa una valoración favorable con palabras",
        "La postura puede ser cómoda o habitual",
        "Puede querer más información sin haber decidido comprar"
      ],
      explanation:
          "La persona ha dicho que le gusta cómo se resuelve el problema. La inclinación y la sonrisa no certifican comodidad, sinceridad ni intención de compra. Pregunta qué siguiente paso desea.",
      recommendedAction:
          "Puedes preguntar: «¿Quieres revisar algún detalle, recibir la propuesta o valorar un siguiente paso?». Una valoración favorable no sustituye un acuerdo.",
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
        "Alarga algunas palabras y baja el tono al final",
        "Mantiene el rostro serio o eleva un lado del labio",
        "Inclina la cabeza o mira de lado"
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        "Una valoración literal expresada con ese tono",
        "Una broma o ironía",
        "Un desacuerdo que tendría que aclararse con palabras"
      ],
      explanation:
          "Una cara seria, una asimetría labial o una entonación alargada no identifican sarcasmo ni desprecio. El contenido y el contexto pueden orientar una pregunta; no hay una expresión obligatoria de ironía.",
      recommendedAction:
          "Si quieres aclararlo, puedes decir: «¿Lo dices en serio o con ironía?». Si un comentario te molesta, puedes expresar el efecto y pedir que se hable con respeto sin demostrar su intención.",
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
        "Se toca o frota la parte posterior del cuello",
        "Mira hacia abajo",
        "Mantiene un hombro más elevado que el otro"
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        "Está satisfecho con su proveedor, como ha dicho",
        "Una molestia física o una postura habitual",
        "Puede querer explorar alternativas o preferir no hacerlo"
      ],
      explanation:
          "La persona dice estar satisfecha con su proveedor. Tocarse el cuello o mirar abajo no contradice esa afirmación ni informa sobre plazos que no se han mencionado.",
      recommendedAction:
          "Pregunta: «¿Quieres conocer otra opción o prefieres dejarlo aquí?». Respeta su respuesta sin asumir insatisfacción oculta.",
      targetAudience: 'sales_focus',
    ),

    // --- CASO 6 (Autismo/Social): Alegría sincera de bienvenida (ALINEADO) ---
    IncongruenceItem(
      id: 'inc_social_sincere_welcome',
      speakerRole: 'Amigo que te recibe en su casa',
      spokenPhrase: '¡Qué alegría que hayas podido venir hoy!',
      illustrationKey: 'eyebrow_flash',
      physicalSignals: [
        "Eleva brevemente las cejas",
        "Sonríe mostrando los dientes",
        "Extiende los brazos hacia los lados"
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        "Expresa alegría por la visita con palabras",
        "Un gesto habitual de saludo",
        "Puede querer saludar con contacto o sin él"
      ],
      explanation:
          'La elevación breve de cejas puede acompañar un saludo o reconocimiento, pero su significado depende de la persona y del contexto. Las palabras de bienvenida aportan información que el gesto por sí solo no da.',
      recommendedAction:
          "Responde al saludo de una forma que te resulte cómoda y confirma antes de abrazar si no está claro que ambos quieren hacerlo.",
      targetAudience: 'autism_focus',
    ),

    // --- CASO 7 (Ventas): Autoridad y poder de decisión (ALINEADO) ---
    IncongruenceItem(
      id: 'inc_sales_authority_steepling',
      speakerRole: 'Director Ejecutivo al escuchar tu propuesta',
      spokenPhrase: 'Entiendo el alcance. Tomaremos la decisión hoy mismo.',
      illustrationKey: 'steepling_hands',
      physicalSignals: [
        'Junta las puntas de los dedos, como formando un tejado',
        'Contacto visual sereno y sostenido',
        'Respiración pausada y postura erguida',
      ],
      relationship: SignalRelationship.aligned,
      possibleInterpretations: [
        "Comunica un plazo de decisión con palabras",
        "Una postura cómoda para las manos",
        "Puede estar revisando la información sin haber aceptado"
      ],
      explanation:
          'Juntar las puntas de los dedos puede ser una costumbre o una posición cómoda. No demuestra seguridad ni acuerdo.',
      recommendedAction:
          "Pregunta si falta información para decidir y cómo comunicarán la decisión. Decidir hoy no equivale a aceptar ni a firmar hoy.",
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
        "Se siente bien, como ha dicho",
        "Una forma habitual de hablar o una postura cómoda",
        "Cansancio o preferencia por no conversar sobre su estado"
      ],
      explanation:
          'Una expresión o una voz apagada no permiten decidir que alguien oculta tristeza. La persona puede sentirse bien, estar cansada o preferir no conversar sobre cómo se siente.',
      recommendedAction:
          'Respeta lo que dice y ofrece apoyo opcional: «Gracias por decírmelo. Si te apetece hablar o tener compañía, aquí estoy». No insistas si prefiere espacio.',
      targetAudience: 'autism_focus',
    ),

    // --- CASO 9 (Social/Reunión Larga): Cooperación forzada vs autorregulación ---
    IncongruenceItem(
      id: 'inc_forced_cooperation_regulation',
      speakerRole: 'Compañero durante una reunión larga',
      spokenPhrase: 'Sí, claro, sigamos. Estoy bien.',
      illustrationKey: 'social_fatigue',
      physicalSignals: [
        "Mueve repetidamente un objeto entre las manos",
        "Sonríe brevemente",
        "Orienta el torso hacia la salida"
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        "Quiere continuar, como ha dicho",
        "Mover el objeto puede ayudarle a concentrarse o ser un hábito",
        "Puede querer una pausa, sin que los movimientos lo confirmen"
      ],
      explanation:
          "Mover un objeto, sonreír brevemente o mirar hacia la salida no permite inferir agotamiento ni cooperación forzada. Puedes ofrecer opciones de pausa a cualquier participante y respetar la elección.",
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
        "Entrelaza las manos y aprieta los dedos",
        "Mira hacia la puerta varias veces",
        "Mantiene una sonrisa y orienta el cuerpo hacia la salida"
      ],
      relationship: SignalRelationship.contextDependent,
      possibleInterpretations: [
        "Está disfrutando y quiere quedarse, como ha dicho",
        "Puede estar pendiente de la hora o del transporte",
        "Una postura habitual o una preferencia de espacio"
      ],
      explanation:
          "La persona ha dicho que quiere quedarse. Mirar la puerta y entrelazar las manos no permiten afirmar que su «batería social» esté agotada. Esa expresión es una metáfora de cansancio, no una medida observable.",
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
        'Aprieta la mandíbula y los labios',
        'Suspiro hondo y prolongado con la mirada clavada en el suelo',
        'Hombros rígidos y elevados hacia las orejas',
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        "Se siente bien, como ha dicho",
        "Molestia física o hábito al apretar los dientes",
        "Prefiere espacio o no conversar sobre cómo se siente"
      ],
      explanation:
          'La mandíbula tensa, el suspiro y la postura admiten varias explicaciones. No permiten invalidar la afirmación de bienestar ni concluir que existe tensión emocional oculta.',
      recommendedAction:
          'Puedes responder: «Entiendo. Si quieres hablar o prefieres espacio, dímelo». Acepta su respuesta y evita interrogar.',
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
        "Mira la pantalla del teléfono",
        "Escribe con los pulgares",
        "Asiente mientras sigue mirando la pantalla"
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        "Está escuchando mientras usa el teléfono",
        "Escribe notas u otro mensaje; no conocemos el contenido",
        "Puede necesitar otro momento para conversar"
      ],
      explanation:
          'Escribir en el teléfono puede dificultar el intercambio, pero no permite saber cuánto está escuchando ni si el mensaje es urgente. Coordina el momento para conversar.',
      recommendedAction:
          'Pregunta: «¿Te viene bien que continúe o prefieres terminar con el teléfono primero?». Acuerden cuándo retomar la conversación.',
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
        "Está reuniendo información sin disponer de presupuesto",
        "Puede evaluar opciones para otro momento",
        "Las notas y preguntas no confirman una compra prevista"
      ],
      explanation:
          'La persona ha expresado un límite de presupuesto. Inclinarse o tomar notas no demuestra que quiera comprar ni que el límite sea una excusa.',
      recommendedAction:
          'Respeta el límite: «Gracias por aclararlo. ¿Quieres revisar una opción dentro de ese presupuesto o prefieres dejarlo aquí?». No presupongas que desea financiar la compra.',
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
        "Hay un escritorio amplio entre ambas personas",
        "Mira la pantalla del ordenador",
        "Consulta el reloj de pared"
      ],
      relationship: SignalRelationship.mixed,
      possibleInterpretations: [
        "Puede atenderte, como ha dicho",
        "Está terminando otra tarea",
        "Puede preferir otro horario, si así lo comunica"
      ],
      explanation:
          'El mobiliario, la mirada o consultar el reloj no confirman falta de disponibilidad. La preferencia de horario se puede preguntar directamente.',
      recommendedAction:
          'Puedes decir: «¿Es buen momento para conversar o prefieres que acordemos otro horario?». Deja que la persona elija.',
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
