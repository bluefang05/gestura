import 'quiz_expansion.dart';
import '../models/quiz_question.dart';
import '../models/category.dart';

class QuizDatabase {
  static const List<QuizQuestion> questions = [
    // --- QUIZ CON OPCIONES VISUALES (GRID DE TARJETAS CON IMÁGENES) ---
    QuizQuestion(
      id: 'q_visual_duchenne',
      category: CategoryType.expresionesFaciales,
      prompt:
          '¿Cuál de las siguientes imágenes corresponde a una Sonrisa con arrugas junto a los ojos?',
      scenarioText: 'Fíjate en las mejillas y en las arrugas junto a los ojos.',
      options: [
        QuizOption(
          id: 'opt_duchenne',
          text: 'Arrugas junto a los ojos y mejillas elevadas',
          illustrationKey: 'duchenne_smile',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_polite',
          text: 'Solo labios estirados, ojos estáticos',
          illustrationKey: 'polite_smile',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_averted',
          text: 'Mirada esquiva evitando conexión visual',
          illustrationKey: 'averted_gaze',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_tight',
          text: 'Labios comprimidos en línea recta',
          illustrationKey: 'tight_lips',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Las mejillas se elevan y aparecen arrugas junto a los ojos.',
      explanation:
          'Busca la sonrisa con mejillas elevadas y arrugas junto a los ojos. Eso describe la imagen; no demuestra que la persona sienta alegría.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_open',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿Qué imagen muestra los brazos descansando a los lados del cuerpo?',
      scenarioText:
          'Observa la posición de los brazos respecto al pecho y torso.',
      options: [
        QuizOption(
          id: 'opt_closed',
          text: 'Brazos cruzados frente al pecho',
          illustrationKey: 'closed_posture',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_open',
          text: 'Brazos relajados a los lados, pecho despejado',
          illustrationKey: 'open_posture',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_self_hold',
          text: 'Una mano sujeta el otro brazo',
          illustrationKey: 'self_hold_arm',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_shrug',
          text: 'Hombros elevados con palmas arriba',
          illustrationKey: 'shrug',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Brazos sueltos a los lados y torso despejado sin cruces ni bloqueos.',
      explanation:
          'Los brazos descansan a los lados. A veces se llama postura abierta, pero no demuestra ganas de conversar.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_steeple',
      category: CategoryType.lenguajeCorporal,
      prompt:
          '¿En cuál imagen se juntan las puntas de los dedos como un tejado?',
      scenarioText: 'Observa la forma y contacto de las manos.',
      options: [
        QuizOption(
          id: 'opt_steeple',
          text: 'Yemas de los dedos en pirámide',
          illustrationKey: 'steepling_hands',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_wring',
          text: 'Las palmas se frotan entre sí',
          illustrationKey: 'hand_wringing',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_chin',
          text: 'Mano apoyada en la barbilla',
          illustrationKey: 'hand_on_chin',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_tapping',
          text: 'Tamborileo de dedos en la mesa',
          illustrationKey: 'finger_tapping',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Puntas de los dedos opuestos en contacto formando una carpa o pirámide.',
      explanation:
          'Las puntas de los dedos se tocan y las palmas quedan separadas. A esta forma a veces se le llama ojiva; no revela lo que piensa la persona.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_pacifying',
      category: CategoryType.lenguajeCorporal,
      prompt: '¿En qué imagen la persona se toca el cuello con una mano?',
      scenarioText:
          'Algunas personas se frotan el cuello o las manos. No sabemos por qué solo por observar el gesto.',
      options: [
        QuizOption(
          id: 'opt_weight_shift',
          text: 'Cambio de peso alternado entre ambos pies',
          illustrationKey: 'weight_shift',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_neck_touch',
          text: 'Mano tocando el hueco del cuello / nuca',
          illustrationKey: 'touching_neck',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_behind_head',
          text: 'Manos entrelazadas en la nuca',
          illustrationKey: 'hands_behind_head',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_behind_back',
          text: 'Manos tomadas a la espalda',
          illustrationKey: 'hands_behind_back',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Una mano toca el cuello.',
      explanation:
          'El gesto permite reconocer dónde está la mano. Puede tener muchas causas; no permite saber si la persona está nerviosa.',
    ),
    QuizQuestion(
      id: 'q_visual_posture_empathy',
      category: CategoryType.lenguajeCorporal,
      prompt: '¿En qué imagen la persona inclina la cabeza hacia un lado?',
      scenarioText: 'Fíjate en la posición de la cabeza.',
      options: [
        QuizOption(
          id: 'opt_headtilt_correct',
          text: 'Cabeza inclinada de lado con cuello expuesto',
          illustrationKey: 'head_tilt',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_mirroring',
          text: 'Dos personas con posturas parecidas',
          illustrationKey: 'postural_mirroring',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_pockets_incorrect',
          text: 'Manos ocultas en los bolsillos',
          illustrationKey: 'hands_in_pockets',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_feet_exit',
          text: 'Pies orientados en dirección a la salida',
          illustrationKey: 'foot_orientation',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'La cabeza está inclinada hacia un lado.',
      explanation:
          'La cabeza está inclinada hacia un lado. Esa postura no demuestra por sí sola atención ni acuerdo. Puedes preguntar si te está entendiendo.',
    ),

    QuizQuestion(
      id: 'q_visual_desden',
      category: CategoryType.expresionesFaciales,
      prompt: '¿En qué imagen se eleva solo un lado de la boca?',
      scenarioText:
          'Cuando se eleva un lado del labio, observa el resto de la situación. Puede ser una expresión habitual; no demuestra duda ni desprecio.',
      options: [
        QuizOption(
          id: 'opt_frown',
          text: 'Ceño fruncido simétrico',
          illustrationKey: 'frowning_brow',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_desden',
          text: 'Un lado de la boca más alto que el otro',
          illustrationKey: 'smirk_contempt',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_narrowed',
          text: 'Ojos entrecerrados',
          illustrationKey: 'narrowed_eyes',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lip_biting',
          text: 'Mordida de labio inferior (contención)',
          illustrationKey: 'lip_biting',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Un lado de la boca está más alto que el otro.',
      explanation:
          'Se eleva un lado del labio. Puede ser una expresión habitual y no demuestra por sí sola lo que siente la persona.',
    ),
    QuizQuestion(
      id: 'q_visual_proxemics',
      category: CategoryType.proxemica,
      prompt:
          'Vas a hablar con alguien en una reunión. ¿Cómo puedes respetar su espacio?',
      scenarioText:
          'Las imágenes muestran distintas distancias. La distancia cómoda depende de cada persona.',
      options: [
        QuizOption(
          id: 'opt_intima',
          text: 'Acercarme todo lo posible sin preguntar.',
          illustrationKey: 'proxemics_intima',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_personal',
          text: 'Usar siempre la misma distancia que con mis amigos.',
          illustrationKey: 'proxemics_personal',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_social',
          text: 'Dejar espacio y preguntar si la distancia le resulta cómoda.',
          illustrationKey: 'proxemics_social',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_publica',
          text: 'Alejarme siempre tanto que resulte difícil escucharnos.',
          illustrationKey: 'proxemics_publica',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Dejar espacio y preguntar permite acordar una distancia cómoda.',
      explanation:
          'No hace falta memorizar medidas. Pregunta antes de acercarte, deja espacio para moverse y respeta lo que la persona pida.',
    ),
    QuizQuestion(
      id: 'q_visual_paralinguistics_sarcasm',
      category: CategoryType.factoresParalinguisticos,
      prompt: '¿Qué gráfico muestra un tono que sube y después cae de golpe?',
      scenarioText:
          'Aquí practicas reconocer un cambio en la voz. Un gráfico por sí solo no demuestra sarcasmo.',
      options: [
        QuizOption(
          id: 'opt_sarcasm_img',
          text: 'La línea sube y cae de golpe',
          illustrationKey: 'sarcastic_inflection',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_monotone_img',
          text: 'La línea se mantiene plana',
          illustrationKey: 'voice_monotone',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_high_vol_img',
          text: 'Megáfono de volumen alto',
          illustrationKey: 'voice_volume_high',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_assertive_img',
          text: 'La línea sube y baja suavemente',
          illustrationKey: 'assertive_voice',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'La línea sube y después cae de forma marcada.',
      explanation:
          'Un cambio de tono puede acompañar distintos mensajes. Para saber si una frase es una broma, escucha las palabras y pregunta si hace falta.',
    ),
    QuizQuestion(
      id: 'q_visual_environment_round_table',
      category: CategoryType.entornoApariencia,
      prompt: '¿Qué imagen muestra una mesa redonda?',
      scenarioText: 'Fíjate en la forma de la mesa.',
      options: [
        QuizOption(
          id: 'opt_round_table',
          text: 'Mesa Redonda colaborativa',
          illustrationKey: 'round_table',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_desk_barrier',
          text: 'Escritorio como barrera de poder',
          illustrationKey: 'desk_barrier',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lighting_env',
          text: 'Iluminación y calidez ambiental',
          illustrationKey: 'lighting_atmosphere',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_formal_suit',
          text: 'Código de vestimenta formal',
          illustrationKey: 'dress_formal',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'La mesa tiene forma de círculo, sin cabecera.',
      explanation:
          'Una mesa redonda no tiene cabecera. Que todos puedan participar también depende de cómo se organiza la conversación.',
    ),
    QuizQuestion(
      id: 'q_visual_environment_seating_angle',
      category: CategoryType.entornoApariencia,
      prompt:
          '¿Qué imagen muestra a dos personas sentadas en lados vecinos de una mesa, formando una L?',
      scenarioText: 'Esta posición puede ayudar a mirar juntos un documento.',
      options: [
        QuizOption(
          id: 'opt_l_angle_img',
          text: 'En L (90 grados) compartiendo mesa',
          illustrationKey: 'seating_angle',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_hands_table',
          text: 'Manos entrelazadas en reposo sobre la mesa',
          illustrationKey: 'hands_clasped_front',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_handshake_stand',
          text: 'Saludo formal de pie con apretón firme',
          illustrationKey: 'handshake_firm',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_casual_dress_img',
          text: 'Vestimenta informal y relajada',
          illustrationKey: 'dress_casual',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Las personas ocupan lados vecinos de la mesa.',
      explanation:
          'Sentarse en forma de L puede facilitar mirar juntos un documento. Pregunta qué posición resulta cómoda.',
    ),
    QuizQuestion(
      id: 'q_visual_facial_jaw_clench',
      category: CategoryType.expresionesFaciales,
      prompt: '¿En qué imagen la persona aprieta la mandíbula?',
      scenarioText: 'Observa la zona de la boca y los lados de la mandíbula.',
      options: [
        QuizOption(
          id: 'opt_jaw_img',
          text: 'Mandíbula tensa y labios apretados',
          illustrationKey: 'jaw_clenching',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_nostril_img',
          text: 'Aleteo nasal de irritación',
          illustrationKey: 'nostril_flaring',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_eyebrow_img',
          text: 'Flash rápido de cejas',
          illustrationKey: 'eyebrow_flash',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_eyelids_img',
          text: 'Párpados cerrados prolongados de rechazo',
          illustrationKey: 'closed_eyelids',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Se nota tensión a los lados de la mandíbula.',
      explanation:
          'Apretar la mandíbula no confirma enfado. Describe lo que ves y pregunta si necesitas saber cómo se siente la persona.',
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
          text: 'Doble tilde azul con reloj de espera',
          illustrationKey: 'digital_visto',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_caps_img',
          text: 'Burbuja de texto con exclamaciones de grito',
          illustrationKey: 'digital_mayusculas',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_emoji_img',
          text: 'Emoticono cálido en el chat',
          illustrationKey: 'digital_emojis',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_audio_img',
          text: 'Nota de voz con barra de reproducción',
          illustrationKey: 'digital_audio',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Doble check de confirmación de lectura acompañado de un reloj de espera prolongado.',
      explanation:
          'La marca de lectura indica que el mensaje se abrió según la aplicación. No permite saber por qué no hay respuesta. Si es urgente, dilo con claridad.',
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
          'Los brazos cruzados y los labios apretados no dicen por sí solos qué piensa la persona. Haz una pausa y pregunta: "¿Qué te parece esta cifra?".',
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
          'Dice «maravillosa», pero su voz suena apagada. Eso puede tener muchas causas; pregunta antes de asumir que habla con sarcasmo.',
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
      scenarioText:
          'En chats informales, el punto final aislado suele generar ambigüedad.',
      options: [
        QuizOption(
          id: 'opt_dry_hate',
          text:
              'Asumir con certeza que está furioso contigo y dejar de hablarle.',
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
          'En el ascensor, alguien dice: "Parece que va a llover fuerte hoy". Si quieres conversar, ¿qué podrías responder?',
      scenarioText:
          'Una charla breve puede empezar con un comentario cotidiano.',
      options: [
        QuizOption(
          id: 'opt_weather_ping',
          text:
              'Puedes decir: "Sí, parece que va a llover". También puedes hacer una pregunta o seguir en silencio.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_weather_stats',
          text:
              'Espera que le des un informe meteorológico detallado de milímetros de agua.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_weather_trap',
          text:
              'Es una pregunta trampa para evaluar tus conocimientos científicos.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'No podemos saber el motivo de un comentario solo por hablar del clima.',
      explanation:
          'Una respuesta breve puede iniciar una charla. No tienes que sonreír ni continuar si no quieres.',
    ),
    QuizQuestion(
      id: 'q_indirect_yo_me_encargo',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Tu compañero dice: "No te preocupes, yo me encargo de terminarlo". ¿Cómo puedes comprobar si quiere ayuda?',
      scenarioText: 'Parece cansada o incómoda, pero no sabes por qué.',
      options: [
        QuizOption(
          id: 'opt_encargo_happy',
          text:
              'Que tiene tiempo de sobra y disfruta haciendo todo el trabajo solo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_encargo_help',
          text:
              'Pregúntale: "¿Quieres que te ayude con una parte o prefieres seguir tú?" y respeta su respuesta.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_encargo_leave',
          text: 'Que debes irte de inmediato de la sala sin decir nada.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Un suspiro o unos hombros caídos no permiten saber qué quiere la persona.',
      explanation:
          'Pregunta directamente y acepta un sí o un no. El gesto no confirma que la persona quiera ayuda.',
    ),
    QuizQuestion(
      id: 'q_cluster_cold_vs_defense',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'En una oficina a 17 °C con aire acondicionado directo, alguien cruza los brazos, se frota los bíceps y encoge el cuello. ¿Cómo se interpreta?',
      scenarioText:
          'Observa varias señales y ten en cuenta el lugar y la situación.',
      options: [
        QuizOption(
          id: 'opt_cold_temp',
          text:
              'Frío ambiental. El frotamiento de brazos y encogimiento buscan conservar el calor corporal.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_cold_hate',
          text:
              'Actitud de cerrazón psicológica y hostilidad hacia las personas de la sala.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_cold_bored',
          text: 'Desinterés absoluto en la reunión.',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Se frota los brazos en una sala fría.',
      explanation:
          'El frío es una posible explicación. Puedes preguntar si quiere ajustar la temperatura; no des por hecho que rechaza la conversación.',
    ),
    QuizQuestion(
      id: 'q_baseline_calm_vs_lying',
      category: CategoryType.expresionesFaciales,
      prompt:
          'Un candidato habla bajito y parpadea con alta frecuencia desde que entró y saludó en la entrevista. Al preguntarle por sus estudios, mantiene exactamente el mismo patrón. ¿Es señal de engaño?',
      scenarioText: 'La persona sigue hablando y parpadeando como al llegar.',
      options: [
        QuizOption(
          id: 'opt_base_liar',
          text: 'Sí, porque el parpadeo rápido siempre indica mentira.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_base_norm',
          text:
              'No se puede saber si miente por mirar o parpadear de cierta manera. Puede ser su forma habitual de expresarse.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_base_guilty',
          text: 'Significa que cometió un fraude en su título universitario.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'No hay una forma de mirar o parpadear que demuestre una mentira.',
      explanation:
          'Mirar o parpadear de cierta manera no demuestra estrés ni mentira. Escucha lo que dice y comprueba los datos sin juzgar cómo se expresa.',
    ),
    QuizQuestion(
      id: 'q_sales_leaning_back_objection',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Tras mencionar el precio de tu servicio, el cliente recuesta el torso hacia atrás en su silla, aprieta los labios y baja la mirada. ¿Qué deberías hacer?',
      scenarioText:
          'Se observaron varios cambios, pero no sabemos por qué ocurrieron.',
      options: [
        QuizOption(
          id: 'opt_lean_push',
          text:
              'Acelerar el discurso y presionar para que firme el contrato de inmediato.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_lean_pause',
          text:
              'Hacer una pausa y preguntar: «¿Qué te parece el precio? ¿Quieres comentar algo?».',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_lean_leave',
          text: 'Levantarte y dar por perdida la venta sin preguntar.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Se inclinó hacia atrás, apretó los labios y bajó la mirada.',
      explanation:
          'Esas señales no confirman una duda sobre el precio. Haz una pausa y pregunta qué piensa.',
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
          text:
              'Están en una reunión secreta y confidencial donde está prohibido acercarse.',
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
          'En una entrevista, una persona mantiene las manos en los bolsillos. ¿Qué puedes concluir?',
      scenarioText: 'Describe lo que observas sin adivinar la intención.',
      options: [
        QuizOption(
          id: 'opt_hands_evol',
          text:
              'Solo puedes decir que tiene las manos en los bolsillos. No sabes por qué ni qué piensa.',
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
          'La postura por sí sola no demuestra honestidad ni deshonestidad.',
      explanation:
          'Las personas colocan las manos en distintas posiciones por muchos motivos. No hace falta corregir esa postura.',
    ),
    QuizQuestion(
      id: 'q_nervous_laughter_mistake',
      category: CategoryType.expresionesFaciales,
      prompt:
          'En una reunión, un compañero se ríe después de que das un dato equivocado. ¿Qué puedes saber con seguridad?',
      scenarioText: 'Una risa puede tener muchos motivos.',
      options: [
        QuizOption(
          id: 'opt_laugh_nervous',
          text:
              'Sabes que se rio, pero no el motivo. Si importa, puedes preguntarle con respeto.',
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
      keyVisualClue: 'La cara y la postura no confirman por qué se rio.',
      explanation:
          'Puedes aclarar el dato y preguntar si hace falta. Evita asumir que se burla o que está incómodo.',
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
          'El tono de voz y lo absurdo de la frase ayudan a notar el sarcasmo; la cara seria por sí sola no lo confirma.',
      explanation:
          'No esperes que la gente sonría con malicia cuando es irónica. En adultos, el tono y la lógica interna de la frase son la clave.',
    ),
    QuizQuestion(
      id: 'q_blank_mind_power_pause',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'En plena entrevista de trabajo te quedas en blanco al explicar un proyecto. ¿Cuál es la mejor respuesta física e inmediata?',
      scenarioText: 'Bloqueo mental momentáneo.',
      options: [
        QuizOption(
          id: 'opt_blank_pause',
          text:
              'Hacer una "Pausa de Poder": inhalar hondo con calma, asentir lentamente 2 segundos y ordenar la idea sin decir muletillas de pánico ("ehhh...").',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_blank_panic',
          text:
              'Gritar que lo sientes mucho y taparte la cara con las dos manos.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_blank_invent',
          text:
              'Inventar palabras rápidamente sin sentido para no dejar ni 1 segundo de silencio.',
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
      scenarioText:
          'La persona podría necesitar una pausa o un momento para sí.',
      options: [
        QuizOption(
          id: 'opt_escape_grace',
          text:
              'Usar una fórmula breve y amable: "Con permiso, voy a tomar un poco de aire fresco afuera / beber agua" o despedirte agradeciendo la velada para ir a descansar.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_escape_rude',
          text:
              'Salir corriendo sin decir nada a nadie y bloquear a todos en el móvil.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_escape_endure',
          text:
              'Aguantar el dolor sensorial hasta tener una crisis pública para complacer a los demás.',
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
      scenarioText: 'Distancia cómoda en un espacio de trabajo.',
      options: [
        QuizOption(
          id: 'opt_table_side',
          text:
              'En un lateral intermedio: permite buena visibilidad de la pantalla y de los participantes sin asumir un rol jerárquico no asignado.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_table_head',
          text:
              'En la cabecera principal para demostrar poder supremo al jefe.',
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
          'Respetar la distancia que cada persona necesita ayuda a que la reunión sea más cómoda.',
    ),
    QuizQuestion(
      id: 'q_audio_voice_drawl_confidence',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Al explicar un precio, hablas tan rápido que la otra persona te pide que repitas. ¿Qué puedes hacer?',
      scenarioText:
          'La persona ha dicho que necesita escuchar la explicación otra vez.',
      options: [
        QuizOption(
          id: 'opt_voice_insecure',
          text:
              'Hablar más despacio, hacer pausas y ofrecer el precio por escrito.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_voice_pro',
          text: 'Repetir todavía más rápido.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_voice_fun',
          text: 'Cambiar de tema sin aclarar el precio.',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Te ha pedido que repitas.',
      explanation:
          'Da la información a un ritmo cómodo y ofrece escribirla. No hace falta forzar una voz más grave.',
    ),
    QuizQuestion(
      id: 'q_feet_towards_door_exit',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Mientras hablas con alguien, uno de sus pies apunta hacia la salida. ¿Qué puedes hacer?',
      questionIllustrationKey: 'foot_orientation',
      scenarioText: 'Su torso aún te mira, pero sus pies apuntan al pasillo.',
      options: [
        QuizOption(
          id: 'opt_feet_leave',
          text:
              'Preguntar si tiene tiempo para continuar o prefiere hablar después.',
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
      keyVisualClue: 'El pie apunta hacia la puerta. No sabes por qué.',
      explanation:
          'La posición del pie no confirma que quiera irse. Pregunta con calma si tiene tiempo para seguir.',
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
              'Su atención mental está fragmentada; su asentimiento es un automatismo social para no interrumpir su uso del teléfono.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_phone_genius',
          text:
              'Tiene capacidad cerebral sobrehumana y procesa todo al 100% sin esfuerzo.',
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
          'Pides un artículo en una tienda. La persona que te atiende asiente mientras escribe. Si necesitas confirmar que te escuchó, ¿qué puedes hacer?',
      scenarioText: 'Interacción en servicios comerciales rápidos.',
      options: [
        QuizOption(
          id: 'opt_nod_ack',
          text:
              'Esperar un momento y preguntar con calma si necesita algún dato más.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_nod_ignore',
          text:
              'Dar por hecho que ya entendió todos los detalles y marcharme sin confirmar.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_nod_sleep',
          text: 'Tiene sueño y se está quedando dormida de pie.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Asentir puede acompañar la escucha. Una pregunta breve permite confirmar el pedido.',
      explanation:
          'Espera unos segundos y pregunta con calma si necesitas confirmar que te escucharon.',
    ),
    QuizQuestion(
      id: 'q_touch_neck_supraspinal',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Durante una conversación, alguien se toca el hueco de la base del cuello. ¿Qué puedes saber con seguridad?',
      scenarioText: 'Señal observable: se toca el cuello.',
      options: [
        QuizOption(
          id: 'opt_neck_pacify',
          text:
              'Solo puedes decir que se tocó el cuello. Puede tener varias causas; si es importante, pregunta si está bien o necesita algo.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_neck_fashion',
          text:
              'Solo está acomodando una joya o corbata imaginaria sin ningún motivo.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_neck_attack',
          text: 'Se prepara para lanzar un golpe físico.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'La persona se ha tocado el cuello. El gesto por sí solo no permite saber por qué.',
      explanation:
          'No sabemos qué significa para esa persona. Puedes preguntar: «¿Quieres hacer una pausa o necesitas algo?»',
    ),
    QuizQuestion(
      id: 'q_open_palms_truth',
      category: CategoryType.lenguajeCorporal,
      prompt: '¿Qué significa mostrar las palmas abiertas?',
      scenarioText:
          'El significado de un gesto cambia según la persona y la situación.',
      options: [
        QuizOption(
          id: 'opt_palms_evol',
          text:
              'No tiene un significado seguro para todo el mundo. Observa la situación y escucha las palabras.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_palms_rain',
          text:
              'Sirve para comprobar si está lloviendo dentro de la habitación.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_palms_beg',
          text: 'Es una señal exclusiva para pedir limosna o dinero.',
          isCorrect: false,
        ),
      ],
      keyVisualClue:
          'Las palmas abiertas muestran la posición de las manos. No prueban sinceridad ni acuerdo.',
      explanation:
          'Habla con claridad y pregunta si la otra persona está de acuerdo.',
    ),
    QuizQuestion(
      id: 'q_cluster_dating_interest',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Alguien se inclina hacia delante, se acomoda el cabello y sonríe. ¿Eso confirma que siente atracción?',
      scenarioText:
          'Has observado varios gestos, pero la persona no ha dicho qué siente.',
      options: [
        QuizOption(
          id: 'opt_date_interest',
          text:
              'No. Esos gestos pueden tener distintos motivos. Hay que escuchar lo que la persona expresa.',
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
          'Se inclina, se acomoda el cabello y sonríe. Eso no confirma atracción.',
      explanation:
          'Varias señales juntas tampoco confirman atracción. No sustituyen una conversación ni el consentimiento.',
    ),
    QuizQuestion(
      id: 'q_interview_foot_kick',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Un candidato en entrevista comienza a sacudir o balancear rápidamente un pie en el aire justo cuando le preguntas por qué renunció a su empleo anterior. ¿Qué indica?',
      scenarioText: 'Movimiento repetido del pie.',
      options: [
        QuizOption(
          id: 'opt_foot_stress',
          text:
              'Mover el pie puede ser una costumbre, una necesidad de movimiento o una reacción a la situación. No permite saber si alguien está ansioso ni por qué.',
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
      keyVisualClue: 'La persona mueve un pie de forma repetida.',
      explanation:
          'Ese movimiento no explica cómo se siente ni por qué dejó su trabajo. Escucha su respuesta sin juzgar el movimiento.',
    ),
    QuizQuestion(
      id: 'q_sales_mirroring_empathy',
      category: CategoryType.lenguajeCorporal,
      prompt:
          'Dos personas adoptan una postura parecida durante una reunión. ¿Qué puedes concluir?',
      scenarioText: 'Ambas apoyan el antebrazo en la mesa.',
      options: [
        QuizOption(
          id: 'opt_mirror_rapport',
          text:
              'Solo puedes observar que sus posturas se parecen. Eso no demuestra acuerdo.',
          isCorrect: true,
        ),
        QuizOption(
          id: 'opt_mirror_mock',
          text: 'El cliente se está burlando de ti como un mimo profesional.',
          isCorrect: false,
        ),
        QuizOption(
          id: 'opt_mirror_sleep',
          text:
              'Ambos tienen una contractura muscular idéntica por mala suerte.',
          isCorrect: false,
        ),
      ],
      keyVisualClue: 'Las posturas se parecen.',
      explanation:
          'Una postura parecida puede tener muchas causas. Para saber si hay acuerdo, pregunta directamente.',
    ),
    QuizQuestion(
      id: 'q_audio_monotone_burnout',
      category: CategoryType.factoresParalinguisticos,
      prompt:
          'Un compañero habla con voz plana y tiene los hombros caídos. ¿Qué puedes saber?',
      scenarioText: 'Describe lo que observas sin decidir qué siente.',
      options: [
        QuizOption(
          id: 'opt_burnout_fatigue',
          text:
              'La voz y la postura no bastan para saber cómo se siente. Puedo preguntarle si necesita algo.',
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
          'Una voz más plana o lenta puede tener muchas causas y no demuestra agotamiento. Pregunta cómo se siente la persona.',
      explanation:
          'Si te preocupa, puedes preguntar cómo está o si necesita algo. Respeta su respuesta.',
    ),
    QuizQuestion(
      id: 'q_digital_caps_urgency',
      category: CategoryType.comunicacionDigital,
      prompt:
          'Un cliente envía por WhatsApp: "HOLA, ¿TIENEN RESPUESTA DE MI PEDIDO?!". ¿Cómo debes ajustar tu respuesta?',
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
          'Responder con calma y en orden puede ayudar a aclarar la urgencia. No podemos saber por qué la persona escribió así; pregunta qué necesita y para cuándo.',
    ),
    ...QuizExpansion.questions,
  ];

  static List<QuizQuestion> getByCategory(CategoryType category) {
    return questions.where((q) => q.category == category).toList();
  }

  static List<QuizQuestion> getImageCardQuestions() {
    return questions.where((q) => q.isImageOptionGrid).toList();
  }
}
