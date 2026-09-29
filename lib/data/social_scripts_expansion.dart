import '../models/social_script.dart';

class SocialScriptsExpansion {
  static const List<SocialScript> scripts = [
    SocialScript(
        id: "expanded_written_steps",
        title: "Pedir instrucciones por escrito",
        category: SocialScriptCategory.work,
        contextDescription:
            "Te dan varias tareas verbalmente y necesitas una referencia.",
        softPhrase: "¿Podrías enviarme los pasos por escrito para revisarlos?",
        assertivePhrase:
            "Necesito la secuencia escrita antes de confirmar los pasos.",
        firmPhrase:
            "No voy a confirmar una secuencia que no he podido revisar. Envíamela por escrito.",
        bodyLanguage:
            "Usa el canal que te resulte cómodo; no necesitas justificar una necesidad personal.",
        whatNotToDo: "No aceptes por inercia si no entendiste qué se espera."),
    SocialScript(
        id: "expanded_camera_choice",
        title: "Acordar participación sin cámara",
        category: SocialScriptCategory.work,
        contextDescription:
            "La reunión permite audio y necesitas mantener privacidad.",
        softPhrase: "¿Les parece si hoy participo por audio?",
        assertivePhrase:
            "Hoy participaré por audio y confirmaré los acuerdos en el chat.",
        firmPhrase:
            "No voy a mostrar mi espacio privado. Podemos revisar mi aporte por audio o texto.",
        bodyLanguage:
            "Mantén el micrófono disponible cuando te toque o avisa si usarás chat.",
        whatNotToDo:
            "No confundas justificar cada detalle privado con explicar cómo participarás."),
    SocialScript(
        id: "expanded_correct_name",
        title: "Corregir cómo quieres que te llamen",
        category: SocialScriptCategory.social,
        contextDescription:
            "Alguien usa un nombre o forma de trato que no prefieres.",
        softPhrase: "Prefiero que me llames [nombre], gracias.",
        assertivePhrase: "Mi nombre es [nombre]. Por favor, usa ese nombre.",
        firmPhrase:
            "Ya indiqué cómo quiero que me llames. Necesito que lo respetes.",
        bodyLanguage:
            "Puedes decirlo en voz o por escrito, sin sonreír por obligación.",
        whatNotToDo: "No devuelvas una burla para lograr que te escuchen."),
    SocialScript(
        id: "expanded_decline_photo",
        title: "No aparecer en una fotografía",
        category: SocialScriptCategory.consent,
        contextDescription: "Un grupo prepara una foto y no deseas aparecer.",
        softPhrase: "Prefiero quedarme fuera de la foto, gracias.",
        assertivePhrase: "No quiero aparecer ni que publiquen una imagen mía.",
        firmPhrase: "No doy permiso para incluirme. Esperen a que me aparte.",
        bodyLanguage:
            "Apártate si puedes y comunica el límite antes de la foto.",
        whatNotToDo:
            "No interpretes estar presente en el evento como permiso para fotografiarte."),
    SocialScript(
        id: "expanded_no_touch_greeting",
        title: "Elegir un saludo sin contacto",
        category: SocialScriptCategory.consent,
        contextDescription:
            "Alguien se acerca para abrazarte y prefieres saludar a distancia.",
        softPhrase: "Qué gusto verte; hoy prefiero saludarte con la mano.",
        assertivePhrase: "Prefiero saludar sin contacto físico.",
        firmPhrase: "No quiero que me toques. Mantengamos distancia.",
        bodyLanguage:
            "Puedes acompañar la frase con un saludo a distancia si te resulta cómodo.",
        whatNotToDo:
            "No necesitas inventar una explicación médica para decir que no."),
    SocialScript(
        id: "expanded_quiet_place",
        title: "Pedir un sitio menos ruidoso",
        category: SocialScriptCategory.sensory,
        contextDescription: "El ruido dificulta seguir la conversación.",
        softPhrase: "¿Podemos ir a un lugar más tranquilo?",
        assertivePhrase:
            "Aquí no consigo seguir la conversación. Necesito menos ruido.",
        firmPhrase:
            "No puedo continuar en este sitio. Voy a salir y podemos retomar después.",
        bodyLanguage:
            "Señala una alternativa accesible y comprueba que la otra persona también pueda usarla.",
        whatNotToDo:
            "No presupongas que hablar más fuerte resolverá todas las dificultades."),
    SocialScript(
        id: "expanded_processing_pause",
        title: "Pedir tiempo para procesar",
        category: SocialScriptCategory.sensory,
        contextDescription: "Te hacen varias preguntas seguidas.",
        softPhrase: "Dame un momento para ordenar lo que me preguntas.",
        assertivePhrase:
            "Necesito que hagamos una pregunta por vez y dejemos una pausa.",
        firmPhrase:
            "No voy a responder a varias preguntas a la vez. Retomemos una por una.",
        bodyLanguage:
            "Puedes usar una señal acordada o escribir la primera pregunta.",
        whatNotToDo:
            "No te comprometas a una respuesta inmediata para aliviar la presión."),
    SocialScript(
        id: "expanded_async_limits",
        title: "Definir horarios de respuesta",
        category: SocialScriptCategory.work,
        contextDescription: "Esperan respuestas fuera del horario acordado.",
        softPhrase: "Puedo revisarlo al comenzar mi próximo turno.",
        assertivePhrase:
            "Contesto mensajes en [horario]. Para urgencias usemos el canal acordado.",
        firmPhrase:
            "No estaré disponible fuera de ese horario. Retomaré el mensaje en mi turno.",
        bodyLanguage:
            "Configura un estado o respuesta breve que refleje tu disponibilidad real.",
        whatNotToDo:
            "No marques todos tus mensajes como urgentes para compensar el límite."),
    SocialScript(
        id: "expanded_clarify_joke",
        title: "Aclarar una broma ambigua",
        category: SocialScriptCategory.social,
        contextDescription: "No sabes si una frase era literal o una broma.",
        softPhrase: "No estoy seguro de cómo entenderlo, ¿era una broma?",
        assertivePhrase:
            "Necesito que me digas si lo dices en serio o en broma.",
        firmPhrase:
            "No voy a seguir con esa ambigüedad. Dímelo de forma directa.",
        bodyLanguage:
            "Pregunta sobre la frase concreta en un tono que te resulte natural.",
        whatNotToDo:
            "No adivines la intención y respondas con una acusación como primer paso."),
    SocialScript(
        id: "expanded_decline_purchase",
        title: "Detener presión comercial",
        category: SocialScriptCategory.pressure,
        contextDescription: "Te piden decidir una compra en ese momento.",
        softPhrase: "Gracias, prefiero revisar la información con calma.",
        assertivePhrase:
            "No voy a comprar hoy. Si me interesa, me pondré en contacto.",
        firmPhrase: "Mi respuesta es no. No quiero continuar esta venta.",
        bodyLanguage:
            "Puedes terminar la conversación sin discutir cada argumento.",
        whatNotToDo:
            "No entregues datos ni aceptes cargos solo para salir de una situación incómoda."),
    SocialScript(
        id: "expanded_repair_interruption",
        title: "Reparar una interrupción propia",
        category: SocialScriptCategory.social,
        contextDescription:
            "Te das cuenta de que hablaste sobre el turno de otra persona.",
        softPhrase: "Creo que te interrumpí; continúa, por favor.",
        assertivePhrase:
            "Te interrumpí. Termina tu idea y luego retomo la mía.",
        firmPhrase: "Voy a detenerme para que puedas terminar tu turno.",
        bodyLanguage:
            "Haz una pausa real; la reparación necesita espacio para escuchar.",
        whatNotToDo:
            "No conviertas la disculpa en otro discurso que ocupe su turno."),
    SocialScript(
        id: "expanded_revoke_agreement",
        title: "Cambiar una preferencia o permiso",
        category: SocialScriptCategory.consent,
        contextDescription:
            "Antes aceptaste una actividad pero ahora no quieres continuar.",
        softPhrase: "He cambiado de idea y prefiero parar.",
        assertivePhrase: "Ya no quiero continuar. Paremos aquí.",
        firmPhrase: "He dicho que quiero parar. No continúes.",
        bodyLanguage:
            "Busca espacio o apoyo si lo necesitas; no tienes que representar calma para que tu límite cuente.",
        whatNotToDo:
            "No trates un permiso anterior como una obligación de mantenerlo."),
  ];
}
