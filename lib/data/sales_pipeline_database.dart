import 'package:flutter/material.dart';
import '../models/sales_phase_item.dart';

class SalesPipelineDatabase {
  static const List<SalesPhaseItem> phases = [
    // ==========================================
    // FASE 1: ENTRADA Y RAPPORT
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 1,
      title: 'Saludo y primera conversación',
      timing: 'Inicio de la conversación',
      objective:
          'Saluda con respeto, deja espacio personal y permite que ambas personas se sientan cómodas.',
      icon: Icons.handshake_rounded,
      clientSignalsToWatch: [
        'La persona mira hacia ti o hacia su pantalla. Pregunta si es buen momento para conversar.',
        'Pregunta cómo prefiere saludar; no evalúes confianza por la presión de la mano ni por la mirada.',
        'Comprueba si los objetos permiten ver el material y conversar con comodidad.',
      ],
      yourBodyLanguage: [
        'Acuerden dónde sentarse para ver el material y respetar el espacio de ambos.',
        'Coloca las manos donde te resulte cómodo y deja espacio para el material compartido.',
        'Elige una postura cómoda; puedes pedir tiempo para prepararte antes de empezar.',
      ],
      keyRule:
          'No hay una regla de tiempo para todas las reuniones. Saluda, pregunta qué necesita la persona y escucha antes de presentar tu propuesta.',
    ),

    // ==========================================
    // FASE 2: PRESENTACIÓN Y CALIBRACIÓN DE INTERÉS
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 2,
      title: 'Explicar la propuesta y escuchar',
      timing: 'Cuando acuerden revisar la propuesta',
      objective:
          'Explica la propuesta y pregunta si la persona quiere más detalles, necesita tiempo o prefiere parar.',
      icon: Icons.present_to_all_rounded,
      clientSignalsToWatch: [
        'La persona hace preguntas o pide más detalles. Pregunta si quiere continuar.',
        'La persona guarda silencio o mira a otro lado. Puede estar pensando o atendiendo otra cosa.',
        'La persona mira la hora o dice que tiene prisa. Pregunta si prefiere seguir en otro momento.',
      ],
      yourBodyLanguage: [
        'Puedes usar gestos, texto o ejemplos si ayudan a explicar, sin una postura obligatoria.',
        'Haz una pausa después de explicar algo importante. Da tiempo para pensar y preguntar.',
        'Habla a un ritmo cómodo y pregunta si quiere que repitas o aclares algo.',
      ],
      keyRule:
          'Si no sabes si la persona quiere continuar, pregúntale: "¿Quieres que siga o prefieres dejarlo para otro momento?"',
    ),

    // ==========================================
    // FASE 3: PRECIO Y MANEJO DE OBJECIONES
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 3,
      title: 'Hablar del precio y responder dudas',
      timing: 'Cuando corresponda hablar del precio',
      objective:
          'Di el precio con claridad. Escucha las dudas y responde sin presionar.',
      icon: Icons.monetization_on_rounded,
      clientSignalsToWatch: [
        'Los brazos cruzados o reclinarse pueden tener muchas causas. Pregunta qué piensa del precio.',
        'La persona aprieta los labios o se toca el cuello. Describe el movimiento sin atribuir estrés.',
        'Un cambio de expresión no identifica una objeción. Deja espacio para que la persona la comunique.',
      ],
      yourBodyLanguage: [
        'Si te resulta cómodo, usa el respaldo. Explica el alcance y las condiciones; la postura no acredita el valor del trabajo.',
        'Explica el precio y qué incluye con un tono que te resulte cómodo; ofrece la información por escrito.',
        'Da tiempo para pensar y pregunta si necesita aclaraciones; el tiempo de pausa se adapta a la conversación.',
      ],
      keyRule:
          'Después de decir el precio, deja tiempo para pensar. El silencio no permite saber qué piensa la persona; puedes preguntarle si quiere aclarar algo.',
    ),

    // ==========================================
    // FASE 4: SEÑALES DE CIERRE Y SILENCIO TÁCTICO
    // ==========================================
    SalesPhaseItem(
      phaseNumber: 4,
      title: 'Acordar los próximos pasos',
      timing: 'Al acordar el siguiente paso',
      objective:
          'Pregunta si la persona quiere avanzar, necesita más tiempo o prefiere dejarlo aquí.',
      icon: Icons.check_circle_outline_rounded,
      clientSignalsToWatch: [
        'Las preguntas pueden mostrar interés, pero no confirman una decisión.',
        'Pregunta si quiere revisar algún detalle o recibir la propuesta por escrito.',
        'Los gestos no permiten saber con seguridad si la persona aceptará.',
      ],
      yourBodyLanguage: [
        'Acerca con calma la propuesta o el contrato hacia el centro del espacio compartido.',
        'Escucha la respuesta sin exigir ni forzar sonrisa, mirada o asentimiento.',
        'Pregunta qué decisión desea tomar y confirma el siguiente paso con palabras.',
      ],
      keyRule:
          'Una pregunta o un gesto no confirman una compra. Pregunta qué decisión quiere tomar la persona y respeta su respuesta.',
    ),
  ];

  static const List<SalesObjectionScript> objections = [
    // 1. OBJECIÓN DE PRECIO
    SalesObjectionScript(
      id: 'obj_price_too_high',
      title: 'Duda: "Su propuesta está por encima de nuestro presupuesto"',
      objectionPhrase:
          'Es demasiado costoso para nosotros / supera el presupuesto asignado.',
      context:
          'La persona comunica un límite de presupuesto o considera alto el precio. Pregunta qué puede revisar; no presupongas una estrategia de presión.',
      softResponse:
          "Entiendo que el presupuesto sea un límite. ¿Quieres revisar qué incluye la propuesta, valorar un alcance menor o dejarlo para otro momento?",
      assertiveResponse:
          'Entiendo la cautela presupuestaria. Nuestra tarifa corresponde al alcance y a las condiciones de la propuesta. Si necesitamos llegar a esa cifra exacta, tendríamos que reducir el alcance o las fases entregables.',
      firmResponse:
          'Ese es el costo establecido para asegurar este nivel de entrega. Si el presupuesto actual es rígido e inamovible, podemos posponer el proyecto o evaluar una versión básica reducida.',
      bodyLanguage:
          'Escucha la respuesta y adopta una postura cómoda. No necesitas controlar la mirada, la sonrisa ni movimientos involuntarios para explicar tu precio.',
      whatNotToDo:
          "Evita presionar para que la persona revele su presupuesto o cuestione su propio límite. Explica qué puedes ofrecer y con qué condiciones.",
    ),

    // 2. OBJECIÓN DE LA COMPETENCIA
    SalesObjectionScript(
      id: 'obj_competitor_cheaper',
      title: 'Duda: "La competencia me ofrece lo mismo por la mitad"',
      objectionPhrase:
          'Otras empresas me ofrecen exactamente lo mismo a un costo mucho menor.',
      context:
          'La persona compara precios. Verifica si las propuestas tienen el mismo alcance antes de valorar la diferencia.',
      softResponse:
          "Si te sirve, podemos comparar lo que incluye cada propuesta. No sabemos si la diferencia corresponde al alcance, al soporte o a otros factores.",
      assertiveResponse:
          'Conocemos el mercado y respetamos a otros colegas. Podemos comparar el alcance, las condiciones y el soporte de ambas propuestas. ¿Qué criterios les interesa revisar?',
      firmResponse:
          'No competimos en precio sino en resultados y estabilidad. Si su criterio determinante exclusivo es el menor costo unitario, nuestra propuesta no es la opción adecuada para ustedes.',
      bodyLanguage:
          "Usa una postura y un tono cómodos. No necesitas forzar una sonrisa, mostrar las palmas ni ocultar movimientos para explicar una diferencia.",
      whatNotToDo:
          "No atribuyas mala calidad a otra propuesta por su precio. Compara información comprobable y respeta la decisión.",
    ),

    // 3. OBJECIÓN DE POSTERGACIÓN
    SalesObjectionScript(
      id: 'obj_need_to_think',
      title: 'Duda: "Tenemos que pensarlo y consultarlo con los socios"',
      objectionPhrase:
          'Lo vemos interesante, pero necesitamos revisarlo internamente y te avisamos.',
      context:
          'La persona pide tiempo para revisar la propuesta. No sabemos si aceptará ni por qué necesita esperar.',
      softResponse:
          'Me parece muy prudente que lo revisen en equipo. Para asegurar que tengan todo lo necesario, ¿qué dudas o riesgos anticipas que podrían plantear tus socios?',
      assertiveResponse:
          "Claro. ¿Hay información que les ayudaría a revisarlo? También podemos dejarles tiempo y acordar si quieren seguimiento.",
      firmResponse:
          "De acuerdo. ¿Prefieren contactarme cuando hayan decidido o quieren acordar una llamada? Pueden necesitar más tiempo sin dar una resolución definitiva en una fecha impuesta.",
      bodyLanguage:
          'Abre tu agenda o libreta con tranquilidad, sin prisa pero con formalidad ejecutiva.',
      whatNotToDo:
          'Evita fijar seguimientos sin acordarlos. Pregunta si quiere que le escribas, por qué canal y cuándo; respeta si prefiere contactarte por su cuenta.',
    ),

    // 4. EL SILENCIO INCÓMODO DEL COMPRADOR
    SalesObjectionScript(
      id: 'obj_awkward_silence',
      title: 'La persona guarda silencio después del precio',
      objectionPhrase:
          '[Silencio total durante 10 segundos mirando tu propuesta sin hablar]',
      context:
          'El silencio puede tener muchas causas. Dale tiempo a la persona para pensar y luego pregunta si quiere aclarar algo.',
      softResponse:
          '[Dale un momento y pregunta]: "¿Qué te parece el precio? ¿Quieres que aclare algo?"',
      assertiveResponse:
          '[Espera con calma. No hace falta sostener la mirada; puedes preguntar si necesita tiempo].',
      firmResponse:
          '[Dale tiempo para pensar. Responde sus preguntas y acepta si quiere decidir después].',
      bodyLanguage:
          'Puedes hacer una pausa, beber agua o moverte si lo necesitas. Mantén disponible la información y permite que la persona piense.',
      whatNotToDo:
          'No supongas que el silencio es una táctica ni ofrezcas un descuento sin que te lo pidan. Pregunta qué necesita la persona.',
    ),

    // 5. PRESIÓN POR DESCUENTO DE ÚLTIMA HORA
    SalesObjectionScript(
      id: 'obj_discount_pressure',
      title: 'Duda: "Si me haces un 15% de descuento, firmamos hoy mismo"',
      objectionPhrase:
          'Me gusta la propuesta, pero si quieres que cerremos ahora mismo tienes que bajar un 15%.',
      context:
          'La persona condiciona la compra a un descuento. Puedes explicar tus condiciones y decidir si puedes ofrecerlo.',
      softResponse:
          'Agradezco la intención de cerrar hoy. Para ajustar un 15%, ¿qué funcionalidad o módulo de la entrega sugerirías que retiremos del alcance?',
      assertiveResponse:
          'Nuestro precio no tiene sobreprecios inflados para hacer rebajas artificiales. No puedo modificar la tarifa, pero sí podemos acordar condiciones de pago en dos cuotas para aliviar el flujo de caja.',
      firmResponse:
          'El valor de la solución es el presentado. Si la decisión de trabajar juntos depende de reducir un 15% los honorarios, no podremos avanzar.',
      bodyLanguage:
          "Explica con palabras si puedes ofrecer el descuento y en qué condiciones. No necesitas sostener la mirada ni hacer un gesto particular para marcar ese límite.",
      whatNotToDo:
          "No prometas un descuento que no puedas sostener. Puedes mantener el precio, ofrecer otras condiciones o aceptar una rebaja si encaja con tus criterios; no existe una única regla de negociación.",
    ),

    // 6. PROVEEDOR ACTUAL ESTABLECIDO
    SalesObjectionScript(
      id: 'obj_already_have_supplier',
      title: 'Duda: "Ya trabajamos con un proveedor y estamos satisfechos"',
      objectionPhrase:
          'Ya tenemos a alguien que nos hace este servicio desde hace años.',
      context:
          'La persona dice que tiene proveedor. Pregunta si desea revisar alternativas y respeta si no le interesa.',
      softResponse:
          "Gracias por aclararlo. Si están satisfechos, lo respeto. ¿Quieren conocer una alternativa o prefieren que dejemos la conversación aquí?",
      assertiveResponse:
          "Si necesitan una alternativa para un proyecto concreto, podemos revisar si nuestra propuesta encaja. ¿Les interesa hacerlo?",
      firmResponse:
          'Comprendo. Si en algún momento ese proveedor no tiene capacidad o necesitan una alternativa ágil para un requerimiento urgente, aquí tienen mi tarjeta directa.',
      bodyLanguage:
          'Asentimiento de reconocimiento profesional. No invasivo, guardando respeto al canal existente.',
      whatNotToDo:
          "No supongas por qué mantiene a su proveedor ni intentes crear dudas sin información. Respeta si no desea explorar alternativas.",
    ),
  ];
}
