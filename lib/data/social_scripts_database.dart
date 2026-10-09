import 'social_scripts_expansion.dart';
import '../models/social_script.dart';

class SocialScriptsDatabase {
  static const List<SocialScript> scripts = [
    // ==========================================
    // ÁMBITO LABORAL
    // ==========================================
    SocialScript(
      id: 'work_extra_hours',
      title: 'Rechazar horas extras o trabajo imprevisto',
      category: SocialScriptCategory.work,
      contextDescription:
          'Tu supervisor o colega te pide quedarte hasta tarde o asumir una urgencia de última hora al final de tu jornada.',
      softPhrase:
          'Hoy ya tengo compromisos al terminar mi jornada laboral. Con gusto puedo priorizar este tema a primera hora de mañana.',
      assertivePhrase:
          'No me es posible asumir esto hoy. Mi horario concluye a las [hora] y podré retomarlo en mi siguiente turno.',
      firmPhrase:
          'No estoy disponible fuera de mi horario laboral pactado. Lo revisaremos mañana dentro de la jornada de trabajo.',
      bodyLanguage:
          'Mantén los hombros relajados y la espalda recta. Tono de voz descendente al final de la frase (punto final, no signo de interrogación).',
      whatNotToDo:
          'No inventes excusas elaboradas ni te disculpes repetidamente; justificarse abre la puerta a que intenten negociar tu tiempo.',
    ),
    SocialScript(
      id: 'work_out_of_scope',
      title: 'Rechazar tareas que no corresponden a tu rol',
      category: SocialScriptCategory.work,
      contextDescription:
          'Te piden resolver una tarea o trámite que corresponde a otra área o que desvía tus objetivos principales.',
      softPhrase:
          'Para no retrasar mis entregables prioritarios actuales, creo que la persona más adecuada para gestionar esto es [Nombre].',
      assertivePhrase:
          'Esa tarea se encuentra fuera del alcance de mis funciones y objetivos actuales. Sugiero canalizarla con el equipo responsable.',
      firmPhrase:
          'No puedo asumir esa responsabilidad. Mi capacidad está asignada al 100% a mis proyectos vigentes.',
      bodyLanguage:
          'Gesto de manos abiertas a la altura del pecho. Contacto visual calmo de 2 a 3 segundos sin desviar la mirada hacia abajo.',
      whatNotToDo:
          'Evita decir "lo intentaré si me da tiempo", pues lo asumirán como un "sí" provisional y te pedirán cuentas después.',
    ),
    SocialScript(
      id: 'work_need_time_to_think',
      title: 'Ganar tiempo antes de comprometerte a algo',
      category: SocialScriptCategory.work,
      contextDescription:
          'Te presionan para tomar una decisión o aceptar un proyecto inmediatamente en una reunión o pasillo.',
      softPhrase:
          'Me parece una propuesta interesante. Permíteme revisar mi cronograma y te confirmo por escrito esta misma tarde.',
      assertivePhrase:
          'Necesito evaluar mi carga de trabajo actual antes de responder. Te daré una respuesta definitiva antes de las [hora].',
      firmPhrase:
          'No tomo decisiones de esta naturaleza en el momento. Lo revisaré con calma y te comunicaré mi resolución por correo.',
      bodyLanguage:
          'Postura asentada, asintiendo una sola vez de forma lenta para mostrar que escuchaste sin comprometerte.',
      whatNotToDo:
          'No digas un "sí" automático por la incomodidad de la pausa o el silencio en la conversación.',
    ),
    SocialScript(
      id: 'work_no_blame_absorb',
      title: 'Frenar que te atribuyan errores ajenos',
      category: SocialScriptCategory.work,
      contextDescription:
          'En un equipo o reunión intentan asignarte la responsabilidad de un retraso o fallo que no dependía de ti.',
      softPhrase:
          'Entiendo la molestia por el resultado. Revisemos la minuta: mi parte fue entregada el [fecha], por lo que el cuello de botella se produjo en otra fase.',
      assertivePhrase:
          'Ese resultado no corresponde a mi área de gestión. Mi entrega estuvo lista en los términos acordados; revisemos los registros con objetividad.',
      firmPhrase:
          'No acepto la responsabilidad por ese incidente. Los datos muestran con claridad que mi entrega fue completada en tiempo y forma.',
      bodyLanguage:
          'Manos visibles apoyadas en la mesa, cabeza erguida, voz pausada y neutra sin elevar el volumen ni mostrar agitación.',
      whatNotToDo:
          'Puedes poner un límite aunque sonrías por nervios o adoptes una postura recogida. Expresa lo que necesitas con palabras; la postura no determina culpa ni invalida tu límite.',
    ),

    // ==========================================
    // ÁMBITO SOCIAL / EVENTOS
    // ==========================================
    SocialScript(
      id: 'social_decline_invitation',
      title: 'Rechazar invitación a evento social sin inventar excusas',
      category: SocialScriptCategory.social,
      contextDescription:
          'Amigos, conocidos o compañeros de trabajo te invitan a una fiesta, cena o salida a la que no deseas asistir.',
      softPhrase:
          '¡Muchas gracias por la invitación! Esta vez no me va a ser posible acompañarles, pero espero que disfruten mucho.',
      assertivePhrase:
          'Agradezco que hayas pensado en mí. No podré asistir en esta ocasión. Que tengan un excelente encuentro.',
      firmPhrase:
          'Gracias por la invitación, pero no voy a asistir. Deseo que lo pasen muy bien.',
      bodyLanguage:
          'Sonrisa amable y breve, cabeza ligeramente ladeada en señal de calidez, sin titubeos en el final de la frase.',
      whatNotToDo:
          'Puedes decir que no o pedir tiempo si aún no has decidido. No necesitas inventar una justificación; una respuesta ambigua no autoriza a que te presionen.',
    ),
    SocialScript(
      id: 'social_leave_early',
      title: 'Marcharse temprano de una reunión o fiesta',
      category: SocialScriptCategory.social,
      contextDescription:
          'Te sientes cansado de conversar o simplemente deseas marcharte a casa sin dar más explicaciones.',
      softPhrase:
          'Ha sido un placer verlos a todos. Ya es hora de retirarme a descansar. ¡Nos vemos pronto!',
      assertivePhrase:
          'Me retiro ya. Ha sido un gusto compartir este rato con ustedes. Buenas noches a todos.',
      firmPhrase:
          'Me marcho ahora mismo. Gracias por la velada. Que sigan disfrutando.',
      bodyLanguage:
          'Ponte de pie con determinación, toma tus pertenencias antes de despedirte y camina con paso constante hacia la salida.',
      whatNotToDo:
          'No entres en la trampa de "quédate una hora más". No te justifiques con que estás cansado; retirarse es un derecho no negociable.',
    ),
    SocialScript(
      id: 'social_refuse_food_alcohol',
      title: 'Rechazar alcohol, comida o bebidas no deseadas',
      category: SocialScriptCategory.social,
      contextDescription:
          'En un evento o reunión te insisten para que bebas alcohol, repitas un plato o consumas algo que no deseas.',
      softPhrase:
          'Se ve muy bien, muchas gracias, pero por ahora estoy perfecto solo con mi agua.',
      assertivePhrase:
          'No tomo alcohol / No deseo más, gracias. Estoy muy bien así.',
      firmPhrase: 'No, gracias. Ya he dicho que no deseo tomar/comer más.',
      bodyLanguage:
          'Gesto de palma abierta hacia abajo o cubriendo levemente tu propio vaso. Mirada directa y tranquila.',
      whatNotToDo:
          'No tienes que explicar motivos médicos o de alimentación si no quieres. Puedes repetir tu respuesta con calma.',
    ),
    SocialScript(
      id: 'social_unwanted_touch',
      title: 'Frenar contacto físico no deseado (abrazos o besos forzados)',
      category: SocialScriptCategory.social,
      contextDescription:
          'Alguien intenta saludarte con un abrazo íntimo o beso que traspasa tus límites de confort físico.',
      softPhrase:
          '¡Hola! Prefiero un saludo de manos o puño por comodidad, ¡un gran gusto verte!',
      assertivePhrase:
          'Prefiero mantener distancia física y saludar de mano, gracias por comprenderlo.',
      firmPhrase:
          'Por favor no me abraces/toques; no me siento cómodo con el contacto físico.',
      bodyLanguage:
          'Extiende tu mano derecha firme a media distancia antes de que la persona se acerque a tu espacio personal, creando una barrera física natural.',
      whatNotToDo:
          'No te quedes paralizado permitiendo el contacto si te resulta invasivo; extender la mano anticipadamente bloquea el acercamiento con cortesía.',
    ),

    // ==========================================
    // ÁMBITO SENSORIAL / ESPACIO
    // ==========================================
    SocialScript(
      id: 'sensory_lower_volume',
      title: 'Pedir bajar el volumen o apagar música o ruido ambiente',
      category: SocialScriptCategory.sensory,
      contextDescription:
          'El volumen de la música, televisión o altavoz en una sala compartida te produce molestia o sobrecarga acústica.',
      softPhrase:
          'Disculpa, ¿te importaría si bajamos un poco el volumen? Me cuesta concentrarme / escuchar con este nivel sonoro.',
      assertivePhrase:
          'El volumen actual me resulta excesivamente alto y sobrecargante. Por favor, bajémoslo a este nivel.',
      firmPhrase:
          'El nivel de ruido actual me causa malestar sensorial real. Necesito que bajemos el volumen de inmediato.',
      bodyLanguage:
          'Voz calmada pero directa, indicando con los dedos un nivel menor o señalando el control del dispositivo con serenidad.',
      whatNotToDo:
          'No lo pidas con sarcasmo ni queja pasivo-agresiva; solicitar ajustes ambientales sensoriales es una necesidad legítima de accesibilidad.',
    ),
    SocialScript(
      id: 'sensory_personal_space',
      title: 'Solicitar distancia física ante invasión del espacio vital',
      category: SocialScriptCategory.sensory,
      contextDescription:
          'Una persona se coloca excesivamente cerca de tu rostro o cuerpo al hablar en una fila, pasillo o reunión.',
      softPhrase:
          'Permíteme dar un paso atrás; me siento más cómodo conversando con un poco más de espacio entre los dos.',
      assertivePhrase:
          'Por favor, mantengamos un poco de distancia física. Necesito mi espacio para conversar con comodidad.',
      firmPhrase:
          'Estás demasiado cerca de mi espacio personal. Por favor, retrocede un paso.',
      bodyLanguage:
          'Da un paso hacia atrás deliberadamente. Mantén la cabeza en alto y no cruces los brazos con timidez.',
      whatNotToDo:
          'No te acostumbres a encogerte en tu sitio soportando la incomodidad; el retroceso físico es la señal primaria de límite espacial.',
    ),
    SocialScript(
      id: 'sensory_pause_overload',
      title: 'Pedir una pausa por sobrecarga sensorial o mental',
      category: SocialScriptCategory.sensory,
      contextDescription:
          'Llevas mucho tiempo en un lugar ruidoso o en una reunión intensa y necesitas una pausa.',
      softPhrase:
          'Necesito tomar un poco de aire fresco durante 5 minutos para despejar la mente. Vuelvo enseguida.',
      assertivePhrase:
          'Estoy experimentando sobrecarga de estímulos en este momento. Voy a tomar una pausa de 10 minutos en silencio y regreso.',
      firmPhrase:
          'Necesito descansar un momento. Ahora no puedo seguir hablando; podemos retomarlo en [tiempo].',
      bodyLanguage:
          'Ponte de pie con serenidad, respira profundamente y sal con calma hacia un espacio tranquilo o exterior.',
      whatNotToDo:
          'No esperes a tener un colapso (*meltdown* o *shutdown*) para pedir la pausa; el límite se marca cuando la energía empieza a bajar.',
    ),

    // ==========================================
    // ÁMBITO PRESIÓN E INSISTENCIA
    // ==========================================
    SocialScript(
      id: 'pressure_broken_record',
      title: 'Técnica del disco rayado ante insistencia persistente',
      category: SocialScriptCategory.pressure,
      contextDescription:
          'Ya dijiste que no, pero la persona continúa insistiendo, buscando argumentos o presionando para que cedas.',
      softPhrase:
          'Comprendo tu punto de vista, pero como te mencioné, mi respuesta sigue siendo no.',
      assertivePhrase:
          'Entiendo que desees eso, pero no voy a cambiar de opinión. Mi decisión es definitiva.',
      firmPhrase:
          'Ya te he dado mi respuesta y es un no rotundo. Por favor, no insistas más en este tema.',
      bodyLanguage:
          'Inmovilidad física. No hagas gestos nuevos con las manos ni muevas los ojos en círculos. Rostro neutro y voz monocorde.',
      whatNotToDo:
          'No agregues argumentos nuevos. Repite exactamente la misma frase; cambiar de argumento reinicia el debate con el insistente.',
    ),
    SocialScript(
      id: 'pressure_aggressive_sales',
      title: 'Frenar comerciales o vendedores insistentes',
      category: SocialScriptCategory.pressure,
      contextDescription:
          'Te abordan en la calle, centro comercial o por llamada telefónica con técnicas de venta de alta presión.',
      softPhrase:
          'Gracias por la información, pero no tengo interés en el servicio. Que tengas buen día.',
      assertivePhrase:
          'No me interesa en absoluto. Por favor no insistas y retira mi contacto de su base de datos.',
      firmPhrase: 'He dicho no. No continúes con el diálogo. Adiós.',
      bodyLanguage:
          'No detengas tu paso si estás caminando. Si es por teléfono, dilo con voz firme y cuelga de inmediato sin esperar réplica.',
      whatNotToDo:
          'No te pares a escuchar "solo por cortesía". Las técnicas agresivas se alimentan de la incomodidad de la persona educada.',
    ),
    SocialScript(
      id: 'pressure_lend_money_items',
      title: 'Negarse a prestar dinero, vehículo o pertenencias de valor',
      category: SocialScriptCategory.pressure,
      contextDescription:
          'Un amigo, familiar o colega te pide dinero prestado o un objeto de alto valor personal o económico.',
      softPhrase:
          'Aprecio nuestra relación, pero tengo como regla personal no hacer préstamos económicos / de objetos personales.',
      assertivePhrase:
          'No puedo prestarte eso. Por principio y tranquilidad personal no hago este tipo de préstamos.',
      firmPhrase:
          'No voy a prestarte mi dinero/vehículo/pertenencia. Es un límite inamovible.',
      bodyLanguage:
          'Contacto visual sobrio, sin balanceos corporales ni sonrisas culpables.',
      whatNotToDo:
          'No digas "es que ahora no tengo dinero", porque cuando descubran que tienes algo volverán a pedirte. El límite es tu criterio, no tu liquidez.',
    ),

    // ==========================================
    // ÁMBITO CONSENTIMIENTO Y SALIDA AIROSA
    // ==========================================
    SocialScript(
      id: 'consent_check_in',
      title: 'Comprobar si el otro cede por compromiso o si quiere participar',
      category: SocialScriptCategory.consent,
      contextDescription:
          'Invitas a alguien a un plan o pides un favor y notas una respuesta vacilante, pausada o poco entusiasta.',
      softPhrase:
          'Noto que quizás tienes la agenda llena o prefieres descansar. Te lo planteo con total tranquilidad: si no te viene bien, no hay problema y lo dejamos para otra vez.',
      assertivePhrase:
          'No quiero ponerte en un apuro. Si estás dudando o prefieres no hacerlo, dímelo con confianza; valoro mucho más tu comodidad que el plan.',
      firmPhrase:
          'Prefiero no avanzar si no te apetece al 100%. Descansemos ambos hoy y ya coordinaremos en otro momento con calma.',
      bodyLanguage:
          'Da un paso atrás físicamente o reclínate en la silla para quitar presión espacial. Sonrisa comprensiva y relajada.',
      whatNotToDo:
          'No digas "¡Vamos, anímate, no seas aburrido!". La presión emocional fuerza el sí de apaciguamiento y deteriora la confianza a largo plazo.',
    ),
    SocialScript(
      id: 'consent_stop_insisting',
      title: 'Frenar tu propia insistencia ante una respuesta tibia ajena',
      category: SocialScriptCategory.consent,
      contextDescription:
          'Le has propuesto algo a alguien y te responde con un "bueno... puede ser" o "a ver cómo estoy de tiempo".',
      softPhrase:
          'No te preocupes por responder ahora. Si ves que se complica, no le des vueltas, asumimos que no y no pasa nada.',
      assertivePhrase:
          'Entiendo que quizás no sea el mejor momento. Lo dejamos sin efecto por ahora para que no tengas ese pendiente encima.',
      firmPhrase:
          'Noto que no te viene bien en este momento. Retiro la propuesta para tu tranquilidad y retomamos cuando tú tengas disponibilidad real.',
      bodyLanguage:
          'Asiente con la cabeza en señal de aceptación serena, cierra el tema y cambia de conversación de inmediato.',
      whatNotToDo:
          'No insistas con "pero solo será un momento". Si la respuesta no es clara, pregunta una vez o deja la propuesta para otro momento.',
    ),
    SocialScript(
      id: 'consent_physical_boundary',
      title:
          'Consultar antes de invadir espacio personal o realizar contacto físico',
      category: SocialScriptCategory.consent,
      contextDescription:
          'Quieres saludar a alguien, acercarte o tocar su hombro en una conversación y deseas asegurarte de que se sienta cómodo.',
      softPhrase:
          '¿Te parece bien un saludo de abrazo o prefieres de mano o puño? Como estés más cómodo/a.',
      assertivePhrase:
          '¿Te incomoda si me siento a tu lado / revisamos esto juntos en tu pantalla?',
      firmPhrase:
          'Dime con total confianza si en cualquier momento necesitas más espacio físico o distancia, sin ninguna pena.',
      bodyLanguage:
          'Deja una distancia cómoda y pregunta antes de acercarte o tocar. La preferencia de espacio y el modo de comunicarla varían entre personas.',
      whatNotToDo:
          'No todas las personas se sienten cómodas con el contacto físico. Pregunta antes de tocar a alguien; puede preferir que no lo hagas por muchas razones.',
    ),

    // ==========================================
    // REUNIONES Y TRABAJO REMOTO (ADICIONALES)
    // ==========================================
    SocialScript(
      id: 'work_meeting_ended',
      title: 'Preguntar si la reunión concluyó o hay puntos pendientes',
      category: SocialScriptCategory.work,
      contextDescription:
          'La reunión parece haber terminado pero la gente sigue hablando de temas triviales y no sabes si tienes permiso para desconectarte o salir.',
      softPhrase:
          '¿Hay algún otro punto de la agenda que necesitemos revisar juntos, o podemos dar la sesión por concluida?',
      assertivePhrase:
          'Si los temas principales ya quedaron acordados, me retiro para avanzar con los entregables pactados. ¡Buen día a todos!',
      firmPhrase:
          'Tengo que iniciar mi siguiente bloque de trabajo concentrado. Si no hay más temas operativos, me desconecto ahora.',
      bodyLanguage:
          'En videollamada, levanta levemente la mano o asiente con sonrisa cordial antes de salir. En presencial, recoge tus notas con calma.',
      whatNotToDo:
          'No te quedes esperando en silencio 15 minutos por miedo a parecer descortés; los cierres respetuosos demuestran profesionalismo y gestión del tiempo.',
    ),
    SocialScript(
      id: 'work_written_instructions',
      title:
          'Solicitar instrucciones por escrito para evitar sobrecarga auditiva',
      category: SocialScriptCategory.work,
      contextDescription:
          'Te dan muchas instrucciones seguidas y te cuesta recordarlas. Quieres pedirlas por escrito.',
      softPhrase:
          'Muchas gracias por el detalle. Para asegurarme de no pasar por alto ningún punto crítico, ¿te importaría enviarme esa lista en un correo breve o mensaje?',
      assertivePhrase:
          'Proceso mucho mejor la información con especificaciones por escrito. Por favor, compárteme los requerimientos por correo para comenzar la ejecución.',
      firmPhrase:
          'Para evitar malentendidos y garantizar exactitud en la entrega, requiero recibir las especificaciones técnicas por escrito antes de empezar.',
      bodyLanguage:
          'Ten a mano un bloc de notas o teclado. Asiente de forma pausada y mantén contacto visual neutro.',
      whatNotToDo:
          'No asientas fingiendo que comprendiste todo para salir del paso si tu mente se saturó. Pedir soporte escrito es un ajuste razonable de trabajo.',
    ),
    SocialScript(
      id: 'work_camera_fatigue',
      title: 'Desactivar la cámara en videollamada por fatiga sensorial',
      category: SocialScriptCategory.work,
      contextDescription:
          'Llevas varias videollamadas consecutivas y el estímulo visual de las pantallas y el contacto forzado te está agotando sensorialmente.',
      softPhrase:
          'Voy a desactivar mi cámara unos minutos para mejorar la conexión y descansar la vista, pero sigo completamente atento a la conversación.',
      assertivePhrase:
          'Desactivaré mi cámara durante esta parte de la reunión para reducir la fatiga visual. Participaré por audio activamente.',
      firmPhrase:
          'Por motivos de descanso sensorial permaneceré con la cámara apagada. Cuenten conmigo por el micrófono.',
      bodyLanguage:
          'Comunícalo por el chat de la llamada o con tono de voz sereno y seguro al inicio de tu intervención.',
      whatNotToDo:
          'No apagues la cámara bruscamente en silencio sin avisar si la norma del equipo es tenerla encendida; un aviso previo de 5 segundos elimina cualquier suspicacia.',
    ),

    // ==========================================
    // FAMILIA Y VÍNCULOS CERCANOS (LÍMITES)
    // ==========================================
    SocialScript(
      id: 'sensory_decompression_alone',
      title: 'Pedir un rato a solas para descansar',
      category: SocialScriptCategory.sensory,
      contextDescription:
          'Llegas a casa tras un día agotador y necesitas descansar antes de atender preguntas o peticiones.',
      softPhrase:
          'Te quiero mucho y me alegra verte. Ahora me cuesta atender preguntas; necesito un rato a solas y en silencio. Después podemos ver si me viene bien conversar.',
      assertivePhrase:
          'Estoy saturado/a sensorialmente y necesito recargarme. Voy a estar en la habitación a solas media hora; por favor no entres a menos que sea una emergencia.',
      firmPhrase:
          'Ahora mismo no puedo interactuar ni procesar preguntas sin colapsar. Necesito espacio y silencio absoluto de inmediato.',
      bodyLanguage:
          'Voz suave pero firme, manos a los costados sin tensión combativa, mirada afectuosa antes de retirarte al espacio seguro.',
      whatNotToDo:
          'Si te cuesta continuar, puedes pedir una pausa. La irritabilidad puede tener distintas causas y no permite atribuir culpa por no haber comunicado una necesidad antes.',
    ),
    SocialScript(
      id: 'sensory_medical_dentist_touch',
      title: 'Pedir que te avisen antes de tocarte',
      category: SocialScriptCategory.sensory,
      contextDescription:
          'Vas a una consulta médica, dental o peluquería. Los ruidos fuertes o que te toquen sin avisar pueden resultarte muy molestos.',
      softPhrase:
          'Me incomoda que me toquen sin avisar. ¿Puede decirme qué va a hacer y esperar un momento antes de tocarme?',
      assertivePhrase:
          'Tengo sensibilidad táctil y auditiva intensa. Necesito que me explique qué instrumento usará antes de aplicarlo y acordemos una señal para pausar si me saturo.',
      firmPhrase:
          'Necesito que me avise antes de tocarme. Si levanto la mano izquierda, por favor pare.',
      bodyLanguage:
          'Establece este acuerdo antes de que el profesional inicie cualquier maniobra, sentado derecho y hablando con tranquilidad.',
      whatNotToDo:
          'No te aguantes el dolor o el sobresalto en silencio; los profesionales de salud agradecen las instrucciones claras de manejo del paciente.',
    ),

    // ==========================================
    // INTERACCIÓN SOCIAL Y CONVERSACIONES
    // ==========================================
    SocialScript(
      id: 'social_infodumping_check',
      title: 'Comprobar si estás monopolizando la conversación (infodumping)',
      category: SocialScriptCategory.social,
      contextDescription:
          'Estás compartiendo tu tema de interés especial con entusiasmo y notas que la otra persona ha dejado de hablar o asiente mecánicamente.',
      softPhrase:
          'Me apasiona mucho este tema y a veces me extiendo sin darme cuenta. Dime con total confianza si prefieres que cambiemos de tema o si quieres comentar algo.',
      assertivePhrase:
          'He estado hablando yo solo durante varios minutos. Hagamos una pausa: ¿cómo lo ves tú o qué te gustaría conversar hoy?',
      firmPhrase:
          'Voy a frenar aquí para no saturarte con tantos datos técnicos. Cuéntame tú qué novedades tienes.',
      bodyLanguage:
          'Haz una pausa completa de silencio. Abre las palmas hacia arriba invitando a la otra persona a tomar la palabra.',
      whatNotToDo:
          'No tienes que sentir vergüenza por hablar de lo que te gusta. Haz una pausa y pregunta si la otra persona quiere seguir con ese tema.',
    ),
    SocialScript(
      id: 'social_graceful_exit',
      title: 'Cierre cordial y salida airosa de una conversación informal',
      category: SocialScriptCategory.social,
      contextDescription:
          'Estás hablando con alguien en un pasillo o evento y sientes que la charla ya cumplió su ciclo y quieres continuar con tu día.',
      softPhrase:
          '¡Ha sido estupendo ponernos al día! Te dejo para que sigas con tus cosas y yo voy a avanzar con mis pendientes. ¡Un abrazo!',
      assertivePhrase:
          'Me ha gustado mucho esta conversación. Tengo que marcharme ahora para atender un pendiente. ¡Hablamos pronto!',
      firmPhrase:
          'Debo cortar aquí porque se me hace tarde para mi siguiente actividad. Que tengas un excelente día.',
      bodyLanguage:
          'Gira tu torso y pies levemente hacia la dirección a la que vas a caminar antes de pronunciar la frase. Sonrisa breve y despedida con la mano.',
      whatNotToDo:
          'No te quedes atrapado en silencios incómodos esperando a que el otro adivine que quieres marcharte; los cierres claros son liberadores para ambas partes.',
    ),

    // ==========================================
    // PRESIÓN FAMILIAR
    // ==========================================
    SocialScript(
      id: 'pressure_family_interrogation',
      title: 'Frenar preguntas invasivas de familiares en reuniones',
      category: SocialScriptCategory.pressure,
      contextDescription:
          'En un almuerzo o cena familiar te interrogan con insistencia sobre pareja, dinero, empleo o decisiones personales íntimas.',
      softPhrase:
          'Agradezco tu interés, pero hoy prefiero desconectar de ese tema y disfrutar de la comida con todos. ¿Cómo va tu proyecto de [tema del familiar]?',
      assertivePhrase:
          'Es un tema personal que prefiero no discutir en esta mesa. Respetemos este espacio para compartir tranquilos.',
      firmPhrase:
          'Ya he dicho que no voy a hablar de ese asunto. Si insistes, tendré que levantarme y retirarme de la mesa.',
      bodyLanguage:
          'Mantén los cubiertos apoyados en el plato. No bajes la cabeza; mira a los ojos con expresión serena y cambia el foco de inmediato.',
      whatNotToDo:
          'No te justifiques ni des detalles para intentar que "lo entiendan"; en dinámicas familiares invasivas, las justificaciones se usan como combustible para más debate.',
    ),
    ...SocialScriptsExpansion.scripts,
  ];

  static List<SocialScript> getByCategory(SocialScriptCategory category) {
    return scripts.where((s) => s.category == category).toList();
  }
}
