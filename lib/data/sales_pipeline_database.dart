import 'package:flutter/material.dart';
import '../models/sales_phase_item.dart';

class SalesPipelineDatabase {
  static const List<SalesPhaseItem> phases = [
    // ==========================================
    // FASE 1: ENTRADA Y RAPPORT
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 1,
      title: 'Entrada, Espacio y Rapport Inicial',
      timing: 'Minutos 0 a 5',
      objective:
          'Romper la tensión inicial, establecer estatus equitativo y generar seguridad mutua sin invadir el espacio personal.',
      icon: Icons.handshake_rounded,
      clientSignalsToWatch: [
        'Orientación de los hombros hacia ti (apertura) vs orientados a la pantalla de su laptop (frialdad).',
        'Saludo de manos firme y seco con contacto visual de 2 segundos vs mano blanda o mirada evasiva.',
        'Espacio personal despejado: retiran objetos entre ambos o colocan carpetas como barrera física defensiva.',
      ],
      yourBodyLanguage: [
        'Adopta una posición en la mesa en ángulo de 90° (esquina cooperativa) si es posible, evitando el enfrentamiento frontal de poder.',
        'Coloca ambas manos visibles y relajadas sobre la superficie de la mesa.',
        'Mantén la espalda recta pero apoyada, respirando hondo con el diafragma antes de cruzar la puerta.',
      ],
      keyRule:
          'Nunca intentes vender ni hables de producto en los primeros 3 minutos. El cerebro reptiliano del comprador primero evalúa si eres una amenaza o un aliado.',
    ),

    // ==========================================
    // FASE 2: PRESENTACIÓN Y CALIBRACIÓN DE INTERÉS
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 2,
      title: 'Presentar y comprobar si hay preguntas',
      timing: 'Minutos 5 a 20',
      objective:
          'Explica la propuesta y pregunta si la persona quiere más detalles, necesita tiempo o prefiere parar.',
      icon: Icons.present_to_all_rounded,
      clientSignalsToWatch: [
        '🟢 Interés activo: Inclinación del torso hacia adelante, cejas ligeramente elevadas y asentimientos lentos.',
        '🟡 Evaluación interna: Mano en la barbilla o acariciando la mandíbula mientras analiza tus datos.',
        '🔴 Desconexión o prisa: Tamborileo de dedos en la mesa, pies apuntando hacia la puerta o miradas al reloj/teléfono.',
      ],
      yourBodyLanguage: [
        'Gesticula a la altura del pecho con palmas abiertas hacia arriba en los puntos de mayor valor.',
        'Haz una pausa después de explicar algo importante. Da tiempo para pensar y preguntar.',
        'Adapta tu velocidad de habla y volumen al ritmo del cliente (ajuste respetuoso a las preferencias de la otra persona).',
      ],
      keyRule:
          'Si notas señales de desconexión (pies hacia la puerta o reloj), jamás aceleres tu discurso. Detente en seco y haz una pregunta abierta: "¿Hasta este punto, cómo encaja esto con lo que tenían en mente?"',
    ),

    // ==========================================
    // FASE 3: PRECIO Y MANEJO DE OBJECIONES
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 3,
      title: 'Revelación de Precio y Manejo de Objeciones',
      timing: 'Minutos 20 a 35',
      objective:
          'Presentar la inversión con serenidad inamovible, sostener las objeciones sin justificarse y desarmar la resistencia con preguntas.',
      icon: Icons.monetization_on_rounded,
      clientSignalsToWatch: [
        'Brazos cruzados a la altura del pecho y cuerpo reclinado hacia atrás (escudo presupuestario o cautela).',
        'Labios comprimidos en línea delgada o frotarse la nuca / puente de la nariz (procesamiento de estrés).',
        'Gesto facial breve de escepticismo (comisura de los labios asimétrica o ceño fruncido).',
      ],
      yourBodyLanguage: [
        'Apoya la espalda en el respaldo de la silla, proyectando solidez y confianza en el valor de tu trabajo.',
        'Da la cifra económica exacta con entonación descendente (tono de afirmación, nunca interrogativo).',
        'Guarda silencio absoluto durante al menos 3 a 5 segundos inmediatamente después de decir el precio.',
      ],
      keyRule:
          'El primero que habla después de revelar la cifra económica pierde margen de negociación. El silencio demuestra que no tienes miedo a tu propio precio.',
    ),

    // ==========================================
    // FASE 4: SEÑALES DE CIERRE Y SILENCIO TÁCTICO
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 4,
      title: 'Señales de Cierre y Silencio Táctico',
      timing: 'Minutos 35 a 45',
      objective:
          'Detectar las microseñales de compra cuando ocurren, proponer el siguiente paso y dejar de vender para no sabotear el acuerdo.',
      icon: Icons.check_circle_outline_rounded,
      clientSignalsToWatch: [
        '🟢 Señales de sintonía e interés: Inclinación hacia la propuesta escrita, atención sostenida, asentimiento y preguntas de detalle.',
        '🟢 Preguntas de posesión psicológica: "¿En cuánto tiempo estaría implementado?" o "¿Cómo coordinaríamos el soporte técnico?".',
        '🟢 Relajación de hombros tras la tensión de la negociación de costos.',
      ],
      yourBodyLanguage: [
        'Acerca con calma la propuesta o el contrato hacia el centro del espacio compartido.',
        'Asiente suavemente con una sonrisa sobria y cálida.',
        'Cierra la libreta o deja el bolígrafo sobre la mesa para comunicar que la presentación terminó y estamos en fase de acuerdo.',
      ],
      keyRule:
          'En cuanto el prospecto formule una pregunta de posesión o dé señales claras de compra, calla de inmediato. Muchos tratos se caen porque el vendedor sigue argumentando cuando el cliente ya estaba listo para firmar.',
    ),
  ];

  static const List<SalesObjectionScript> objections = [
    // 1. OBJECIÓN DE PRECIO
    SalesObjectionScript(
      id: 'obj_price_too_high',
      title: 'Objeción: "Su propuesta está por encima de nuestro presupuesto"',
      objectionPhrase:
          'Es demasiado costoso para nosotros / supera el presupuesto asignado.',
      context:
          'El cliente busca medir tu seguridad para forzar un descuento inmediato.',
      softResponse:
          'Comprendo perfectamente que el presupuesto sea un criterio clave. Si comparamos esta inversión con el costo del problema que resolveremos, ¿qué aspecto siente que no termina de amortizarse?',
      assertiveResponse:
          'Entiendo la cautela presupuestaria. Nuestra tarifa refleja la garantía del resultado. Si necesitamos llegar a esa cifra exacta, tendríamos que reducir el alcance o las fases entregables.',
      firmResponse:
          'Ese es el costo establecido para asegurar este nivel de entrega. Si el presupuesto actual es rígido e inamovible, podemos posponer el proyecto o evaluar una versión básica reducida.',
      bodyLanguage:
          'No asientas con la cabeza mientras te quejan del precio. Mantén la mirada directa y relajada sin tragar saliva bruscamente.',
      whatNotToDo:
          'Nunca digas "¿cuánto tienes?" ni te disculpes por tu precio; bajar la tarifa de inmediato sin reducir el alcance destruye tu credibilidad técnica.',
    ),

    // 2. OBJECIÓN DE LA COMPETENCIA
    SalesObjectionScript(
      id: 'obj_competitor_cheaper',
      title: 'Objeción: "La competencia me ofrece lo mismo por la mitad"',
      objectionPhrase:
          'Otras empresas me ofrecen exactamente lo mismo a un costo mucho menor.',
      context:
          'Comparación artificial para presionar o evaluar si conoces tu valor diferencial.',
      softResponse:
          'Es comprensible que existan opciones con diferentes tarifas en el mercado. En nuestra experiencia, la diferencia suele estar en la cobertura del soporte y la confiabilidad operativa final.',
      assertiveResponse:
          'Conocemos el mercado y respetamos a otros colegas. Si la alternativa más económica cubriera el estándar que su operación exige, probablemente ya la habrían contratado. ¿Qué dudas les hicieron venir a consultarnos a nosotros?',
      firmResponse:
          'No competimos en precio sino en resultados y estabilidad. Si su criterio determinante exclusivo es el menor costo unitario, nuestra propuesta no es la opción adecuada para ustedes.',
      bodyLanguage:
          'Sonrisa tranquila y leve. Manos abiertas sobre la mesa. Postura corporal sin signos de molestia o defensa.',
      whatNotToDo:
          'No descalifiques ni hables mal de la competencia; hacerlo te hace lucir inseguro y poco profesional.',
    ),

    // 3. OBJECIÓN DE POSTERGACIÓN
    SalesObjectionScript(
      id: 'obj_need_to_think',
      title: 'Objeción: "Tenemos que pensarlo y consultarlo con los socios"',
      objectionPhrase:
          'Lo vemos interesante, pero necesitamos revisarlo internamente y te avisamos.',
      context:
          'Descarte educado o falta de claridad para tomar una decisión en la reunión.',
      softResponse:
          'Me parece muy prudente que lo revisen en equipo. Para asegurar que tengan todo lo necesario, ¿qué dudas o riesgos anticipas que podrían plantear tus socios?',
      assertiveResponse:
          'Totalmente de acuerdo. Generalmente cuando alguien necesita pensarlo suele haber una inquietud con el plazo o la inversión. Con total franqueza, ¿cuál de los dos aspectos genera más reservas?',
      firmResponse:
          'Por supuesto. Agendemos ahora mismo una llamada de 10 minutos para el próximo [día] a las [hora] para conocer su resolución definitiva y no enviar correos innecesarios.',
      bodyLanguage:
          'Abre tu agenda o libreta con tranquilidad, sin prisa pero con formalidad ejecutiva.',
      whatNotToDo:
          'No te despidas con un "está bien, quedo a la espera de que me escriban". El 80% de los "te avisamos" terminan en el olvido.',
    ),

    // 4. EL SILENCIO INCÓMODO DEL COMPRADOR
    SalesObjectionScript(
      id: 'obj_awkward_silence',
      title: 'Táctica: El Comprador guarda silencio sepulcral tras el precio',
      objectionPhrase:
          '[Silencio total durante 10 segundos mirando tu propuesta sin hablar]',
      context:
          'Técnica clásica de compras: usan el silencio para que el vendedor se sienta incómodo y empiece a regalar descuentos solo para romper la tensión.',
      softResponse:
          '[Mantener el silencio con serenidad durante 8 segundos. Luego preguntar]: "¿Cómo resuena esa cifra con las expectativas del área?"',
      assertiveResponse:
          '[Sostener la mirada relajada, respirar hondo y NO decir una sola palabra hasta que el cliente hable primero].',
      firmResponse:
          '[Esperar pacientemente con postura abierta. Cuando el cliente pregunte algo, responder con calma y brevedad].',
      bodyLanguage:
          'No toques tu rostro, no bebas agua apresuradamente ni consultes tu reloj. Espalda firme, manos quietas.',
      whatNotToDo:
          '¡LA REGLA DE ORO! No rompas el silencio diciendo: "...pero si es mucho podemos arreglarlo". Quien cede ante el silencio regala su margen.',
    ),

    // 5. PRESIÓN POR DESCUENTO DE ÚLTIMA HORA
    SalesObjectionScript(
      id: 'obj_discount_pressure',
      title: 'Objeción: "Si me haces un 15% de descuento firmamos hoy mismo"',
      objectionPhrase:
          'Me gusta la propuesta, pero si quieres que cerremos ahora mismo tienes que bajar un 15%.',
      context:
          'Intento de cierre condicionado por poder o hábito de compra agresivo.',
      softResponse:
          'Agradezco la intención de cerrar hoy. Para ajustar un 15%, ¿qué funcionalidad o módulo de la entrega sugerirías que retiremos del alcance?',
      assertiveResponse:
          'Nuestro precio no tiene sobreprecios inflados para hacer rebajas artificiales. No puedo modificar la tarifa, pero sí podemos acordar condiciones de pago en dos cuotas para aliviar el flujo de caja.',
      firmResponse:
          'El valor de la solución es el presentado. Si la decisión de trabajar juntos depende de reducir un 15% los honorarios, no podremos avanzar.',
      bodyLanguage:
          'Inclinación hacia adelante manteniendo contacto visual neutro, negando suavemente con la cabeza una sola vez.',
      whatNotToDo:
          'Nunca aceptes un descuento a cambio de nada. Toda concesión económica debe ir acompañada de una retirada de alcance o de una contraprestación equivalente.',
    ),

    // 6. PROVEEDOR ACTUAL ESTABLECIDO
    SalesObjectionScript(
      id: 'obj_already_have_supplier',
      title: 'Objeción: "Ya trabajamos con un proveedor y estamos satisfechos"',
      objectionPhrase:
          'Ya tenemos a alguien que nos hace este servicio desde hace años.',
      context: 'Resistencia al cambio y lealtad con su proveedor vigente.',
      softResponse:
          'Es excelente que cuenten con un proveedor confiable, eso demuestra que valoran la estabilidad en sus operaciones.',
      assertiveResponse:
          'No pretendemos que sustituyan a su proveedor actual. Muchas empresas trabajan con nosotros como respaldo para proyectos críticos o de segunda opinión. ¿Habría espacio para hacer una prueba piloto pequeña?',
      firmResponse:
          'Comprendo. Si en algún momento ese proveedor no tiene capacidad o necesitan una alternativa ágil para un requerimiento urgente, aquí tienen mi tarjeta directa.',
      bodyLanguage:
          'Asentimiento de reconocimiento profesional. No invasivo, guardando respeto al canal existente.',
      whatNotToDo:
          'No intentes convencerlo de que su proveedor actual es malo. La gente defiende a sus proveedores porque cambiarlos implica riesgo personal de equivocarse.',
    ),
  ];
}
