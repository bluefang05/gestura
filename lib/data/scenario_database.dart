import '../models/scenario.dart';

class ScenarioDatabase {
  static const List<Scenario> scenarios = [
    // --- ESCENARIO 1: VENTAS Y NEGOCIACIÓN ---
    Scenario(
      id: 'scenario_sales_closing',
      title: 'El Cierre de Ventas: Decodificando al Prospecto',
      domain: 'Ventas & Negociación',
      description:
          'Aprende a leer el lenguaje corporal del cliente para saber cuándo callar, cuándo aclarar dudas y cuándo cerrar el trato.',
      contextOverview:
          'Estás en la oficina del Director de Operaciones presentando una propuesta tecnológica clave.',
      iconName: 'briefcase',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Acabas de explicar las características de tu producto durante 10 minutos. Observas que el cliente cruza los brazos, aprieta los labios y mira hacia abajo.',
          characterAction:
              'Brazos fuertemente cruzados y labios en línea delgada.',
          illustrationKey: 'closed_posture',
          visibleSignals: [
            'Brazos cruzados (Barrera)',
            'Labios comprimidos (Contención de objeción)',
            'Mirada baja'
          ],
          learningTakeaway:
              'Los brazos cruzados + labios apretados indican que el cliente tiene una duda u objeción no resuelta.',
          choices: [
            ScenarioChoice(
              text:
                  'Seguir hablando más rápido para terminar toda la presentación antes de que pregunte.',
              analysis:
                  'Pésima opción: Si sigues hablando cuando el cliente ya se cerró mentalmente, sentirá que lo estás arrollando y aumentará su rechazo.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente se desconecta y empieza a mirar su reloj.',
            ),
            ScenarioChoice(
              text:
                  'Hacer una pausa intencional y preguntar: "Noto que estás analizando este punto, ¿hay algún detalle que te genere dudas?"',
              analysis:
                  'Excelente decisión: Validas su proceso mental sin confrontarlo y le das permiso seguro para expresar su objeción.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente descruza los brazos y dice: "El costo de implementación me parece alto".',
            ),
            ScenarioChoice(
              text:
                  'Decirle directamente: "¿Por qué cruzas los brazos? ¿No te gusta mi producto?"',
              analysis:
                  'Demasiado invasivo y confrontativo. Pone a la otra persona a la defensiva.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente se incomoda y adopta una postura aún más fría.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'El cliente te explica su objeción sobre el costo. Tú respondes mostrándole cómo el ahorro en 3 meses cubre la inversión inicial. El cliente se inclina hacia adelante sobre la mesa, asiente lentamente y muestra una sonrisa Duchenne con ojos achinados.',
          characterAction:
              'Inclinación hacia adelante + sonrisa genuina con arrugas en los ojos.',
          illustrationKey: 'leaning_forward',
          visibleSignals: [
            'Inclinación frontal (Alto interés)',
            'Sonrisa de Duchenne (Aprobación real)',
            'Contacto visual directo'
          ],
          learningTakeaway:
              'Inclinarse hacia adelante y sonreír puede acompañar atención o comodidad; confirma el interés con una pregunta en vez de asumir intención de compra.',
          choices: [
            ScenarioChoice(
              text:
                  'Pedir el cierre: "¿Te parece si empezamos la implementación el próximo lunes para asegurar el cronograma?"',
              analysis:
                  'Perfecto: Identificaste la señal de compra y avanzaste al llamado a la acción en el momento de mayor convicción.',
              isBestAction: true,
              nextStepIndex: null, // Fin con éxito
              consequenceSummary:
                  '¡Trato cerrado con éxito! El cliente firma entusiasmado.',
            ),
            ScenarioChoice(
              text:
                  'Seguir explicando 20 diapositivas más sobre la historia de la empresa.',
              analysis:
                  'Error común: Hablar de más después de que el cliente ya tomó la decisión puede reabrir dudas innecesarias.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El cliente pierde el entusiasmo inicial por sobreexplicación.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 2: ÁMBITO LABORAL ---
    Scenario(
      id: 'scenario_job_interview',
      title: 'La Entrevista Laboral: Conexión con el Reclutador',
      domain: 'Ámbito Laboral',
      description:
          'Descubre cómo calibrar el nivel de formalidad, proximidad y ritmo en una entrevista de trabajo.',
      contextOverview:
          'Estás en una sala de juntas pequeña con la Jefa del Departamento para una posición senior.',
      iconName: 'people',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Entras a la sala. La entrevistadora se pone de pie, mantiene el contacto visual firme, sonríe con calidez y extiende su mano a una distancia de 1.5 metros.',
          characterAction:
              'Contacto visual sostenido, postura abierta y saludo formal respetando el espacio social.',
          illustrationKey: 'open_posture',
          visibleSignals: [
            'Espacio Social respetado (1.5m)',
            'Contacto visual seguro',
            'Sonrisa de bienvenida'
          ],
          learningTakeaway:
              'El saludo en el espacio social marca el tono de profesionalismo y respeto recíproco.',
          choices: [
            ScenarioChoice(
              text:
                  'Dar un apretón de manos firme, mirándola a los ojos con una sonrisa y tomar asiento cuando ella lo indique.',
              analysis:
                  'Impecable: Transmite seguridad, respeto por los límites y excelentes habilidades sociales.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'La entrevistadora asiente complacida y abre tu currículum.',
            ),
            ScenarioChoice(
              text:
                  'Acercarte a darle dos besos en la mejilla como si fuera una amiga de fiesta.',
              analysis:
                  'Violación grave de la proxémica profesional. Invadir el espacio íntimo en una primera entrevista genera incomodidad inmediata.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'La entrevistadora retrocede un paso desconcertada.',
            ),
            ScenarioChoice(
              text:
                  'Mirar fijamente al suelo sin responder el saludo y sentarte de inmediato en silencio.',
              analysis:
                  'Puede interpretarse erróneamente como desinterés o falta severa de habilidades interpersonales.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary: 'El ambiente se torna tenso.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'A mitad de tu respuesta sobre un proyecto anterior, la entrevistadora empieza a cerrar los ojos por períodos de 2 segundos y tamborilea levemente los dedos en la mesa.',
          characterAction:
              'Párpados cerrados prolongados + tamborileo de dedos.',
          illustrationKey: 'finger_tapping',
          visibleSignals: [
            'Párpados cerrados (Sobrecarga de información)',
            'Tamborileo (Impaciencia con el tiempo)'
          ],
          learningTakeaway:
              'El tamborileo y los ojos cerrados pueden coincidir con cansancio, ritmo personal, concentración o necesidad de una pausa. Comprueba si un resumen ayudaría.',
          choices: [
            ScenarioChoice(
              text:
                  'Concluir con el resultado clave en 1 frase: "En resumen, logramos reducir los costos un 30% en 4 meses. ¿Te gustaría profundizar en algún aspecto?"',
              analysis:
                  'Brillante: Detectaste la señal de saturación y adaptaste tu comunicación al instante, demostrando síntesis y empatía.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La entrevistadora sonríe aliviada: "Excelente resultado, pasemos a la siguiente pregunta".',
            ),
            ScenarioChoice(
              text:
                  'Hablar durante 10 minutos más detallando cada una de las líneas de código.',
              analysis: 'Ignora por completo las señales de impaciencia.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'La entrevistadora te interrumpe bruscamente para cortar la entrevista.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 3: SOCIAL & AMISTADES ---
    Scenario(
      id: 'scenario_friend_coffee',
      title: 'En el Café con un Amigo: Cuando algo anda mal',
      domain: 'Social & Amigos',
      description:
          'Aprende a distinguir cuando un "Todo bien" en realidad oculta tristeza o preocupación.',
      contextOverview:
          'Quedaste en una cafetería con un buen amigo que suele ser muy bromista.',
      iconName: 'heart',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Le preguntas "¿Cómo te ha ido?". Tu amigo responde "Todo bien, normal..." con la voz apagada en volumen muy bajo, hombros caídos y mirando hacia su taza de café.',
          characterAction:
              'Voz monótona baja + hombros caídos + mirada esquiva.',
          illustrationKey: 'turned_down_lips',
          visibleSignals: [
            'Volumen bajo (Retracción)',
            'Hombros caídos (Desánimo)',
            'Incongruencia entre "Todo bien" y su cuerpo'
          ],
          learningTakeaway:
              'En el contexto relacional cercano, las señales de retraimiento pesan más que las palabras de cortesía.',
          choices: [
            ScenarioChoice(
              text:
                  'Decir: "Te conozco y noto tu voz algo apagada. Si quieres desahogarte o hablar de algo, aquí estoy."',
              analysis:
                  'La respuesta ideal: Ofreces un espacio seguro y empático sin forzarlo agresivamente.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu amigo suspira aliviado y te cuenta el problema que lo tenía angustiado.',
            ),
            ScenarioChoice(
              text:
                  'Decir: "Ah, perfecto, qué bueno que estés bien", y hablar durante una hora de tus propias cosas.',
              analysis:
                  'Toma el mensaje puramente literal e ignora la petición de ayuda no verbal.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary: 'Tu amigo se siente invisible y distante.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 4: NEGOCIACIÓN SALARIAL / PRESUPUESTO ---
    Scenario(
      id: 'scenario_salary_negotiation',
      title: 'Negociación Salarial: Pidiendo un Aumento',
      domain: 'Negociación Profesional',
      description:
          'Aprende a calibrar la reacción de tu supervisor ante una solicitud de aumento o presupuesto.',
      contextOverview:
          'Estás en la reunión anual de evaluación de desempeño con tu Gerente de Área.',
      iconName: 'briefcase',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Acabas de presentar los resultados del año y propones un ajuste salarial del 20%. Tu gerente aprieta la mandíbula, sostiene la mirada durante 3 segundos en silencio y apoya ambas manos planas sobre la mesa.',
          characterAction:
              'Tensión en maseteros (mandíbula apretada) + manos planas firmes en la mesa.',
          illustrationKey: 'jaw_clenching',
          visibleSignals: [
            'Mandíbula apretada (Tensión/Resistencia)',
            'Manos planas (Fijación de postura de poder)',
            'Silencio tenso'
          ],
          learningTakeaway:
              'La mandíbula tensa y el silencio pueden aparecer mientras alguien procesa una cifra o regula su respuesta. Deja espacio y pregunta si desea revisar algún aspecto.',
          choices: [
            ScenarioChoice(
              text:
                  'Mantener la calma, sostener el contacto visual con postura abierta y esperar a que él hable primero.',
              analysis:
                  'Estrategia maestra: Quien habla primero tras la propuesta suele ceder terreno. El silencio permite que procese los argumentos presentados.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'El gerente relaja la mandíbula y dice: "El 20% es alto para el presupuesto actual, pero revisemos qué porcentaje podemos estructurar con bonos".',
            ),
            ScenarioChoice(
              text:
                  'Ponerte nervioso y decir de inmediato: "Bueno, si 20% es mucho, puede ser 5% o lo que tú puedas..."',
              analysis:
                  'Error grave: Negociar contra ti mismo antes de que la contraparte presente una objeción debilita tu posición.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El gerente toma la oferta mínima y el aumento queda muy por debajo de tu valor.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'El gerente revisa la hoja de presupuesto. Se frota la barbilla lentamente mientras asiente con la cabeza y te mira con un leve arqueo de ceja curioso.',
          characterAction:
              'Mano en barbilla + asentimiento lento + ceja elevada.',
          illustrationKey: 'hand_on_chin',
          visibleSignals: [
            'Mano en barbilla (Evaluación activa de opciones)',
            'Asentimiento (Disposición al acuerdo)'
          ],
          learningTakeaway:
              'Una mano en la barbilla y un asentimiento pueden coincidir con reflexión, escucha o un hábito. Pide confirmación clara antes de interpretar una decisión.',
          choices: [
            ScenarioChoice(
              text:
                  'Proponer la solución estructurada: "Podemos fijar un 12% fijo ahora y el 8% restante sujeto al cumplimiento de las metas del Q2".',
              analysis:
                  'Brillante: Le facilitas el trabajo al ofrecerle un esquema que él puede defender ante la Dirección General.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  '¡Acuerdo exitoso! El gerente firma la solicitud encantado con la propuesta estructurada.',
            ),
            ScenarioChoice(
              text:
                  'Interrumpirlo y exigir una respuesta en ese mismo segundo.',
              analysis:
                  'Rompe el proceso de pensamiento y genera rechazo innecesario.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El gerente se cierra en banda y pospone la decisión indefinidamente.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 5: MANEJO DEL CLIENTE ESCÉPTICO ---
    Scenario(
      id: 'scenario_skeptical_client',
      title: 'El Cliente Escéptico: "Ya tenemos proveedor"',
      domain: 'Ventas B2B',
      description:
          'Descubre cómo detectar insatisfacción oculta y abrir oportunidades con prospectos difíciles.',
      contextOverview:
          'Estás en una primera llamada exploratoria con el Gerente de Logística de una empresa grande.',
      iconName: 'business',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Le preguntas sobre sus procesos logísticos. Él responde en tono tajante "Todo nos funciona perfecto con nuestro proveedor actual", pero mientras lo dice se toca la nuca con la mano y desvía la mirada hacia el suelo.',
          characterAction:
              'Gesto apaciguador en el cuello + mirada esquiva baja.',
          illustrationKey: 'touching_neck',
          visibleSignals: [
            'Mano en nuca (Estrés/Punto de dolor no resuelto)',
            'Mirada baja (Inseguridad en su afirmación)',
            'Incongruencia evidente'
          ],
          learningTakeaway:
              'Frotarse el cuello al decir "todo está perfecto" es una señal biológica clara de estrés o insatisfacción que intenta ocultar.',
          choices: [
            ScenarioChoice(
              text:
                  'Preguntar de forma no invasiva: "Me alegra que tengan estabilidad. Si pudieras mejorar un solo detalle en los tiempos de respuesta o soporte de tu proveedor, ¿qué te gustaría que fuera más ágil?"',
              analysis:
                  'La mejor táctica de prospección: No confrontas su afirmación, pero abres una puerta segura para que exprese su dolor operativo real.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'El cliente suspira y dice: "Bueno, la verdad es que los fines de semana tardan demasiado en responder incidencias...". ¡Oportunidad abierta!',
            ),
            ScenarioChoice(
              text:
                  'Decir: "Eso es mentira, sé que ese proveedor falla mucho y el mío es 10 veces mejor."',
              analysis:
                  'Atacar al proveedor que él mismo eligió se percibe como un ataque a su criterio personal.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary: 'El cliente cuelga la llamada de inmediato.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 6: REGULACIÓN SENSORIAL ---
    Scenario(
      id: 'scenario_supermarket_sensory_overload',
      title: 'El Supermercado y la Sobrecarga Sensorial',
      domain: 'Familia y bienestar',
      description:
          'Practica una respuesta respetuosa ante señales de sobrecarga sensorial: reducir estímulos, ofrecer opciones y respetar el ritmo de la persona.',
      contextOverview:
          'Acompañas a un niño de 8 años a comprar. El supermercado está lleno de luces, ruido y movimiento.',
      iconName: 'store_mall_directory',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'A unos pasos del carrito, el niño se cubre los oídos, baja la cabeza y se balancea suavemente. Respira más rápido de lo habitual mientras el pasillo sigue lleno de sonidos y gente.',
          characterAction:
              'Manos protegiendo los oídos, postura recogida y balanceo de regulación.',
          illustrationKey: 'sensory_overload_supermarket',
          visibleSignals: [
            'Manos cubriendo los oídos',
            'Balanceo o movimiento repetitivo',
            'Mirada baja y respiración acelerada',
          ],
          learningTakeaway:
              'Estas señales pueden indicar que el entorno se volvió demasiado intenso. No son una prueba de mala conducta ni requieren corrección inmediata.',
          choices: [
            ScenarioChoice(
              text:
                  'Hablar más alto y exigir que siga caminando porque la compra todavía no termina.',
              analysis:
                  'Añade presión y estímulos a una situación ya difícil. La prioridad es la regulación y la seguridad, no terminar la tarea.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El malestar puede aumentar porque la persona tiene menos espacio para regularse.',
            ),
            ScenarioChoice(
              text:
                  'Acercarte con calma, bajar la voz y ofrecer opciones: “Veo que hay mucho ruido. ¿Quieres salir un momento, usar audífonos o esperar en un lugar más tranquilo?”',
              analysis:
                  'Validas la experiencia sin asumir ni imponer. Ofrecer opciones devuelve control y permite encontrar una forma de regularse.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'El niño puede elegir una pausa y recuperar la calma antes de decidir si desea continuar.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'El niño señala la salida y asiente. Ya en una zona tranquila, su respiración baja poco a poco. No quiere explicar lo que siente todavía.',
          characterAction:
              'Señala una alternativa y recupera gradualmente la calma en un espacio con menos estímulos.',
          illustrationKey: 'sensory_overload_supermarket',
          visibleSignals: [
            'Señalamiento de una necesidad',
            'Respiración más pausada',
            'Necesidad de tiempo sin preguntas'
          ],
          learningTakeaway:
              'No hace falta una explicación verbal inmediata para respetar una necesidad. La pausa, la previsibilidad y la agencia son apoyos útiles.',
          choices: [
            ScenarioChoice(
              text:
                  'Preguntar insistentemente qué pasó y pedir una disculpa antes de volver a entrar.',
              analysis:
                  'Exigir una explicación puede prolongar la sobrecarga. La regulación no es una negociación ni una falta que reparar.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'La presión puede impedir que la persona termine de recuperarse.',
            ),
            ScenarioChoice(
              text:
                  'Decir: “Gracias por avisarme. Podemos irnos, esperar aquí o volver otro día; tú eliges”.',
              analysis:
                  'Reconoces la comunicación, agradeces la señal y mantienes opciones reales. Es una respuesta que construye confianza.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La salida se convierte en una experiencia de apoyo y no en una situación de vergüenza.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 7: AMBIGÜEDAD DIGITAL ---
    Scenario(
      id: 'scenario_text_message_ambiguous',
      title: 'El Mensaje “ok”: Cuando el Texto es Ambiguo',
      domain: 'Comunicación digital',
      description:
          'Aprende a no convertir una respuesta breve o tardía en una conclusión sobre la relación.',
      contextOverview:
          'Le enviaste a una amistad una noticia importante. Cinco horas después recibes un escueto “ok”.',
      iconName: 'chat_bubble_outline',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Has esperado varias horas por una respuesta. Finalmente aparece “ok”. No hay emoji, explicación ni más mensajes.',
          characterAction:
              'Una respuesta breve y tardía en un intercambio escrito.',
          illustrationKey: 'ambiguous_ok_message',
          visibleSignals: [
            'Respuesta de una sola palabra',
            'Demora de varias horas',
            'Ausencia de tono y contexto no verbal'
          ],
          learningTakeaway:
              'En texto, una señal aislada rara vez tiene un significado único. La demora puede deberse a trabajo, energía disponible, procesamiento o circunstancias que no conoces.',
          choices: [
            ScenarioChoice(
              text: 'Responder: “¿Y eso es todo? Claramente no te importa”.',
              analysis:
                  'Transforma una interpretación posible en una acusación. Puede crear tensión sin comprobar qué ocurrió.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'La conversación se vuelve defensiva y se pierde la oportunidad de aclarar el contexto.',
            ),
            ScenarioChoice(
              text:
                  'Responder: “Quería saber cómo te cayó la noticia. No hace falta contestar ahora si estás ocupado/a; cuando puedas me cuentas”.',
              analysis:
                  'Expresas tu necesidad con claridad y dejas espacio para el ritmo de la otra persona. Es directo sin atribuir intenciones.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'La otra persona recibe una invitación segura para aclarar su respuesta.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Tu amistad responde más tarde: “Perdón, estaba procesando y atendiendo algo familiar. Me alegra mucho por ti; quería responderte con calma”.',
          characterAction:
              'Aclara el contexto y expresa apoyo en su propio ritmo.',
          illustrationKey: 'emoji_support',
          visibleSignals: [
            'Explicación contextual',
            'Respuesta asincrónica',
            'Validación emocional explícita'
          ],
          learningTakeaway:
              'Preguntar con apertura deja lugar para estilos de comunicación distintos. Una respuesta breve no es una lectura fiable de afecto o interés por sí sola.',
          choices: [
            ScenarioChoice(
              text:
                  'Responder: “Está bien, gracias por explicarlo. Me alegra saberlo”.',
              analysis:
                  'Cierras la ambigüedad sin castigar el ritmo de comunicación de la otra persona.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La relación gana claridad y ambos saben cómo cuidar mejor la conversación.',
            ),
            ScenarioChoice(
              text:
                  'Responder que, en adelante, debe contestar siempre de inmediato.',
              analysis:
                  'Una regla rígida no reconoce las diferentes capacidades, horarios y necesidades de procesamiento.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'La comunicación puede sentirse vigilada o exigente.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 8: VIDA COTIDIANA Y COMPRAS ---
    Scenario(
      id: 'scenario_shopping_backchannel',
      title: 'En el Mostrador de la Tienda: El Micro-asentimiento',
      domain: 'Vida Diaria',
      description:
          'Aprende a reconocer cuándo un cajero o dependiente te está escuchando con micro-gestos aunque no hable.',
      contextOverview:
          'Llegas a la caja de una farmacia o comercio a pedir dos productos específicos.',
      iconName: 'shopping_bag',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Le pides al dependiente: "Buenos días, busco ibuprofeno de 400 y gasas". El dependiente no contesta con palabras, pero mientras mira la pantalla hace dos pequeños movimientos de cabeza hacia abajo (micro-asentimientos) y empieza a teclear.',
          characterAction:
              'Micro-asentimiento repetido de cabeza hacia abajo mientras la mirada está en el sistema.',
          illustrationKey: 'head_tilt',
          visibleSignals: [
            'Micro-asentimiento rítmico (Confirmación de escucha)',
            'Atención dividida hacia la pantalla de cobro',
            'Silencio funcional de trabajo'
          ],
          learningTakeaway:
              'En interacciones de servicio rápido, los neurotípicos suelen asentir levemente para confirmar "te escuché y lo estoy registrando" sin necesidad de interrumpir su tarea con una frase hablada.',
          choices: [
            ScenarioChoice(
              text:
                  'Esperar tranquilamente unos segundos sin repetir la orden, entendiendo que el asentimiento confirmó la recepción.',
              analysis:
                  'Respuesta ideal: Decodificaste correctamente la confirmación corporal y mantienes la interacción fluida y relajada.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'El dependiente se gira de inmediato, te entrega los productos y te dice el precio.',
            ),
            ScenarioChoice(
              text:
                  'Pensar que te ignoró porque no dijo nada en voz alta y repetir la frase en tono más fuerte y molesto.',
              analysis:
                  'Error común de literalidad: Confundir el silencio con falta de atención. Interrumpir mientras teclea genera tensión innecesaria.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El dependiente se desconcierta y dice: "Sí, señor, ya lo estaba buscando".',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 9: DÓNDE SENTARSE EN LA REUNIÓN ---
    Scenario(
      id: 'scenario_meeting_seating',
      title: 'La Sala de Juntas: Dónde Sentarse y Posición Social',
      domain: 'Ámbito Laboral',
      description:
          'Descubre las reglas no escritas de la proxémica de oficina: jerarquía, visibilidad y comodidad en la mesa.',
      contextOverview:
          'Llegas a una reunión de proyecto con el Director del área y 6 colegas en una mesa rectangular grande.',
      iconName: 'table_restaurant',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Entras a la sala 3 minutos antes. La mesa es rectangular. La cabecera está vacía. El facilitador de la reunión suele sentarse en un extremo. Tu rol en esta reunión es participar como técnico colaborador, no como líder.',
          characterAction:
              'Mesa rectangular con cabecera libre y sillas en los laterales intermedios.',
          illustrationKey: 'round_table',
          visibleSignals: [
            'Cabecera libre (Espacio de moderación/liderazgo)',
            'Laterales intermedios (Espacio de participación equilibrada)',
            'Extremos opuestos (Distancia comunicativa)'
          ],
          learningTakeaway:
              'En mesas rectangulares de trabajo, la cabecera comunica conducción de la reunión. Los puestos laterales intermedios ofrecen excelente contacto visual con todos sin asumir un rol jerárquico no asignado.',
          choices: [
            ScenarioChoice(
              text:
                  'Sentarte en la cabecera principal de la mesa.',
              analysis:
                  'Error de posición social: Ocupar la cabecera cuando no diriges la reunión puede percibirse como prepotencia o desconocimiento de la dinámica del equipo.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Cuando llega el líder de la reunión, se produce un silencio incómodo para pedirte que te muevas.',
            ),
            ScenarioChoice(
              text:
                  'Elegir un asiento en el lateral intermedio, con buena visibilidad de la pantalla y de los demás.',
              analysis:
                  'La elección perfecta: Facilita escuchar, ver la presentación y participar de forma natural sin sobreexponerte ni aislarte.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Te ubicas cómodamente y la reunión inicia con naturalidad.',
            ),
            ScenarioChoice(
              text:
                  'Sentarte en una silla pegada a la pared al fondo, fuera de la mesa.',
              analysis:
                  'Autoexclusión: Sentarse fuera de la mesa cuando hay sillas disponibles transmite inseguridad o que no deseas formar parte del equipo.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Un compañero te tiene que decir: "Ven a la mesa, hay lugar".',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Durante la reunión, notas que el moderador mira con frecuencia hacia el centro de la mesa al hacer preguntas abiertas.',
          characterAction:
              'Mirada triangular barriendo los asientos intermedios.',
          illustrationKey: 'proxemics_social',
          visibleSignals: [
            'Contacto visual incluyente hacia los laterales',
            'Invitación no verbal a intervenir'
          ],
          learningTakeaway:
              'Estar en el lateral intermedio te coloca en el campo de visión natural del moderador para aportar cuando sea oportuno.',
          choices: [
            ScenarioChoice(
              text:
                  'Hacer un leve contacto visual y levantar ligeramente el bolígrafo o la mano cuando quieras aportar.',
              analysis:
                  'Excelente señalización de turno conversacional: Te permite pedir la palabra con elegancia y sin interrumpir bruscamente.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'El moderador te cede la palabra: "Adelante, cuéntanos tu perspectiva". ¡Participación impecable!',
            ),
            ScenarioChoice(
              text:
                  'Comenzar a hablar de golpe encima de la voz del compañero que estaba exponiendo.',
              analysis:
                  'Rompe los turnos conversacionales y genera frustración.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El moderador te pide esperar: "Un segundo, dejemos que termine primero".',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 10: ESTRATEGIA DE SALIDA ---
    Scenario(
      id: 'scenario_exit_strategy',
      title: 'Cómo Terminar una Conversación sin Ser Brusco',
      domain: 'Vida Diaria',
      description:
          'Aprende a reconocer cuándo la otra persona necesita marcharse y cómo cerrar la charla con elegancia y cordialidad.',
      contextOverview:
          'Estás conversando con un conocido en el pasillo del trabajo sobre tus pasatiempos favoritos.',
      iconName: 'exit_to_app',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Llevan 5 minutos hablando. Mientras explicas con detalle un proyecto personal, notas que tu interlocutor orienta uno de sus pies hacia la salida, da un par de asentimientos rápidos con la cabeza y echa una mirada veloz a su reloj de pulsera.',
          characterAction:
              'Pies orientados hacia la salida, asentimiento acelerado y vistazo discreto al reloj.',
          illustrationKey: 'foot_orientation',
          visibleSignals: [
            'Orientación podal de fuga (el cuerpo se prepara para caminar)',
            'Asentimiento acelerado (deseo de avanzar el ritmo)',
            'Vistazo fugaz al reloj o smartphone (conciencia del tiempo)'
          ],
          learningTakeaway:
              'Cuando los pies de una persona apuntan hacia la puerta aunque su torso aún te mire, su mente ya se está marchando. No significa que le caigas mal: simplemente tiene una tarea pendiente. Cerrar tú la conversación primero transmite alta madurez social.',
          choices: [
            ScenarioChoice(
              text:
                  'Agradecer el momento y cerrar con calidez: "Bueno, no te quito más tiempo para que sigas con tus pendientes. ¡Me encantó platicar, que tengas buen día!"',
              analysis:
                  'Respuesta ideal: Decodificaste la señal a tiempo, evitaste que la otra persona se sienta atrapada y dejaste la interacción con una sensación positiva y respetuosa.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La persona sonríe aliviada, te agradece la charla con entusiasmo genuino y se marcha sin fricción. ¡Vínculo reforzado!',
            ),
            ScenarioChoice(
              text:
                  'Ignorar los pies y el reloj y continuar explicando los siguientes 10 minutos de tu anécdota.',
              analysis:
                  'Error de lectura de salida: Forzar la conversación cuando hay señales claras de partida genera incomodidad y hace que la persona intente evitarte en futuros encuentros.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu compañero empieza a tamborilear los dedos, se muestra tenso y finalmente te tiene que cortar de golpe: "Disculpa, tengo una llamada urgente, me tengo que ir ya".',
            ),
            ScenarioChoice(
              text:
                  'Detenerte de golpe en seco, ofenderte y marcharte sin despedirte.',
              analysis:
                  'Reacción desproporcionada: Interpretar la prisa ajena como rechazo personal deteriora el ambiente de confianza.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Queda un silencio extraño y la otra persona no comprende por qué cambió tu humor tan abruptamente.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 11: INTERRUMPIR A UN COMPAÑERO OCUPADO ---
    Scenario(
      id: 'scenario_interrupt_busy_colleague',
      title: 'Pedir Ayuda a un Compañero Ocupado en la Oficina',
      domain: 'Ámbito Laboral',
      description:
          'Domina la proxémica y los tiempos para consultar dudas sin generar sobresaltos ni molestar a colegas en foco profundo.',
      contextOverview:
          'Necesitas con urgencia una clave de acceso que solo tiene tu compañero de mesa para terminar una entrega hoy.',
      iconName: 'headset',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Te acercas a la mesa de tu compañero. Tiene auriculares grandes puestos, su cuerpo está inclinado hacia el monitor y sus manos teclean rápidamente sin parar.',
          characterAction:
              'Auriculares colocados, torso encorvado hacia la pantalla y tecleo rítmico continuo.',
          illustrationKey: 'desk_barrier',
          visibleSignals: [
            'Auriculares (barrera acústica voluntaria contra interrupciones)',
            'Inclinación focalizada (modo concentración o foco profundo)',
            'Ritmo de tecleo ininterrumpido (flujo mental activo)'
          ],
          learningTakeaway:
              'Los auriculares en una oficina moderna son un semáforo rojo no verbal. Una interrupción física brusca (tocar el hombro o hablar fuerte por detrás) activa un sobresalto defensivo que bloquea la colaboración.',
          choices: [
            ScenarioChoice(
              text:
                  'Colocarte en su campo de visión lateral a distancia prudencial (1.5 m) y hacer un leve gesto con la mano, o enviarle un chat: "¿Tienes 1 min para una clave urgente o te consulto en un rato?"',
              analysis:
                  'Excelente calibración: Respetas su espacio auditivo y le permites a su cerebro guardar su progreso mental antes de responder.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu compañero termina de teclear su línea, levanta la vista con calma, se retira un auricular y sonríe con disposición.',
            ),
            ScenarioChoice(
              text:
                  'Llegar por detrás silenciosamente y tocarle el hombro con firmeza para llamar su atención.',
              analysis:
                  'Invasión física por sorpresa: Tocar a alguien concentrado activa un reflejo de sobresalto y descarga de adrenalina.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu compañero salta del asiento asustado, se le cae el bolígrafo y te mira visiblemente molesto.',
            ),
            ScenarioChoice(
              text:
                  'Pararte inmóvil a 40 cm de él esperando en silencio a que se dé cuenta por sí mismo.',
              analysis:
                  'Proxémica invasiva: La presencia inmóvil tan cerca en la visión periférica genera sensación de vigilancia y acoso.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Al voltear y verte tan pegado se incomoda: "¿Cuánto tiempo llevas ahí parado mirando mi pantalla?".',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Tu compañero se retira un auricular, gira la silla hacia ti y te dice: "Dime, ¿qué pasó?". Notas que mantiene la mano sobre el teclado como queriendo retomar pronto su trabajo.',
          characterAction:
              'Auricular retirado, mano descansando en el teclado, mirada directa y atenta.',
          illustrationKey: 'open_posture',
          visibleSignals: [
            'Canal auditivo abierto (disponibilidad concedida)',
            'Mano en reposo sobre el teclado (ventana de tiempo breve)'
          ],
          learningTakeaway:
              'Cuando alguien hace una pausa en su trabajo para atenderte, ve directo al grano en menos de 20 segundos sin rodeos innecesarios.',
          choices: [
            ScenarioChoice(
              text:
                  'Ir al punto con precisión quirúrgica: "Solo necesito la contraseña del servidor de desarrollo para subir la entrega de hoy, ¿me la pasas por Slack?".',
              analysis:
                  'Precisión ejecutiva: Resuelves la necesidad en 10 segundos, no desgastas su energía mental y facilitas que vuelva a su ritmo.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu compañero te la envía al instante por chat y dice: "¡Listo, cualquier cosa me avisas!". Misión cumplida con alta eficiencia.',
            ),
            ScenarioChoice(
              text:
                  'Aprovechar que te miró para quejarte del jefe, del clima y contarle lo difícil que fue tu fin de semana antes de pedir la clave.',
              analysis:
                  'Falta de empatía con el tiempo ajeno: Dilatar una pausa laboral con charla trivial cuando el otro está en entregas genera resentimiento.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu compañero suspira pesadamente, mira la pantalla con ansiedad y te corta: "¿Pero qué era lo urgente?".',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 12: INTEGRARSE A UN GRUPO SOCIAL ---
    Scenario(
      id: 'scenario_group_conversation_entry',
      title: 'Cómo Unirse a un Grupo que ya está Hablando (Círculo Abierto)',
      domain: 'Vida Diaria',
      description:
          'Descubre cómo entrar con naturalidad a círculos de conversación en eventos, pausas de café o reuniones sociales.',
      contextOverview:
          'Llegas a una reunión de networking o descanso de trabajo y ves a tres colegas conversando de pie.',
      iconName: 'groups',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Miras al grupo de tres personas. Dos de ellos están frente a frente, pero sus cuerpos forman un ángulo hacia afuera en forma de "herradura" o "U", dejando un espacio abierto hacia el pasillo.',
          characterAction:
              'Formación corporal en herradura (ángulo abierto hacia el exterior).',
          illustrationKey: 'proxemics_social',
          visibleSignals: [
            'Disposición en forma de U (Círculo abierto)',
            'Pies apuntando parcialmente hacia afuera',
            'Miradas periódicas hacia el salón (Receptividad social)'
          ],
          learningTakeaway:
              'Un grupo cuyos cuerpos forman una "U" abierta invita subconscientemente a que otros se acerquen. Por el contrario, un grupo cerrado en "O" (hombro con hombro, completamente enfrentados) está en una conversación íntima o confidencial donde no se debe entrar.',
          choices: [
            ScenarioChoice(
              text:
                  'Aproximarte con paso tranquilo al espacio abierto de la "U", colocarte a distancia social (1.5 m) y hacer un leve contacto visual con una sonrisa tranquila.',
              analysis:
                  'Entrada impecable: Te colocas en el espacio visible de invitación sin invadir bruscamente el círculo íntimo.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Una de las personas te mira, sonríe amablemente y da un paso atrás para ampliar el espacio de la U hacia ti.',
            ),
            ScenarioChoice(
              text:
                  'Caminar a toda prisa, meterte en medio de dos personas y cortar al que habla para contar un chiste propio.',
              analysis:
                  'Ruptura violenta del espacio personal y del turno conversacional.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Todos guardan silencio con rostros desconcertados y la atmósfera se enfría de golpe.',
            ),
            ScenarioChoice(
              text:
                  'Quedarte a 5 metros de espaldas con los brazos cruzados pensando que nadie quiere hablar contigo.',
              analysis:
                  'Lectura errónea de rechazo: El grupo tenía el círculo abierto esperando interacción.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Permaneces aislado toda la pausa sin conectar con nadie.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Una de las integrantes del grupo hace un breve flash de cejas al verte llegar y te dice: "¡Hola! Estábamos comentando justo la nueva política de trabajo remoto".',
          characterAction:
              'Flash de cejas (elevación rápida) y orientación del pecho hacia ti.',
          illustrationKey: 'eyebrow_flash',
          visibleSignals: [
            'Flash de cejas (Reconocimiento social y bienvenida instantánea)',
            'Resumen contextual del tema (Facilitación de inclusión)'
          ],
          learningTakeaway:
              'Cuando te integran a un grupo, escucha primero un par de intervenciones para sintonizar el tono emocional (¿están quejándose, celebrando o bromeando?) antes de emitir un juicio definitivo.',
          choices: [
            ScenarioChoice(
              text:
                  'Saludar, agradecer la bienvenida y escuchar la siguiente intervención para captar la opinión general antes de aportar tu punto.',
              analysis:
                  'Sintonía empática: Permite acoplarte al ritmo del grupo y responder con aportes que sumen valor.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La conversación fluye con risas compartidas y quedas completamente integrado en el grupo con alta simpatía.',
            ),
            ScenarioChoice(
              text:
                  'Interrumpir y decir enérgicamente: "¡El trabajo remoto no sirve para nada y están todos equivocados!".',
              analysis:
                  'Polarización agresiva: Genera un choque frontal inmediato y rompe la armonía del grupo recién formado.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Los miembros se miran entre sí con incomodidad y el grupo se disuelve en menos de 2 minutos.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 13: EL CLIENTE QUE DICE "DÉJAMELO PENSAR" ---
    Scenario(
      id: 'scenario_delay_objection_sales',
      title: 'El Cliente que Dice: "Déjamelo pensar, yo te aviso"',
      domain: 'Ventas & Negociación',
      description:
          'Aprende a decodificar la objeción de aplazamiento más común y cómo desarmarla con empatía consultiva sin presionar.',
      contextOverview:
          'Llegas al final de una reunión con un cliente potencial tras presentarle una solución para su negocio.',
      iconName: 'psychology',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Terminas tu presentación. El cliente se reclina lentamente hacia atrás en el respaldo, baja la mirada hacia su libreta, junta las manos sobre la mesa y te dice con tono educado pero plano: "Muchas gracias, está muy interesante. Déjamelo pensar y yo te aviso la próxima semana".',
          characterAction:
              'Reclinación hacia atrás, mirada hacia la mesa y frase de aplazamiento cortés.',
          illustrationKey: 'leaning_back',
          visibleSignals: [
            'Reclinación del torso hacia atrás (Distanciamiento físico de la decisión)',
            'Evitación de contacto visual directo durante la frase de aplazamiento',
            'Tono plano y protocolar (Cierre cortés para evitar confrontación)'
          ],
          learningTakeaway:
              '"Déjamelo pensar" casi nunca significa que van a reflexionar sobre la propuesta; suele ser una salida elegante para terminar la reunión sin decir "no". Presionar agresivamente arruina la venta, pero marcharse sin explorar la duda oculta garantiza que no vuelvan a contestarte.',
          choices: [
            ScenarioChoice(
              text:
                  'Desarmar la presión con empatía y formular una pregunta consultiva: "Por supuesto, es una decisión importante. Con total sinceridad, cuando alguien me pide pensarlo suele ser o por el presupuesto o porque falta resolver algún detalle operativo. ¿En cuál de los dos casos estamos?"',
              analysis:
                  'Técnica de aislamiento de objeciones consultiva: Quitas la presión de compra inmediata y das permiso seguro para que confiese su verdadero obstáculo.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente suspira aliviado por tu franqueza, relaja la postura y se abre a compartir el obstáculo real.',
            ),
            ScenarioChoice(
              text:
                  'Presionar agresivamente: "¡Pero si lo firmas hoy te hago un 10% de descuento adicional, no hay nada que pensar!".',
              analysis:
                  'Empuje desesperado: Confirma la sospecha del cliente de que solo buscas tu comisión y aumenta sus defensas corporales.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente cruza los brazos firmemente y dice con frialdad: "Dije que lo voy a pensar. Buen día".',
            ),
            ScenarioChoice(
              text:
                  'Aceptar la frase literalmente: "¡Perfecto, te llamo el lunes sin falta para saber qué decidieron!" y marcharte.',
              analysis:
                  'Error de literalidad: Asumir que la frase era una promesa real. El 90% de estos clientes no atienden el teléfono el lunes.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El lunes llamas tres veces y no te contestan ni responden tus correos.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Al darle permiso de ser honesto, el cliente apoya los codos en la mesa, baja la guardia y confiesa: "Siendo sincero, el producto nos encanta, pero nuestro equipo técnico está saturado con otra migración y tememos que implementar esto ahora nos colapse el mes".',
          characterAction:
              'Codos en la mesa, hombros relajados y tono de voz confidencial.',
          illustrationKey: 'open_posture',
          visibleSignals: [
            'Acercamiento corporal hacia la mesa (Reconexión de interés)',
            'Revelación de la objeción raíz (Problema de tiempos/capacidad, no de precio)'
          ],
          learningTakeaway:
              'Una vez descubierta la verdadera objeción (tiempos del equipo, no desinterés), tu labor no es vender más, sino resolver el miedo específico que bloqueaba el avance.',
          choices: [
            ScenarioChoice(
              text:
                  'Presentar una solución a su miedo específico: "Te entiendo al 100%. Justo por eso nuestro propio equipo técnico hace la configuración inicial en fines de semana sin tocar a tu personal. Si nos encargamos de esa carga, ¿tendría sentido avanzar?"',
              analysis:
                  'Resolución de fricción de alto nivel: Atacas el dolor real del cliente con una alternativa que le da tranquilidad absoluta.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'El cliente se ilumina: "¡Si ustedes se encargan de eso, cerremos de una vez!". ¡Acuerdo firmado y relación sólida ganada!',
            ),
            ScenarioChoice(
              text:
                  'Insistir en bajar el precio a la mitad.',
              analysis:
                  'Desconexión total: La objeción era de tiempo y saturación operativa, no de dinero.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El cliente ve que no escuchaste su preocupación y ratifica que no contratará.',
            ),
          ],
        ),
      ],
    ),
  ];

  static Scenario? getById(String id) {
    try {
      return scenarios.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
