import 'scenario_expansion.dart';
import '../models/scenario.dart';

class ScenarioDatabase {
  static const List<Scenario> scenarios = [
    // --- ESCENARIO 1: VENTAS Y NEGOCIACIÓN ---
    Scenario(
      id: 'scenario_sales_closing',
      title: 'Hablar del precio de un servicio',
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
              'Acabas de explicar tu producto durante 10 minutos. El cliente cruza los brazos, aprieta los labios y mira hacia abajo. No sabes por qué lo hace.',
          characterAction: 'Brazos cruzados y labios apretados.',
          illustrationKey: 'closed_posture',
          visibleSignals: [
            'Brazos cruzados',
            'Labios apretados',
            'Mirada baja'
          ],
          learningTakeaway:
              'Los gestos no revelan por sí solos lo que piensa. Haz una pausa y pregunta si tiene alguna duda.',
          choices: [
            ScenarioChoice(
              text:
                  'Seguir hablando más rápido para terminar toda la presentación antes de que pregunte.',
              analysis:
                  'Aceleras la explicación para impedir preguntas. Conviene dejar un turno para que comunique lo que necesita; no conocemos su estado por los gestos.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'El cliente se desconecta y empieza a mirar su reloj.',
            ),
            ScenarioChoice(
              text:
                  'Hacer una pausa y preguntar: "¿Quieres revisar algún detalle o prefieres que continúe?"',
              analysis:
                  'Buena decisión: preguntas con respeto y le das espacio para expresar cualquier duda.',
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
              'El cliente te explica su objeción sobre el costo. Tú respondes mostrándole cómo el ahorro en 3 meses cubre la inversión inicial. El cliente se inclina hacia adelante sobre la mesa, asiente lentamente y sonríe; se le elevan las mejillas y se le arrugan los ojos.',
          characterAction:
              'Se inclina hacia adelante y sonríe con las mejillas elevadas.',
          illustrationKey: 'leaning_forward',
          visibleSignals: [
            'Inclina el torso hacia adelante',
            'Sonríe y aparecen arrugas junto a los ojos',
            'Contacto visual directo'
          ],
          learningTakeaway:
              'Inclinarse hacia adelante y sonreír puede acompañar atención o comodidad; confirma el interés con una pregunta en vez de asumir intención de compra.',
          choices: [
            ScenarioChoice(
              text:
                  'Pedir el cierre: "¿Te parece si empezamos la implementación el próximo lunes para asegurar el cronograma?"',
              analysis:
                  'Propones un paso concreto y preguntas si desea aceptarlo. Puede pedir más información, otro plazo o no avanzar.',
              isBestAction: true,
              nextStepIndex: null, // Fin con éxito
              consequenceSummary:
                  '¡Trato cerrado con éxito! El cliente firma entusiasmado.',
            ),
            ScenarioChoice(
              text:
                  'Seguir explicando 20 diapositivas más sobre la historia de la empresa.',
              analysis:
                  'Añades información sin comprobar qué necesita. Sonreír y asentir no permiten afirmar que ya tomó una decisión.',
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
          'Descubre cómo ajustar el nivel de formalidad, proximidad y ritmo en una entrevista de trabajo.',
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
                  'Acercarse demasiado o tocar sin permiso puede incomodar. En una primera entrevista, mantén una distancia cómoda y pregunta antes de acercarte.',
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
            'Cierra los ojos brevemente',
            'Golpea suavemente la mesa con los dedos'
          ],
          learningTakeaway:
              'El tamborileo y los ojos cerrados pueden coincidir con cansancio, ritmo personal, concentración o necesidad de una pausa. Comprueba si un resumen ayudaría.',
          choices: [
            ScenarioChoice(
              text:
                  'Concluir con el resultado clave en 1 frase: "En resumen, logramos reducir los costos un 30% en 4 meses. ¿Te gustaría profundizar en algún aspecto?"',
              analysis:
                  'Resumes la información y ofreces elegir qué ampliar. Esa opción no requiere decidir si está cansada o impaciente.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La entrevistadora sonríe aliviada: "Excelente resultado, pasemos a la siguiente pregunta".',
            ),
            ScenarioChoice(
              text:
                  'Hablar durante 10 minutos más detallando cada una de las líneas de código.',
              analysis:
                  'Añades diez minutos de detalle sin comprobar qué información necesita ni cuánto tiempo hay disponible.',
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
      title: 'En el café: ofrecer apoyo y respetar la respuesta',
      domain: 'Social & Amigos',
      description:
          'Practica cómo ofrecer compañía sin invalidar lo que dice una amistad.',
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
            'Habla con volumen bajo',
            'Mantiene los hombros bajos',
            'Dice «todo bien» y mira su taza'
          ],
          learningTakeaway:
              'La cercanía puede ayudarte a notar un cambio, pero no confirma su causa. Respeta «todo bien» y ofrece compañía o espacio si te parece oportuno.',
          choices: [
            ScenarioChoice(
              text:
                  'Decir: "Te conozco y noto tu voz algo apagada. Si quieres desahogarte o hablar de algo, aquí estoy."',
              analysis:
                  'La respuesta ideal: Ofreces un espacio seguro y empático sin forzarlo agresivamente.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'En este ejemplo tu amigo decide hablar de una preocupación. También podría decir que está bien o que prefiere no conversar; las tres respuestas merecen respeto.',
            ),
            ScenarioChoice(
              text:
                  'Decir: "Ah, perfecto, qué bueno que estés bien", y hablar durante una hora de tus propias cosas.',
              analysis:
                  'Aceptar que está bien es válido. Hablar durante una hora sin darle espacio para participar puede dificultar la conversación; sus gestos no prueban una petición de ayuda.',
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
          'Aprende a observar y preguntar cuando solicites un aumento o presupuesto.',
      contextOverview:
          'Estás en la reunión anual de evaluación de desempeño con tu Gerente de Área.',
      iconName: 'briefcase',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Acabas de presentar los resultados del año y propones un ajuste salarial del 20%. Tu gerente aprieta la mandíbula, sostiene la mirada durante 3 segundos en silencio y apoya ambas manos planas sobre la mesa.',
          characterAction:
              'Aprieta la mandíbula y apoya las manos firmemente en la mesa.',
          illustrationKey: 'jaw_clenching',
          visibleSignals: [
            'Aprieta la mandíbula',
            'Apoya las manos sobre la mesa',
            'Hace una pausa sin responder'
          ],
          learningTakeaway:
              'La mandíbula tensa y el silencio pueden aparecer mientras alguien procesa una cifra o regula su respuesta. Deja espacio y pregunta si desea revisar algún aspecto.',
          choices: [
            ScenarioChoice(
              text:
                  'Dar tiempo para revisar la propuesta y preguntar si desea comentar la cifra o necesita más información, sin exigir contacto visual.',
              analysis:
                  'Dar tiempo y preguntar ayuda a coordinar la negociación. Hablar primero no determina quién cede; revisa condiciones y decisiones explícitas.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'En este ejemplo, el gerente responde: "El 20% es alto para el presupuesto actual, pero revisemos qué porcentaje podemos estructurar con bonos".',
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
            'Se toca la barbilla',
            'Asiente mientras revisa el documento'
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
      title: 'Cuando el cliente dice: "Ya tenemos proveedor"',
      domain: 'Ventas B2B',
      description:
          'Practica cómo preguntar si una persona está satisfecha con su servicio actual, sin dar por hecho lo que piensa.',
      contextOverview:
          'Estás en una primera llamada exploratoria con el Gerente de Logística de una empresa grande.',
      iconName: 'business',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Le preguntas sobre sus procesos logísticos. Él responde en tono tajante "Todo nos funciona perfecto con nuestro proveedor actual", pero mientras lo dice se toca la nuca con la mano y desvía la mirada hacia el suelo.',
          characterAction: 'Se toca el cuello y mira hacia abajo.',
          illustrationKey: 'touching_neck',
          visibleSignals: [
            'Se toca la nuca',
            'Mira hacia abajo',
            'Dice que está satisfecho con el proveedor'
          ],
          learningTakeaway:
              'La persona ha dicho que está satisfecha. Tocarse el cuello admite causas físicas o habituales. Puedes preguntar si quiere revisar alternativas y respetar su elección.',
          choices: [
            ScenarioChoice(
              text:
                  'Preguntar: "Gracias por aclararlo. ¿Quieren conocer otra opción o prefieren dejarlo aquí?"',
              analysis:
                  'Puedes preguntar qué le funciona y qué cambiaría. Escucha su respuesta sin insistir.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'En este caso, el cliente acepta revisar otra opción y comenta los plazos. En otra conversación podría preferir terminar sin dar más detalles.',
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
          'Practica cómo coordinar un pedido mientras alguien consulta la pantalla.',
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
          illustrationKey: 'scenario_shopping_backchannel',
          visibleSignals: [
            'Hace pequeños movimientos de cabeza hacia abajo',
            'Atención dividida hacia la pantalla de cobro',
            'Silencio funcional de trabajo'
          ],
          learningTakeaway:
              'En una interacción breve, alguien puede asentir para mostrar que escuchó. Si no estás seguro, pregunta si entendió o necesita algo más.',
          choices: [
            ScenarioChoice(
              text:
                  'Dar un momento para que consulte el sistema y, si hace falta, preguntar: "¿Quieres que repita algún producto?"',
              analysis:
                  'Dar tiempo y aclarar el pedido permite coordinarse. Un asentimiento puede acompañar la escucha, pero no confirma qué productos entendió.',
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
          'Descubre cómo elegir un lugar cómodo y respetar el espacio de los demás en una reunión.',
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
          illustrationKey: 'scenario_meeting_seating',
          visibleSignals: [
            'Hay un asiento libre en el extremo de la mesa',
            'Hay asientos libres a los lados',
            'Las distancias a la pantalla varían entre asientos'
          ],
          learningTakeaway:
              'La ubicación puede afectar qué ves y oyes. Comprueba si hay asientos reservados y elige uno adecuado a tus necesidades; la forma de la mesa no asigna autoridad por sí sola.',
          choices: [
            ScenarioChoice(
              text: 'Sentarte en la cabecera principal de la mesa.',
              analysis:
                  'Elegir sin comprobar si ese lugar está reservado puede requerir cambiar de asiento. Estar en un extremo no prueba prepotencia.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Cuando llega el líder de la reunión, se produce un silencio incómodo para pedirte que te muevas.',
            ),
            ScenarioChoice(
              text:
                  'Preguntar si hay asientos reservados y elegir uno desde el que puedas ver el material y escuchar cómodamente.',
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
                  'Un asiento apartado puede dificultar ver el material o escucharse. La ubicación no permite deducir inseguridad ni ganas de participar.',
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
              'Mira hacia distintos lugares de la mesa mientras pregunta.',
          illustrationKey: 'proxemics_social',
          visibleSignals: [
            'Mira hacia los asientos laterales',
            'Hace una pregunta abierta al grupo'
          ],
          learningTakeaway:
              'Estar en el lateral intermedio te coloca en el campo de visión natural del moderador para aportar cuando sea oportuno.',
          choices: [
            ScenarioChoice(
              text:
                  'Pedir un turno mediante el canal acordado: levantar la mano, decir "¿puedo aportar algo?" o usar el chat, según la reunión.',
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
              'Llevan unos minutos hablando de tus pasatiempos. La otra persona mira la hora y tiene un pie orientado hacia la salida. No sabes si tiene prisa; puedes preguntarle.',
          characterAction:
              'Mira la hora y tiene un pie orientado hacia la salida.',
          illustrationKey: 'scenario_exit_strategy',
          visibleSignals: [
            'Mira la hora',
            'Tiene un pie orientado hacia la salida',
          ],
          learningTakeaway:
              'Estos detalles no permiten saber por sí solos qué piensa. Puedes preguntar: "¿Tienes que irte o quieres que sigamos hablando?"',
          choices: [
            ScenarioChoice(
              text:
                  'Agradecer el momento y cerrar con calidez: "Bueno, no te quito más tiempo para que sigas con tus pendientes. ¡Me encantó platicar, que tengas buen día!"',
              analysis:
                  'Notaste que quizá tiene prisa. Pregúntale si prefiere seguir hablando o dejarlo para otro momento.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'La persona puede seguir hablando o despedirse. En ambos casos respetas su tiempo.',
            ),
            ScenarioChoice(
              text:
                  'Ignorar los pies y el reloj y continuar explicando los siguientes 10 minutos de tu anécdota.',
              analysis:
                  'Seguir hablando sin comprobar si tiene tiempo puede incomodarla. Pregunta o haz una pausa.',
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
          'Aprende cuándo y cómo preguntar algo a un compañero ocupado, respetando su espacio y su tiempo.',
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
          illustrationKey: 'scenario_interrupt_busy_colleague',
          visibleSignals: [
            'Auriculares (barrera acústica voluntaria contra interrupciones)',
            'Inclinación focalizada (modo concentración o foco profundo)',
            'Ritmo de tecleo ininterrumpido (flujo mental activo)'
          ],
          learningTakeaway:
              'Los auriculares en una oficina moderna pueden indicar que la persona prefiere no ser interrumpida. Tocar el hombro o hablar fuerte por detrás puede sobresaltar. Busca una forma de llamar su atención que respete su espacio.',
          choices: [
            ScenarioChoice(
              text:
                  'Colocarte en su campo de visión lateral a distancia prudencial (1.5 m) y hacer un leve gesto con la mano, o enviarle un chat: "¿Tienes 1 min para una clave urgente o te consulto en un rato?"',
              analysis:
                  'Bien: respetas su espacio y le das tiempo para pensar antes de responder.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu compañero termina de teclear su línea, levanta la vista con calma, se retira un auricular y sonríe con disposición.',
            ),
            ScenarioChoice(
              text:
                  'Llegar por detrás silenciosamente y tocarle el hombro con firmeza para llamar su atención.',
              analysis:
                  'Tocar por sorpresa puede resultar incómodo o sobresaltar. Prefiere una forma de llamar la atención acordada y respetuosa.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu compañero salta del asiento asustado, se le cae el bolígrafo y te mira visiblemente molesto.',
            ),
            ScenarioChoice(
              text:
                  'Pararte inmóvil a 40 cm de él esperando en silencio a que se dé cuenta por sí mismo.',
              analysis:
                  'Esperar muy cerca puede incomodar. Deja espacio y pregunta cuándo le viene bien hablar.',
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
            'Se quitó un auricular para escucharte',
            'Mano en reposo sobre el teclado (ventana de tiempo breve)'
          ],
          learningTakeaway:
              'Como la otra persona hizo una pausa para escucharte, resume tu necesidad en una frase y pregunta si puede revisarla ahora o conviene acordar otro momento.',
          choices: [
            ScenarioChoice(
              text:
                  'Ir al punto: "Necesito subir la entrega de hoy. ¿Me indicas el procedimiento aprobado para obtener acceso?".',
              analysis:
                  'La petición concreta permite responder con el procedimiento adecuado. No compartan contraseñas por chat; acuerden cuándo revisar el acceso si hace falta.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu compañero te indica el canal aprobado para solicitar acceso y acuerdan el siguiente paso.',
            ),
            ScenarioChoice(
              text:
                  'Aprovechar que te miró para quejarte del jefe, del clima y contarle lo difícil que fue tu fin de semana antes de pedir la clave.',
              analysis:
                  'La persona ha comunicado una entrega pendiente. Acuerda un momento para hablar en vez de dar por hecho que puede prolongar la pausa.',
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
          illustrationKey: 'scenario_group_conversation_entry',
          visibleSignals: [
            'Disposición en forma de U (Círculo abierto)',
            'Pies apuntando parcialmente hacia afuera',
            'La mirada pasa por distintos puntos del salón'
          ],
          learningTakeaway:
              'La disposición del grupo muestra dónde hay espacio físico. No permite saber si la conversación es privada ni si desean compañía. Pregunta antes de unirte.',
          choices: [
            ScenarioChoice(
              text:
                  'Dejar espacio y preguntar: "¿Les viene bien que me una?". Esperar la respuesta antes de entrar en el grupo.',
              analysis:
                  'Preguntas por la disponibilidad del grupo y respetas su respuesta; no das por hecho que el hueco es una invitación.',
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
                  'La forma del grupo no confirma invitación ni rechazo. Si deseas participar, puedes preguntar; también puedes decidir no unirte.',
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
          'Practica cómo responder cuando alguien pide tiempo para pensarlo, sin presionarle.',
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
          illustrationKey: 'scenario_delay_objection_sales',
          visibleSignals: [
            'Reclinación del torso hacia atrás (Distanciamiento físico de la decisión)',
            'Evitación de contacto visual directo durante la frase de aplazamiento',
            'Tono plano y protocolar (Cierre cortés para evitar confrontación)'
          ],
          learningTakeaway:
              'La persona ha pedido tiempo para pensar. No conocemos su motivo ni qué decidirá. Puedes ofrecer información y acordar si desea un seguimiento, sin presionar ni suponer una objeción oculta.',
          choices: [
            ScenarioChoice(
              text:
                  'Respetar la pausa: "Por supuesto. ¿Quieres algún dato adicional para revisarlo? ¿Prefieres contactarme tú o acordamos un seguimiento?".',
              analysis:
                  'Ofreces opciones sin limitar los motivos de la persona a presupuesto o dificultades operativas.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'En este ejemplo, el cliente decide explicar una dificultad. En otra conversación podría pedir tiempo o preferir no dar más detalles.',
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
                  'Decides llamar sin haber acordado el seguimiento. Conviene preguntar qué canal y momento prefiere la persona.',
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
              'En este ejemplo ficticio, el cliente explica una dificultad de su equipo: "Siendo sincero, el producto nos encanta, pero nuestro equipo técnico está saturado con otra migración y tememos que implementar esto ahora nos colapse el mes".',
          characterAction:
              'Codos en la mesa, hombros relajados y tono de voz confidencial.',
          illustrationKey: 'open_posture',
          visibleSignals: [
            'Apoya los codos en la mesa',
            'Comunica con palabras una dificultad de capacidad y plazos'
          ],
          learningTakeaway:
              'La persona ha explicado una dificultad de capacidad del equipo. Revisa qué puedes ofrecer realmente y permite que decida si necesita más tiempo.',
          choices: [
            ScenarioChoice(
              text:
                  'Ofrecer una alternativa que realmente puedas cumplir: "Podemos revisar qué tareas asumiría nuestro equipo y cuándo. ¿Quieres evaluar si eso encaja o prefieres posponerlo?"',
              analysis:
                  'Pregunta qué necesita revisar y ofrece una alternativa concreta. La otra persona decide si le sirve.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'El cliente se ilumina: "¡Si ustedes se encargan de eso, cerremos de una vez!". ¡Acuerdo firmado y relación sólida ganada!',
            ),
            ScenarioChoice(
              text: 'Insistir en bajar el precio a la mitad.',
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

    // --- ESCENARIO 14: LÍMITES ASERTIVOS EN EL TRABAJO ---
    Scenario(
      id: 'scenario_assertive_boundaries_work',
      title: 'Poner límites ante la presión de un compañero',
      domain: 'Límites',
      description:
          'Aprende a decir que no con la Fórmula E-I-A y sostener tu límite con el disco rayado sin sonreír por culpa.',
      contextOverview:
          'Es viernes a las 5:00 PM. Un colega encantador se acerca a tu escritorio con una carpeta y te pide que le hagas su informe porque él quiere salir temprano.',
      iconName: 'shield',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Tu colega se apoya en tu mesa, invade tu espacio personal a menos de 40 cm y te dice con tono adulador: "¡Hola! Oye, sé que eres un crack con los datos y a mí me cuesta horrores. ¿Podrías hacerme este análisis para el lunes? Me harías el favor de la vida". Notas que tu estómago se aprieta y tu primer impulso involuntario es sonreír tímidamente.',
          characterAction:
              'Invasión de espacio personal, sonrisa de demanda social y postura inclinada hacia adelante.',
          illustrationKey: 'scenario_assertive_boundaries_work',
          visibleSignals: [
            'Espacio personal invadido (< 45 cm)',
            'Sonrisa de demanda social',
            'Postura envolvente sobre tu mesa'
          ],
          learningTakeaway:
              'Ante una invasión de límites, sonreír o dar excusas circunstanciales ("es que tengo una cita") invita a negociar. El límite debe basarse en tu propia capacidad y rol profesional.',
          choices: [
            ScenarioChoice(
              text:
                  'Sonreír con nerviosismo y decir: "Eh... bueno, es que tengo un poco de prisa hoy, pero déjamelo a ver si me da tiempo".',
              analysis:
                  'La frase no aclara si aceptarás el informe. Puedes decir que necesitas tiempo para decidir o expresar tu decisión. La sonrisa no equivale a aceptar.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu colega te deja la carpeta con una palmadita y dice: "¡Sabía que podía contar contigo!". Quedas atrapado.',
            ),
            ScenarioChoice(
              text:
                  'Mantener expresión serena, dar un paso atrás y aplicar la Fórmula E-I-A: "No me es posible asumir este informe. Mi jornada termina a las 6 y mi capacidad está asignada a mis propios cierres; tendrás que gestionarlo tú".',
              analysis:
                  'Excelente ejecución asertiva: Hecho observable + Impacto + Acción declarada sin justificaciones ni disculpas vacías.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu colega se sorprende por tu firmeza y se endereza, pero intenta una segunda maniobra de presión emocional.',
            ),
            ScenarioChoice(
              text:
                  'Gritarle con agresividad: "¡Siempre te aprovechas de la gente, lárgate de mi mesa!".',
              analysis:
                  'Respuesta desregulada: Pasar de la sumisión al ataque agresivo genera conflicto innecesario y desvía el foco del límite.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'La oficina se queda en silencio incómodo y tu colega se victimiza ante los demás.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'Tu colega frunce el ceño, cambia a tono de víctima y dice: "¡Vaya, qué frío! Pensé que éramos un equipo. Si no me ayudas me van a llamar la atención el lunes. ¿De verdad me vas a dejar tirado?".',
          characterAction:
              'Cruza los brazos, inclina la cabeza y cuestiona tu decisión con palabras.',
          illustrationKey: 'frown_eyebrows',
          visibleSignals: [
            'Dice que lo dejarías tirado si no aceptas',
            'Postura de reproche',
            'Mira hacia ti mientras insiste'
          ],
          learningTakeaway:
              'El comentario sigue presionando después de tu respuesta. Puedes repetir el límite con palabras claras o cerrar la conversación. Eso no garantiza que la otra persona acepte ni identifica su intención interna.',
          choices: [
            ScenarioChoice(
              text:
                  'Reiterar tu decisión con palabras claras y un tono que te resulte cómodo: "Entiendo que estés preocupado por el lunes, pero como te mencioné, no voy a asumir este informe. Mucho éxito con tu entrega".',
              analysis:
                  'Reiteras tu decisión. Puedes explicar lo que quieras, pero no necesitas convencerlo para mantener el límite. Si insiste, puedes terminar el intercambio.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu colega comprende que tu decisión es innegociable, toma su carpeta y se marcha a hacer su trabajo. ¡Has protegido tu salud mental y tu tiempo!',
            ),
            ScenarioChoice(
              text:
                  'Empezar a explicarle detalladamente todos tus proyectos para intentar convencerlo de que no eres una mala persona.',
              analysis:
                  'Trampa de justificación: Al dar explicaciones prolongadas, le das material para que contra-argumente: "Pero si eso lo haces rápido...".',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'El debate se extiende 20 minutos más y terminas agotado cediendo a una parte del informe.',
            ),
            ScenarioChoice(
              text:
                  'Ceder por culpa: "Bueno, está bien, déjamelo y me quedo hasta las 8 haciéndolo".',
              analysis:
                  'Colapso del límite: Enseñas al entorno que insistir con culpa funciona contigo y repetirán la conducta en el futuro.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Pierdes tu tarde de viernes, acumulas resentimiento y alimentas el ciclo de complacencia.',
            ),
          ],
        ),
      ],
    ),

    // --- ESCENARIO 15: CONSENTIMIENTO REAL VS FALSO SÍ ---
    Scenario(
      id: 'scenario_consent_decoding_fawning',
      title: 'Comprobar que un sí es libre',
      domain: 'Límites & Consentimiento',
      description:
          'Aprende a preguntar sin presionar y a dejar claro que la otra persona puede decir que no.',
      contextOverview:
          'Estás planeando una salida con un amigo y le propones ir a un festival gastronómico concurrido y ruidoso.',
      iconName: 'handshake',
      steps: [
        ScenarioStep(
          id: 'step_1',
          narrative:
              'Le propones a tu amigo ir a un festival concurrido y con música. Suspira, mira hacia la salida y responde: "Eh... sí, bueno, supongo que podemos ir un rato...". No sabes por sus gestos qué prefiere.',
          characterAction:
              'Suspira, mira hacia la salida y responde con dudas.',
          illustrationKey: 'scenario_consent_decoding_fawning',
          visibleSignals: [
            'Suspira',
            'Mira hacia la salida',
            'Responde con dudas',
          ],
          learningTakeaway:
              'No puedes saber por los gestos si alguien quiere aceptar. Si tienes dudas, pregunta: "¿De verdad te apetece? Está bien decir que no". Respeta la respuesta.',
          choices: [
            ScenarioChoice(
              text:
                  'Festejar y decir: "¡Genial! ¡Sabía que te gustaría! Vamos a estar hasta las 11 de la noche recorriendo puestos".',
              analysis:
                  'Das por hecho que quiere ir sin comprobarlo. Los gestos no bastan para saberlo.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu amigo se apaga internamente. La salida se vuelve tensa e incómoda para ambos.',
            ),
            ScenarioChoice(
              text:
                  'Preguntar sin presionar: "¿De verdad te apetece ir? Está bien decir que no; podemos dejarlo para otro día".',
              analysis:
                  'Le das espacio para decidir. No tienes que adivinar sus motivos; escucha y respeta su respuesta.',
              isBestAction: true,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu amigo cambia por completo su expresión corporal y suelta el aire con alivio.',
            ),
            ScenarioChoice(
              text:
                  'Enojarte y reprocharle: "¿Por qué pones esa cara aburrida si me acabas de decir que sí?".',
              analysis:
                  'Castigar la incomodidad ajena: Forzar a alguien a aparentar entusiasmo genera culpa y destruye la seguridad psicológica.',
              isBestAction: false,
              nextStepIndex: 1,
              consequenceSummary:
                  'Tu amigo se encierra en sí mismo y se disculpa sintiéndose avergonzado.',
            ),
          ],
        ),
        ScenarioStep(
          id: 'step_2',
          narrative:
              'En este desenlace ficticio, tu amigo responde: "¡Uff, gracias por entenderlo! De verdad estoy exhausto y me daba mucha vergüenza decirte que no después de tu entusiasmo".',
          characterAction:
              'Hombros bajos, sonrisa y torso orientado hacia la otra persona.',
          illustrationKey: 'duchenne_smile',
          visibleSignals: [
            'Sonrisa con arrugas junto a los ojos',
            'La persona parece más tranquila',
            'Conexión de confianza restaurada'
          ],
          learningTakeaway:
              'Brindar salidas airosas sin culpa fortalece los vínculos seguros: la otra persona sabe que contigo no necesita enmascarar ni ceder por compromiso.',
          choices: [
            ScenarioChoice(
              text:
                  'Validar su decisión con calidez: "¡Totalmente comprensible! Descansa mucho hoy y cuando recarguemos baterías coordinamos algo tranquilo".',
              analysis:
                  'Cierre relacional impecable: Creas un espacio donde decir que no es seguro, aumentando la confianza mutua a largo plazo.',
              isBestAction: true,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu amigo te agradece de corazón. ¡Has practicado el consentimiento real y protegido el bienestar de tu amigo!',
            ),
            ScenarioChoice(
              text:
                  'Decirle: "Bueno, pero la próxima semana me debes una y tienes que venir obligado".',
              analysis:
                  'Contabilidad afectiva tóxica: Tratar el consentimiento como una deuda destruye la libertad del vínculo.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu amigo vuelve a tensarse sintiendo que acumuló una obligación impuesta.',
            ),
            ScenarioChoice(
              text:
                  'Quedarte en silencio con mala cara para que note tu desilusión.',
              analysis:
                  'Manipulación pasivo-agresiva: Castigar el límite del otro con silencio daña la relación.',
              isBestAction: false,
              nextStepIndex: null,
              consequenceSummary:
                  'Tu amigo se siente culpable y se aísla emocionalmente.',
            ),
          ],
        ),
      ],
    ),
    ...ScenarioExpansion.scenarios,
  ];

  static Scenario? getById(String id) {
    try {
      return scenarios.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
