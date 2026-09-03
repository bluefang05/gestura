import '../models/quiz_question.dart';
import '../models/category.dart';

class QuizDatabase {
  static const List<QuizQuestion> questions = [
    // --- QUIZ CON OPCIONES VISUALES (GRID DE TARJETAS CON IMÁGENES) ---
    QuizQuestion(
      id: 'q_visual_duchenne',
      category: CategoryType.expresionesFaciales,
      prompt:
          '¿Cuál de las siguientes imágenes corresponde a una Sonrisa Genuina (Duchenne)?',
      scenarioText:
          'Observa detenidamente la activación muscular alrededor de los ojos y las mejillas.',
      options: [
        QuizOption(
          id: 'opt_duchenne',
          text: 'Sonrisa A',
          subtext: 'Ojos con arrugas perioculares y mejillas elevadas',
          illustrationKey: 'duchenne_smile',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_polite',
          text: 'Sonrisa B',
          subtext: 'Solo labios estirados, ojos estáticos',
          illustrationKey: 'polite_smile',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_averted',
          text: 'Expresión C',
          subtext: 'Mirada esquiva evitando conexión visual',
          illustrationKey: 'averted_gaze',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_tight',
          text: 'Sonrisa D',
          subtext: 'Labios comprimidos en línea recta',
          illustrationKey: 'tight_lips',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Contracción del músculo orbicular (arrugas "patas de gallo" y ojos achinados).',
      explanation:
          'La Sonrisa de Duchenne (Sonrisa A) involucra involuntariamente el músculo orbicular de los ojos, generando arrugas en los laterales de los ojos. En la Sonrisa Social (B), solo se activa la boca, lo cual denota cortesía o agrado fingido.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_open',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Cuál de estas siluetas muestra una Postura Corporal Receptiva (Relajada y sin barreras)?',
      scenarioText:
          'Observa la posición de los brazos respecto al pecho y torso.',
      options: [
        QuizOption(
          id: 'opt_closed',
          text: 'Silueta A',
          subtext: 'Brazos cruzados frente al pecho',
          illustrationKey: 'closed_posture',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_open',
          text: 'Silueta B',
          subtext: 'Brazos relajados a los lados, pecho despejado',
          illustrationKey: 'open_posture',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_self_hold',
          text: 'Silueta C',
          subtext: 'Sujeción de antebrazo (barrera defensiva parcial)',
          illustrationKey: 'self_hold_arm',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_shrug',
          text: 'Silueta D',
          subtext: 'Hombros elevados con palmas arriba',
          illustrationKey: 'shrug',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Brazos sueltos a los lados y torso despejado sin cruces ni bloqueos.',
      explanation:
          'La Silueta B representa una postura abierta y receptiva: los brazos descansan a los costados sin bloquear el pecho, lo que en interacción cotidiana suele señalar disposición cómoda a conversar.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_steeple',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Cuál de las siguientes imágenes muestra el gesto de "Manos en Ojiva o Pirámide"?',
      scenarioText:
          'Observa la forma y contacto de las manos.',
      options: [
        QuizOption(
          id: 'opt_steeple',
          text: 'Opción 1',
          subtext: 'Yemas de los dedos en pirámide',
          illustrationKey: 'steepling_hands',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_wring',
          text: 'Opción 2',
          subtext: 'Fricción o frotamiento de palmas',
          illustrationKey: 'hand_wringing',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_chin',
          text: 'Opción 3',
          subtext: 'Mano en barbilla (evaluación crítica)',
          illustrationKey: 'hand_on_chin',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_tapping',
          text: 'Opción 4',
          subtext: 'Tamborileo de dedos en la mesa',
          illustrationKey: 'finger_tapping',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Puntas de los dedos opuestos en contacto formando una carpa o pirámide.',
      explanation:
          'La postura de Ojiva o Pirámide (Opción 1) une exclusivamente las yemas de los dedos. A menudo acompaña momentos de calma, reflexión tranquila o precisión técnica al explicar una idea.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_pacifying',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Cuál de estas posturas es un gesto de "Pacificación o Alivio de Estrés" (calmar la ansiedad)?',
      scenarioText:
          'Los gestos pacificadores ocurren cuando el sistema nervioso busca reducir el ritmo cardíaco.',
      options: [
        QuizOption(
          id: 'opt_weight_shift',
          text: 'Figura A',
          subtext: 'Cambio de peso alternado entre ambos pies',
          illustrationKey: 'weight_shift',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_neck_touch',
          text: 'Figura B',
          subtext: 'Mano tocando el hueco del cuello / nuca',
          illustrationKey: 'touching_neck',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_behind_head',
          text: 'Figura C',
          subtext: 'Manos entrelazadas en la nuca',
          illustrationKey: 'hands_behind_head',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_behind_back',
          text: 'Figura D',
          subtext: 'Manos tomadas a la espalda',
          illustrationKey: 'hands_behind_back',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Mano protegiendo la zona vulnerable del cuello/garganta.',
      explanation:
          'Tocarse el cuello o la fosa suprasternal (Figura B) es una de las respuestas automáticas más universales para mitigar la ansiedad o el estrés ante preguntas difíciles o momentos de tensión.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_empathy',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Qué postura corporal comunica "Escucha Activa, Empatía y Conexión No Amenazante"?',
      scenarioText:
          'Fundamental para generar confianza en conversaciones personales o de ventas consultivas.',
      options: [
        QuizOption(
          id: 'opt_headtilt_correct',
          text: 'Opción 1',
          subtext: 'Cabeza inclinada de lado con cuello expuesto',
          illustrationKey: 'head_tilt',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_mirroring',
          text: 'Opción 2',
          subtext: 'Sincronía postural en espejo',
          illustrationKey: 'postural_mirroring',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_pockets_incorrect',
          text: 'Opción 3',
          subtext: 'Manos ocultas en los bolsillos',
          illustrationKey: 'hands_in_pockets',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_feet_exit',
          text: 'Opción 4',
          subtext: 'Pies orientados en dirección a la salida',
          illustrationKey: 'foot_orientation',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Inclinación lateral de la cabeza dejando expuesto el cuello de manera amistosa.',
      explanation:
          'Ladear la cabeza (Opción 1) es una señal biológica de sumisión amistosa y empatía: expone la zona sensible del cuello y demuestra atención completa a lo que la otra persona está diciendo.',
    ),

    QuizQuestion(
      id: 'q_visual_desden',
      category: CategoryType.expresionesFaciales,
      prompt:
          'Identifica la expresión de Desdén o Desprecio (Superioridad / Sarcasmo):',
      scenarioText:
          'Esta microexpresión es crítica en ventas: indica que el interlocutor descalifica la propuesta.',
      options: [
        QuizOption(
          id: 'opt_frown',
          text: 'Expresión 1',
          subtext: 'Ceño fruncido simétrico',
          illustrationKey: 'frowning_brow',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_desden',
          text: 'Expresión 2',
          subtext: 'Media sonrisa asimétrica',
          illustrationKey: 'smirk_contempt',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_narrowed',
          text: 'Expresión 3',
          subtext: 'Ojos entrecerrados con sospecha',
          illustrationKey: 'narrowed_eyes',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lip_biting',
          text: 'Expresión 4',
          subtext: 'Mordida de labio inferior (contención)',
          illustrationKey: 'lip_biting',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Asimetría labial: una sola comisura de los labios se eleva hacia un lado.',
      explanation:
          'El desprecio o desdén es la única emoción universalmente asimétrica en el rostro. Se reconoce porque solo un lado de la boca se curva hacia arriba, a menudo con una mirada altiva.',
    ),
    QuizQuestion(
      id: 'q_visual_proxemics',
      category: CategoryType.proxemica,
      prompt:
          '¿Qué zona de distancia corresponde al Espacio Social (reuniones de negocios y clientes)?',
      scenarioText:
          'La proxémica define los límites aceptables en el entorno laboral neurotípico.',
      options: [
        QuizOption(
          id: 'opt_intima',
          text: 'Zona Íntima',
          subtext: '0 a 45 cm (abrazos y susurros)',
          illustrationKey: 'proxemics_intima',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_personal',
          text: 'Zona Personal',
          subtext: '45 cm a 1.2 m (amigos cercanos)',
          illustrationKey: 'proxemics_personal',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_social',
          text: 'Zona Social',
          subtext: '1.2 m a 3.6 m (trabajo y clientes)',
          illustrationKey: 'proxemics_social',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_publica',
          text: 'Zona Pública',
          subtext: '+3.6 m (discursos y auditorios)',
          illustrationKey: 'proxemics_publica',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El tercer anillo concéntrico (1.2m a 3.6m), equivalente al ancho de una mesa de juntas.',
      explanation:
          'La Zona Social (1.2 a 3.6 metros) es el rango formal seguro para interacciones profesionales y comerciales. Permite interactuar cómodamente sin que ninguna de las partes se sienta invadida.',
    ),
    QuizQuestion(
      id: 'q_visual_paralinguistics_sarcasm',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          '¿Qué gráfico representa una Inflexión Sarcástica / Tono Irónico?',
      scenarioText:
          'En el sarcasmo, la curva tonal se eleva exageradamente y cae de golpe en contradicción con el texto.',
      options: [
        QuizOption(
          id: 'opt_sarcasm_img',
          text: 'Figura 1',
          subtext: 'Curva tonal descendente irónica',
          illustrationKey: 'sarcastic_inflection',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_monotone_img',
          text: 'Figura 2',
          subtext: 'Frecuencia plana sin modulación',
          illustrationKey: 'voice_monotone',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_high_vol_img',
          text: 'Figura 3',
          subtext: 'Megáfono de volumen alto',
          illustrationKey: 'voice_volume_high',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_assertive_img',
          text: 'Figura 4',
          subtext: 'Onda sinusoidal armónica',
          illustrationKey: 'assertive_voice',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Onda tonal con pico ascendente artificial que se desploma con un remate burlón.',
      explanation:
          'La inflexión sarcástica (Figura 1) rompe la melodía natural del habla modulando en exceso para señalar que las palabras pronunciadas son una ironía.',
    ),
    QuizQuestion(
      id: 'q_visual_environment_round_table',
      category: CategoryType.entornoApariencia,
      prompt:
          '¿Cuál de las siguientes disposiciones del mobiliario fomenta la Colaboración Igualitaria sin jerarquías?',
      scenarioText:
          'La psicología del espacio demuestra que la forma de la mesa influye directamente en la toma de decisiones.',
      options: [
        QuizOption(
          id: 'opt_round_table',
          text: 'Opción A',
          subtext: 'Mesa Redonda colaborativa',
          illustrationKey: 'round_table',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_desk_barrier',
          text: 'Opción B',
          subtext: 'Escritorio como barrera de poder',
          illustrationKey: 'desk_barrier',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lighting_env',
          text: 'Opción C',
          subtext: 'Iluminación y calidez ambiental',
          illustrationKey: 'lighting_atmosphere',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_formal_suit',
          text: 'Opción D',
          subtext: 'Código de vestimenta formal',
          illustrationKey: 'dress_formal',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Distribución circular equidistante donde ninguna silla ocupa la cabecera dominante.',
      explanation:
          'La mesa redonda (Opción A) elimina la cabecera del jefe, haciendo que todos los participantes sientan que su opinión tiene el mismo peso y promoviendo la empatía.',
    ),
    QuizQuestion(
      id: 'q_visual_environment_seating_angle',
      category: CategoryType.entornoApariencia,
      prompt:
          '¿Qué posición en la mesa es la "Esquina Cooperativa a 90°" (ideal para cerrar ventas y evitar confrontación)?',
      scenarioText:
          'Sentarse frente a frente (180°) aumenta la resistencia; colocarse a 90° crea sensación de equipo.',
      options: [
        QuizOption(
          id: 'opt_l_angle_img',
          text: 'Disposición 1',
          subtext: 'En L (90 grados) compartiendo mesa',
          illustrationKey: 'seating_angle',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_hands_table',
          text: 'Disposición 2',
          subtext: 'Manos entrelazadas en reposo sobre la mesa',
          illustrationKey: 'hands_clasped_front',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_handshake_stand',
          text: 'Disposición 3',
          subtext: 'Saludo formal de pie con apretón firme',
          illustrationKey: 'handshake_firm',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_casual_dress_img',
          text: 'Disposición 4',
          subtext: 'Vestimenta informal y relajada',
          illustrationKey: 'dress_casual',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Dos sillas contiguas en el ángulo de una mesa mirando hacia el mismo documento.',
      explanation:
          'El ángulo de 90° (Disposición 1) es el posicionamiento estratégico más efectivo: elimina el duelo visual cara a cara y permite que cliente y asesor miren juntos la solución.',
    ),
    QuizQuestion(
      id: 'q_visual_facial_jaw_clench',
      category: CategoryType.expresionesFaciales,
      prompt:
          '¿Cuál de estas expresiones refleja Mandíbula Apretada (Ira contenida / Frustración)?',
      scenarioText:
          'Un signo revelador de que la persona está soportando estrés o desacuerdo sin decirlo.',
      options: [
        QuizOption(
          id: 'opt_jaw_img',
          text: 'Expresión A',
          subtext: 'Maseteros en tensión y labios firmes',
          illustrationKey: 'jaw_clenching',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_nostril_img',
          text: 'Expresión B',
          subtext: 'Aleteo nasal de irritación',
          illustrationKey: 'nostril_flaring',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_eyebrow_img',
          text: 'Expresión C',
          subtext: 'Flash rápido de cejas',
          illustrationKey: 'eyebrow_flash',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_eyelids_img',
          text: 'Expresión D',
          subtext: 'Párpados cerrados prolongados de rechazo',
          illustrationKey: 'closed_eyelids',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Borde mandibular endurecido y abultamiento en los ángulos de la mandíbula.',
      explanation:
          'Apretar la mandíbula (Expresión A) es un indicador clave de que el interlocutor está conteniendo un reclamo o una gran tensión interna.',
    ),
    QuizQuestion(
      id: 'q_visual_digital_seen_ticks',
      category: CategoryType.comunicacionDigital,
      prompt:
          '¿Qué ilustración representa el fenómeno de "Dejar en Visto / Doble Check sin Respuesta"?',
      scenarioText:
          'En la mensajería moderna, el tiempo transcurrido tras la lectura comunica intención implícita.',
      options: [
        QuizOption(
          id: 'opt_visto_img',
          text: 'Figura A',
          subtext: 'Doble tilde azul con reloj de espera',
          illustrationKey: 'digital_visto',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_caps_img',
          text: 'Figura B',
          subtext: 'Burbuja de texto con exclamaciones de grito',
          illustrationKey: 'digital_mayusculas',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_emoji_img',
          text: 'Figura C',
          subtext: 'Emoticono cálido en el chat',
          illustrationKey: 'digital_emojis',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_audio_img',
          text: 'Figura D',
          subtext: 'Nota de voz con barra de reproducción',
          illustrationKey: 'digital_audio',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Doble check de confirmación de lectura acompañado de un reloj de espera prolongado.',
      explanation:
          'El doble check azul con reloj (Figura A) simboliza que el mensaje fue recibido y abierto, pero el destinatario eligió postergar o evitar responder.',
    ),

    // --- QUIZZES DE ANÁLISIS DE CASO Y VENTAS ---
    QuizQuestion(
      id: 'q_sales_arms_crossed',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Durante una presentación de ventas, el cliente cruza los brazos y aprieta los labios. ¿Qué significa?',
      questionIllustrationKey: 'closed_posture',
      scenarioText: 'Acabas de mencionar el precio mensual del servicio.',
      options: [
        QuizOption(
          id: 'opt_1',
          text:
              'El cliente está muy convencido y listo para firmar el contrato.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_2',
          text:
              'Tiene objeciones no expresadas o desacuerdo con lo que acaba de escuchar.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_3',
          text:
              'Solo está cansado físicamente y quiere que sigas hablando más rápido.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_4',
          text: 'Es una señal de sumisión y aceptación pasiva.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Combinación de barrera física (brazos cruzados) + contención verbal (labios apretados).',
      explanation:
          'Cuando los brazos cruzados se combinan con labios apretados, la persona está reteniendo una objeción o desacuerdo. La mejor respuesta es pausar y preguntar: "¿Qué impresión te da esta cifra?" para permitirle desahogar la duda.',
    ),
    QuizQuestion(
      id: 'q_para_sarcasm',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Tu compañero te dice "¡Qué maravillosa idea!" arrastrando las palabras y con tono plano. ¿Cómo interpretarlo?',
      questionIllustrationKey: 'sarcastic_inflection',
      scenarioText:
          'Propusiste trabajar el sábado por la tarde para terminar un informe.',
      options: [
        QuizOption(
          id: 'opt_literal',
          text: 'Literalmente piensa que es una idea brillante y entusiasta.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_sarcastico',
          text:
              'Es sarcasmo: el tono plano e incongruente indica que piensa que es mala idea.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_duda',
          text: 'No escuchó bien y está pidiendo que lo repitas.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Incongruencia entre la palabra positiva ("maravillosa") y el tono descendente/arrastrado, con rostro habitualmente neutro.',
      explanation:
          'En la vida cotidiana, las personas que usan sarcasmo no suelen hacer muecas exageradas ni sonreír; suelen mantener el rostro neutro (poker face). La contradicción está entre la palabra positiva y la melodía arrastrada o plana de la voz.',
    ),
    QuizQuestion(
      id: 'q_digital_caps',
      category: CategoryType.comunicacionDigital,
      prompt:
          'Un cliente te envía por WhatsApp: "NECESITO EL REPORTE AHORA MISMO". ¿Qué tono transmite?',
      questionIllustrationKey: 'digital_mayusculas',
      scenarioText: 'Mensajería instantánea en horario laboral.',
      options: [
        QuizOption(
          id: 'opt_normal',
          text: 'Es un mensaje casual sin ninguna emoción particular.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_grito',
          text:
              'Transmite urgencia extrema, enojo o exigencia imperativa (equivalente a gritar).',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_positivo',
          text: 'Indica entusiasmo y alegría por recibir el reporte.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Todas las palabras en MAYÚSCULAS sostenidas en comunicación digital.',
      explanation:
          'En el código no escrito de internet, escribir todo en mayúsculas se interpreta casi unánimemente como levantar la voz o gritar con frustración o extrema urgencia.',
    ),
    QuizQuestion(
      id: 'q_leaning_forward_meaning',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En una entrevista de trabajo, el entrevistador se inclina hacia adelante sobre la mesa y asiente. ¿Qué indica?',
      questionIllustrationKey: 'leaning_forward',
      scenarioText:
          'Estás describiendo cómo resolviste un problema técnico complejo.',
      options: [
        QuizOption(
          id: 'opt_a',
          text:
              'Alto interés, enganche positivo y deseo de escuchar más detalles.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_b',
          text: 'Intimidación y deseo de que te calles de inmediato.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_c',
          text: 'Desinterés y aburrimiento.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Inclinación del torso hacia adelante + asentimiento rítmico.',
      explanation:
          'Inclinarse hacia adelante (*leaning in*) reduce la distancia psicológica y demuestra que la persona está genuinamente interesada en lo que estás diciendo.',
    ),
    QuizQuestion(
      id: 'q_reflective_vs_tense_silence',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Observa las dos escenas. ¿Cuál es la forma más cuidadosa de interpretar la diferencia?',
      questionIllustrationKey: 'reflective_vs_tense_silence',
      scenarioText:
          'Ambas personas están calladas, pero el contexto corporal y ambiental es distinto.',
      options: [
        QuizOption(
          id: 'opt_context_matters',
          text:
              'El silencio necesita contexto: una postura tranquila puede indicar reflexión y una postura tensa puede justificar ofrecer una pausa, sin asumir el motivo.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_silence_always_bad',
          text:
              'Todo silencio significa que la persona está molesta o no quiere participar.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_eye_contact_rule',
          text:
              'Basta con mirar si hace contacto visual para saber exactamente lo que siente.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La escena reflexiva muestra un entorno tranquilo y postura relajada; la otra combina manos tensas, mirada de alerta y contexto social cargado.',
      explanation:
          'El silencio no tiene un diccionario único. Observa varias señales, pregunta con respeto y deja que la persona indique si necesita tiempo, claridad o una pausa.',
    ),
    QuizQuestion(
      id: 'q_emoji_as_support',
      category: CategoryType.comunicacionDigital,
      prompt:
          'Tras un mensaje personal largo, recibes solamente un emoji de corazón entre manos. ¿Qué conclusión es más razonable?',
      questionIllustrationKey: 'emoji_support',
      scenarioText: 'La otra persona no añade texto en ese momento.',
      options: [
        QuizOption(
          id: 'opt_emoji_contextual',
          text:
              'Puede ser apoyo o confirmación de lectura; si necesitas más contexto, puedes pedirlo sin asumir indiferencia.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_emoji_rejection',
          text: 'Seguro está ignorando el mensaje y no le importa.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_emoji_complete',
          text:
              'Un emoji siempre comunica exactamente la misma emoción para todas las personas.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El emoji añade una señal afectiva, pero el canal digital conserva ambigüedad y depende de la relación y el contexto.',
      explanation:
          'Los emojis pueden hacer una respuesta más cálida y reducir la carga de escribir. Una comunicación clara permite preguntar qué quiso expresar la otra persona.',
    ),
    QuizQuestion(
      id: 'q_social_fatigue_support',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Una persona sonríe en una reunión, pero mantiene las manos tensas y mira varias veces hacia la salida. ¿Qué respuesta es más respetuosa?',
      questionIllustrationKey: 'social_fatigue',
      scenarioText: 'No conoces con certeza el motivo de las señales.',
      options: [
        QuizOption(
          id: 'opt_offer_exit',
          text:
              'Ofrecer una pausa o una salida sin presionar: “Si quieres tomar aire o irte, está bien”.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_call_out',
          text: 'Decir delante del grupo que su sonrisa es falsa.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_force_stay',
          text: 'Pedirle que se quede para demostrar que está disfrutando.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La combinación puede sugerir esfuerzo o cansancio, pero no permite afirmar una causa concreta.',
      explanation:
          'En vez de interpretar una señal aislada como una verdad, ofrece una opción de apoyo y respeta la respuesta de la persona.',
    ),
    QuizQuestion(
      id: 'q_zoom_camera_off',
      category: CategoryType.comunicacionDigital,
      prompt:
          'En una videollamada comercial de Zoom, el cliente apaga repentinamente su cámara justo después de que muestras la diapositiva de precios. ¿Qué significa y qué deberías hacer?',
      scenarioText: 'La llamada continuó solo con su micrófono activo.',
      options: [
        QuizOption(
          id: 'opt_zoom_ignore',
          text: 'Ignorarlo y seguir hablando 15 minutos más hasta el final.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_zoom_probe',
          text:
              'Pausa estratégica y chequeo amable: "Veo que pausaste la cámara, ¿se sigue viendo bien la pantalla o prefieres que revisemos este número en detalle?".',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_zoom_angry',
          text: 'Exigirle que encienda la cámara por respeto profesional.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Apagar la cámara tras un estímulo de alto impacto suele ocultar una reacción facial negativa o consulta privada con un colega.',
      explanation:
          'El apagado súbito de cámara en Zoom es el equivalente digital a retirarse hacia atrás. Hacer una pausa respetuosa permite averiguar si hubo un problema técnico o un impacto presupuestario.',
    ),
    QuizQuestion(
      id: 'q_chat_dry_period',
      category: CategoryType.comunicacionDigital,
      prompt:
          'Envías una propuesta detallada por Slack y tu colega responde únicamente: "Ok." con punto final seco. ¿Cómo debes interpretarlo?',
      scenarioText: 'En chats informales, el punto final aislado suele generar ambigüedad.',
      options: [
        QuizOption(
          id: 'opt_dry_hate',
          text: 'Asumir con certeza que está furioso contigo y dejar de hablarle.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_dry_context',
          text:
              'No asumir hostilidad inmediata: muchas personas usan el punto por hábito ortográfico o responden desde el móvil con prisa. Si hay dudas, pregunta en persona o por llamada breve.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_dry_revenge',
          text: 'Responderle con otro "Ok." para competir en frialdad.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La brevedad digital carece de tono de voz; atribuir malicia sin confirmar es un sesgo común.',
      explanation:
          'La comunicación por texto tiene un sesgo de negatividad inherente. Una respuesta corta puede ser simple eficiencia de tiempo, no desagrado.',
    ),
    QuizQuestion(
      id: 'q_elevator_small_talk_weather',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'En el ascensor, un directivo te dice: "Parece que va a llover fuerte hoy". ¿Cuál es el propósito real de su comentario?',
      scenarioText: 'No es una consulta meteorológica técnica.',
      options: [
        QuizOption(
          id: 'opt_weather_ping',
          text:
              'Es un "ping de red no verbal": busca abrir el canal social en son de paz y reconocer tu presencia sin invadir tu intimidad.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_weather_stats',
          text: 'Espera que le des un informe meteorológico detallado de milímetros de agua.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_weather_trap',
          text: 'Es una pregunta trampa para evaluar tus conocimientos científicos.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El contenido literal es intrascendente; la función biológica es la sincronización y cordialidad.',
      explanation:
          'El small talk funciona como un apretón de manos sónico. Basta responder con una frase ligera y una sonrisa para completar el ritual.',
    ),
    QuizQuestion(
      id: 'q_indirect_yo_me_encargo',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Tu compañero suspira brevemente con los hombros caídos y dice: "No te preocupes, yo me encargo de terminarlo...". ¿Qué está comunicando en realidad?',
      scenarioText: 'Su postura es de sobrecarga y cansancio.',
      options: [
        QuizOption(
          id: 'opt_encargo_happy',
          text: 'Que tiene tiempo de sobra y disfruta haciendo todo el trabajo solo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_encargo_help',
          text:
              'Siente sobrecarga o molestia; la cortesía neurotípica le impide pedir ayuda de forma directa y espera que insistas en colaborar.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_encargo_leave',
          text: 'Que debes irte de inmediato de la sala sin decir nada.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Suspiro + hombros caídos contradicen el texto amable de la frase.',
      explanation:
          'Insistir amablemente una vez: "De verdad, permíteme ayudarte con una parte para que salgamos a tiempo" desactiva el resentimiento y construye compañerismo.',
    ),
    QuizQuestion(
      id: 'q_cluster_cold_vs_defense',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En una oficina a 17 °C con aire acondicionado directo, alguien cruza los brazos, se frota los bíceps y encoge el cuello. ¿Cómo se interpreta?',
      scenarioText: 'Aplica la regla de los conglomerados con contexto ambiental.',
      options: [
        QuizOption(
          id: 'opt_cold_temp',
          text:
              'Frío ambiental. El frotamiento de brazos y encogimiento buscan conservar el calor corporal.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_cold_hate',
          text: 'Actitud de cerrazón psicológica y hostilidad hacia las personas de la sala.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_cold_bored',
          text: 'Desinterés absoluto en la reunión.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El frotamiento activo de bíceps es incompatible con la postura de barrera desafiante.',
      explanation:
          'Nunca leas un gesto sin considerar el entorno. El frotamiento de extremidades busca generar fricción térmica, no defensa psicológica.',
    ),
    QuizQuestion(
      id: 'q_baseline_calm_vs_lying',
      category: CategoryType.expresionesFaciales,
      prompt:
          'Un candidato habla bajito y parpadea con alta frecuencia desde que entró y saludó en la entrevista. Al preguntarle por sus estudios, mantiene exactamente el mismo patrón. ¿Es señal de engaño?',
      scenarioText: 'Compara su respuesta con su Línea Base observada desde el minuto 1.',
      options: [
        QuizOption(
          id: 'opt_base_liar',
          text: 'Sí, porque el parpadeo rápido siempre indica mentira.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_base_norm',
          text:
              'No. Es su Línea Base habitual de timidez o nerviosismo general; no hubo ninguna desviación súbita.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_base_guilty',
          text: 'Significa que cometió un fraude en su título universitario.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La ausencia de cambio respecto al inicio descarta una reacción específica a la pregunta.',
      explanation:
          'Las pistas no verbales de estrés solo son reveladoras si representan una alteración notable respecto a la conducta basal normal del individuo.',
    ),
    QuizQuestion(
      id: 'q_sales_leaning_back_objection',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Tras mencionar el precio de tu servicio, el cliente recuesta el torso hacia atrás en su silla, aprieta los labios y baja la mirada. ¿Qué deberías hacer?',
      scenarioText: 'Apareció un conglomerado de 3 señales de distanciamiento.',
      options: [
        QuizOption(
          id: 'opt_lean_push',
          text: 'Acelerar el discurso y presionar para que firme el contrato de inmediato.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lean_pause',
          text:
              'Frenar la presentación y validar con empatía: "Noto que este punto te genera dudas, ¿cómo lo ves respecto a lo que tenían presupuestado?".',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_lean_leave',
          text: 'Levantarte y dar por perdida la venta sin preguntar.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Reclinación hacia atrás + labios apretados = freno mental y distanciamiento.',
      explanation:
          'El distanciamiento corporal indica que la mente del cliente se desconectó de la compra. Seguir vendiendo sin resolver la duda genera rechazo total.',
    ),
    QuizQuestion(
      id: 'q_group_horseshoe_u_entry',
      category: CategoryType.proxemica,
      prompt:
          'En un evento de networking, ves a tres personas de pie cuyos cuerpos forman un ángulo hacia afuera en forma de "herradura" o "U". ¿Qué significa?',
      scenarioText: 'Observa la apertura geométrica del grupo.',
      options: [
        QuizOption(
          id: 'opt_u_open',
          text:
              'Círculo abierto: la disposición geométrica del grupo invita subconscientemente a que otros se unan a la conversación.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_u_closed',
          text: 'Están en una reunión secreta y confidencial donde está prohibido acercarse.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_u_leaving',
          text: 'Significa que todos se van a marchar en 5 segundos.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El espacio libre en la herradura deja una puerta de entrada social visible.',
      explanation:
          'Los grupos abiertos en "U" son los más accesibles para integrarse. Acércate a distancia social (1.5 m) con contacto visual cordial.',
    ),
    QuizQuestion(
      id: 'q_interview_hands_pocket',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Por qué los expertos en comunicación recomiendan no mantener las manos dentro de los bolsillos durante una entrevista de trabajo?',
      scenarioText: 'Evolución psicológica y señales de apertura.',
      options: [
        QuizOption(
          id: 'opt_hands_evol',
          text:
              'El cerebro humano primitivo interpreta las manos ocultas como una posible amenaza o reserva de información; las manos visibles generan confianza instintiva.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_hands_dirty',
          text: 'Porque se ensucia la ropa del pantalón.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_hands_illegal',
          text: 'Porque está penalizado legalmente en contratos laborales.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Las manos a la vista comunican transparencia, honestidad y calma.',
      explanation:
          'Tener las manos visibles sobre la mesa o reposabrazos aumenta la percepción de honestidad y reduce el nivel de alerta del interlocutor.',
    ),
    QuizQuestion(
      id: 'q_nervous_laughter_mistake',
      category: CategoryType.expresionesFaciales,
      prompt:
          'Expones un dato erróneo en una reunión y tu compañero se ríe mostrando los dientes pero con el cuello rígido y mirando al suelo. ¿Qué tipo de risa es?',
      scenarioText: 'Diferenciación entre diversión y alivio de tensión.',
      options: [
        QuizOption(
          id: 'opt_laugh_nervous',
          text:
              'Risa nerviosa o de apaciguamiento: su cerebro intenta suavizar el momento incómodo sin herir la armonía social.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_laugh_mocking',
          text: 'Una burla malintencionada porque disfruta de tus errores.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_laugh_duchenne',
          text: 'Una risa de felicidad plena y alegría compartida.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La ausencia de arrugas perioculares y la tensión del cuello delatan incomodidad.',
      explanation:
          'La risa pacífica es muy común en situaciones embarazosas. No la tomes como ofensa personal; corrige el dato con serenidad y continúa.',
    ),
    QuizQuestion(
      id: 'q_poker_face_sarcasm',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Un colega dice con cara seria e inexpresiva: "Sí, seguro que el servidor se arregla solo mágicamente...". ¿Qué elemento confirma el sarcasmo?',
      scenarioText: 'La expresión facial es neutra (deadpan).',
      options: [
        QuizOption(
          id: 'opt_sarcasm_para',
          text:
              'La entonación vocal y el contenido absurdo de la afirmación, a pesar de la ausencia de muecas en su rostro.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_sarcasm_literal',
          text: 'Cree literalmente en magia tecnológica porque no sonrió.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_sarcasm_anger',
          text: 'Está experimentando un ataque de pánico silencioso.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El sarcasmo en adultos suele expresarse con cara plana y modulación paralingüística.',
      explanation:
          'No esperes que la gente sonría con malicia cuando es irónica. En adultos, el tono y la lógica interna de la frase son la clave.',
    ),
    QuizQuestion(
      id: 'q_blank_mind_power_pause',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'En plena entrevista de trabajo te quedas en blanco al explicar un proyecto. ¿Cuál es la mejor respuesta física e inmediata?',
      scenarioText: 'Bloqueo cognitivo momentáneo.',
      options: [
        QuizOption(
          id: 'opt_blank_pause',
          text:
              'Hacer una "Pausa de Poder": inhalar hondo con calma, asentir lentamente 2 segundos y ordenar la idea sin decir muletillas de pánico ("ehhh...").',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_blank_panic',
          text: 'Gritar que lo sientes mucho y taparte la cara con las dos manos.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_blank_invent',
          text: 'Inventar palabras rápidamente sin sentido para no dejar ni 1 segundo de silencio.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Una pausa ejecutada con compostura se percibe como reflexión profunda, no como error.',
      explanation:
          'Los evaluadores respetan a quienes controlan el silencio con seguridad. Un respiro profundo de 2 segundos te devuelve el control mental.',
    ),
    QuizQuestion(
      id: 'q_sensory_overload_escape',
      category: CategoryType.entornoApariencia,
      prompt:
          'Estás en una cena concurrida y sientes que las luces, música y conversaciones cruzadas están colapsando tu batería sensorial. ¿Cómo retirarte con dignidad?',
      scenarioText: 'Necesidad de autorregulación y autocuidado.',
      options: [
        QuizOption(
          id: 'opt_escape_grace',
          text:
              'Usar una fórmula breve y amable: "Con permiso, voy a tomar un poco de aire fresco afuera / beber agua" o despedirte agradeciendo la velada para ir a descansar.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_escape_rude',
          text: 'Salir corriendo sin decir nada a nadie y bloquear a todos en el móvil.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_escape_endure',
          text: 'Aguantar el dolor sensorial hasta tener una crisis pública para complacer a los demás.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Cuidar tus límites no requiere disculpas excesivas ni confrontación.',
      explanation:
          'Tu salud mental es prioritaria. Una frase sencilla y cordial te permite retirarte con elegancia y sin culpa.',
    ),
    QuizQuestion(
      id: 'q_meeting_head_of_table',
      category: CategoryType.entornoApariencia,
      prompt:
          'Llegas temprano a una junta corporativa donde tu rol es técnico y de apoyo. La cabecera de la mesa está libre. ¿Dónde te conviene sentarte?',
      scenarioText: 'Proxémica y jerarquía espacial en oficinas.',
      options: [
        QuizOption(
          id: 'opt_table_side',
          text:
              'En un lateral intermedio: permite buena visibilidad de la pantalla y de los participantes sin asumir un rol jerárquico no asignado.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_table_head',
          text: 'En la cabecera principal para demostrar poder supremo al jefe.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_table_floor',
          text: 'En el suelo en una esquina para no ocupar muebles.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La cabecera comunica conducción de la reunión; los laterales equilibran participación.',
      explanation:
          'Respetar la proxémica de liderazgo en salas de juntas evita fricciones políticas innecesarias y te posiciona como colaborador confiable.',
    ),
    QuizQuestion(
      id: 'q_audio_voice_drawl_confidence',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          '¿Cómo afecta hablar con un tono excesivamente agudo y a velocidad acelerada al presentar los precios de tu servicio?',
      scenarioText: 'Fisiología vocal y percepción de autoridad.',
      options: [
        QuizOption(
          id: 'opt_voice_insecure',
          text:
              'Comunica inseguridad o miedo al rechazo; la voz tiende a agudizarse cuando las cuerdas vocales se tensan por estrés.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_voice_pro',
          text: 'Genera máxima confianza y parece una oferta irresistible.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_voice_fun',
          text: 'Hace que el cliente se sienta en una fiesta de cumpleaños.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El descenso a un tono de voz grave y pausado proyecta solidez y certeza en el valor ofertado.',
      explanation:
          'Modular la voz hacia el registro grave y hacer una pausa firme tras decir el precio transmite confianza absoluta en el valor de tu trabajo.',
    ),
    QuizQuestion(
      id: 'q_feet_towards_door_exit',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Llevas 5 minutos hablando con un colega en el pasillo y notas que uno de sus pies apunta perpendicularmente hacia la puerta de salida. ¿Qué significa?',
      questionIllustrationKey: 'foot_orientation',
      scenarioText: 'Su torso aún te mira, pero sus pies apuntan al pasillo.',
      options: [
        QuizOption(
          id: 'opt_feet_leave',
          text:
              'Orientación podal de fuga: su cuerpo ya se prepara para marcharse porque tiene un pendiente urgente.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_feet_dance',
          text: 'Está practicando pasos de baile discretamente.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_feet_deaf',
          text: 'Tiene problemas de equilibrio físico.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Los pies son la parte más sincera del cuerpo porque están más lejos del cerebro consciente.',
      explanation:
          'Cerrar tú la conversación primero ("No te quito más tiempo, seguimos luego") transmite madurez social y alivia a la otra persona.',
    ),
    QuizQuestion(
      id: 'q_phone_screen_barrier',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Hablas con alguien y te dice: "Te escucho, te escucho", pero mantiene los ojos fijos en la pantalla del teléfono tecleando. ¿Qué sucede con su escucha activa?',
      scenarioText: 'Atención secuestrada por el dispositivo digital.',
      options: [
        QuizOption(
          id: 'opt_phone_divided',
          text:
              'Su atención cognitiva está fragmentada; su asentimiento es un automatismo social para no interrumpir su uso del teléfono.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_phone_genius',
          text: 'Tiene capacidad cerebral sobrehumana y procesa todo al 100% sin esfuerzo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_phone_blind',
          text: 'Está ciego y usa el teléfono con ecolocalización.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Sin contacto visual ni orientación del torso, la escucha profunda es inexistente.',
      explanation:
          'Hacer una pausa en silencio amable sin enfadarte logra que la persona levante la mirada y decida conscientemente si atenderte o pedir un minuto.',
    ),
    QuizQuestion(
      id: 'q_boss_open_door_closed_desk',
      category: CategoryType.entornoApariencia,
      prompt:
          'Un jefe dice promover una "política de puertas abiertas", pero en su oficina mantiene un escritorio macizo de 2 metros interpuesto entre él y los visitantes. ¿Qué efecto tiene?',
      questionIllustrationKey: 'desk_barrier',
      scenarioText: 'Barrera física en el entorno laboral.',
      options: [
        QuizOption(
          id: 'opt_desk_barrier',
          text:
              'Crea una barrera psicológica de poder y distancia que desmiente en los hechos la supuesta apertura verbal.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_desk_inviting',
          text: 'Invita a que los empleados se sienten en su regazo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_desk_no_effect',
          text: 'El mobiliario nunca influye en la psicología de las personas.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Los objetos voluminosos intermedios actúan como escudos de territorio y estatus.',
      explanation:
          'Los líderes accesibles suelen salir de detrás del escritorio y sentarse en una mesa redonda o sillones a la misma altura.',
    ),
    QuizQuestion(
      id: 'q_backchannel_micro_nod',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Pides un artículo en una tienda y la dependiente hace dos micro-asentimientos rápidos hacia abajo con la cabeza mientras teclea en su sistema sin hablar. ¿Qué significa?',
      scenarioText: 'Interacción en servicios comerciales rápidos.',
      options: [
        QuizOption(
          id: 'opt_nod_ack',
          text:
              'Confirmación no verbal de recepción (Backchanneling): "Te escuché y lo estoy registrando en el sistema", sin necesidad de hablar.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_nod_ignore',
          text: 'Te está ignorando deliberadamente y debes gritarle la orden de nuevo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_nod_sleep',
          text: 'Tiene sueño y se está quedando dormida de pie.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El micro-asentimiento sustituye a la palabra en entornos de trabajo continuo.',
      explanation:
          'Esperar tranquilamente unos segundos demuestra calibración social y evita generar tensiones innecesarias con el personal de servicio.',
    ),
    QuizQuestion(
      id: 'q_touch_neck_supraspinal',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En medio de una negociación, la contraparte lleva su mano hacia la fosa del cuello (el hoyuelo sobre la clavícula) y presiona suavemente. ¿Qué proceso fisiológico ocurre?',
      scenarioText: 'Gesto de pacificación neurovegetativa.',
      options: [
        QuizOption(
          id: 'opt_neck_pacify',
          text:
              'Es un gesto pacificador: al presionar el nervio vago y los bulbos carotídeos en el cuello, el cuerpo busca bajar el ritmo cardíaco ante un pico de estrés.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_neck_fashion',
          text: 'Solo está acomodando una joya o corbata imaginaria sin ningún motivo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_neck_attack',
          text: 'Se prepara para lanzar un golpe físico.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Tocar o cubrir la fosa del cuello es uno de los pacificadores más potentes del cuerpo humano.',
      explanation:
          'Indica vulnerabilidad o preocupación aguda. Si ves este gesto, suaviza el tono y pregunta qué aspecto le genera incomodidad.',
    ),
    QuizQuestion(
      id: 'q_open_palms_truth',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Por qué mostrar las palmas abiertas hacia arriba a la altura de la cintura se asocia universalmente con sinceridad y cooperación?',
      scenarioText: 'Historia evolutiva de los gestos manuales.',
      options: [
        QuizOption(
          id: 'opt_palms_evol',
          text:
              'Comunica que no hay armas ocultas ni secretos; expone zonas vulnerables de la mano transmitiendo transparencia total.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_palms_rain',
          text: 'Sirve para comprobar si está lloviendo dentro de la habitación.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_palms_beg',
          text: 'Es una señal exclusiva para pedir limosna o dinero.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Las palmas abiertas invitan a la colaboración y bajan la resistencia del interlocutor.',
      explanation:
          'Usar palmas abiertas en presentaciones y acuerdos fomenta acuerdos más rápidos y reduce la hostilidad de la contraparte.',
    ),
    QuizQuestion(
      id: 'q_cluster_dating_interest',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En una conversación casual, la persona se inclina hacia adelante, acomoda su cabello dejando el cuello al descubierto y sonríe con arrugas alrededor de los ojos. ¿Qué indica este conglomerado?',
      scenarioText: 'Tres señales coincidentes de apertura y comodidad.',
      options: [
        QuizOption(
          id: 'opt_date_interest',
          text:
              'Alto interés, comodidad y atracción en la interacción; las tres señales apuntan a apertura e involucramiento emocional.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_date_boredom',
          text: 'Aburrimiento profundo y deseo de terminar el encuentro.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_date_hostile',
          text: 'Preparación para una discusión agresiva.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Inclinación frontal + exposición de zonas vulnerables + sonrisa Duchenne.',
      explanation:
          'El conglomerado confirma una actitud receptiva y conectada. Es un momento propicio para profundizar la charla.',
    ),
    QuizQuestion(
      id: 'q_interview_foot_kick',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Un candidato en entrevista comienza a sacudir o balancear rápidamente un pie en el aire justo cuando le preguntas por qué renunció a su empleo anterior. ¿Qué indica?',
      scenarioText: 'Desviación fisiológica en las extremidades inferiores.',
      options: [
        QuizOption(
          id: 'opt_foot_stress',
          text:
              'Pico de ansiedad o tensión reprimida: el movimiento repetitivo del pie disipa el cortisol activado por la pregunta difícil.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_foot_calm',
          text: 'Tranquilidad absoluta y satisfacción plena.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_foot_nap',
          text: 'Deseo de dormir una siesta.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El movimiento rítmico de pies y piernas es un pacificador inconsciente de estrés.',
      explanation:
          'Las extremidades inferiores filtran la ansiedad que el rostro intenta ocultar. Mantén la calma y escucha su explicación sin juzgar de golpe.',
    ),
    QuizQuestion(
      id: 'q_sales_mirroring_empathy',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En una reunión de negocios, notas que cuando apoyas el antebrazo sobre la mesa, tu cliente adopta una postura similar tras unos segundos. ¿Qué fenómeno ocurre?',
      scenarioText: 'Sincronía postural inconsciente (Rapport).',
      options: [
        QuizOption(
          id: 'opt_mirror_rapport',
          text:
              'Efecto camaleón o reflejo especular (Mirroring): el cerebro activa neuronas espejo para sincronizarse cuando hay empatía y acuerdo.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_mirror_mock',
          text: 'El cliente se está burlando de ti como un mimo profesional.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_mirror_sleep',
          text: 'Ambos tienen una contractura muscular idéntica por mala suerte.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'El espejo postural espontáneo es un indicador biológico de sintonía interpersonal.',
      explanation:
          'El mimetismo postural confirma que la comunicación fluye con confianza y menor resistencia cognitiva.',
    ),
    QuizQuestion(
      id: 'q_audio_monotone_burnout',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Un integrante del equipo responde a todas las preguntas con voz completamente plana, sin altibajos, tono apagado y hombros caídos. ¿Qué sugiere?',
      scenarioText: 'Pérdida de modulación y vitalidad paralingüística.',
      options: [
        QuizOption(
          id: 'opt_burnout_fatigue',
          text:
              'Fatiga crónica, sobrecarga mental o desmotivación (burnout); la depresión o agotamiento apagan la melodía vocal natural.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_burnout_joy',
          text: 'Alegría desbordante por las nuevas tareas asignadas.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_burnout_prank',
          text: 'Una broma pesada para asustar al jefe.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La voz monótona y el ritmo ralentizado son marcas paralingüísticas de agotamiento.',
      explanation:
          'La melodía vocal refleja el estado de ánimo. Un tono plano sostenido amerita un chequeo de apoyo o ajuste de carga de trabajo.',
    ),
    QuizQuestion(
      id: 'q_digital_caps_urgency',
      category: CategoryType.comunicacionDigital,
      prompt:
          'Un cliente envía por WhatsApp: "HOLA, ¿TIENEN RESPUESTA DE MI PEDIDO?!". ¿Cómo debes calibrar tu respuesta?',
      scenarioText: 'Canal digital: mayúsculas sostenidas y signos combinados.',
      options: [
        QuizOption(
          id: 'opt_caps_calm',
          text:
              'Responder con rapidez, tono calmado y datos concretos sin responder en mayúsculas; las mayúsculas denotan urgencia o frustración que requiere contención rápida.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_caps_shout',
          text: 'Gritarle de vuelta con MAYÚSCULAS para imponer autoridad.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_caps_block',
          text: 'Bloquear su número de inmediato sin contestar.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'En el código digital, las mayúsculas equivalen al volumen alzado de voz.',
      explanation:
          'Desescalar la urgencia con una respuesta ágil, serena y estructurada neutraliza la ansiedad del cliente de forma inmediata.',
    ),
  ];

  static List<QuizQuestion> getByCategory(CategoryType category) {
    return questions.where((q) => q.category == category).toList();
  }

  static List<QuizQuestion> getImageCardQuestions() {
    return questions.where((q) => q.isImageOptionGrid).toList();
  }
}
