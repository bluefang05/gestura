import 'package:flutter/material.dart';
import '../models/boundary_framework.dart';

class BoundaryFrameworkDatabase {
  static const List<BoundaryPhase> phases = [
    // ==========================================
    // FASE 1: ENTENDERLOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 1,
      title: 'Reconocer tus límites',
      subtitle:
          'Observa cómo te sientes y qué necesitas. Las señales del cuerpo pueden ayudar, pero no siempre explican por sí solas lo que ocurre.',
      icon: Icons.psychology_rounded,
      corePrinciple:
          'El enfado, el cansancio o la tensión pueden indicar que necesitas algo. También pueden tener otras causas. Tómate un momento para pensar qué te ayudaría.',
      conceptItems: [
        BoundaryConceptItem(
          title: 'Señales de tu cuerpo',
          description:
              'La tensión, el cansancio o las ganas de alejarte pueden ser señales de incomodidad. No prueban por sí solas que alguien cruzó un límite.',
          icon: Icons.accessibility_new_rounded,
          badge: 'Cuerpo',
        ),
        BoundaryConceptItem(
          title: 'Límite Real vs. Demanda de Control',
          description:
              'Una demanda intenta cambiar la conducta del otro ("¡Deja de hablarme así!"). Un límite define tu propia conducta ("Si me alzas la voz, me retiro de la conversación hasta que podamos hablar con calma"). El límite depende 100% de ti.',
          icon: Icons.rule_rounded,
          badge: 'Definición',
        ),
        BoundaryConceptItem(
          title: 'El Semáforo de Tus Límites',
          description:
              '🟢 Verde: Preferencias flexibles y negociables.\n🟡 Amarillo: Alto gasto de energía que requiere compensación.\n🔴 Rojo: Salud mental, física o sensorial no negociable bajo ninguna circunstancia.',
          icon: Icons.traffic_rounded,
          badge: 'Calibración',
        ),
      ],
      practicalProtocol:
          'Si no sabes si quieres aceptar, puedes pedir tiempo para pensarlo. No tienes que responder de inmediato.',
    ),

    // ==========================================
    // FASE 2: COMUNICARLOS / HACERLOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 2,
      title: 'Hacerlos: La Ejecución Asertiva',
      subtitle:
          'Formas sencillas de expresar un límite. Puedes usar las palabras y la postura que te resulten cómodas.',
      icon: Icons.record_voice_over_rounded,
      corePrinciple:
          'Puedes expresar un límite con una frase clara. No hay una postura, expresión facial o tono que todas las personas deban usar.',
      conceptItems: [
        BoundaryConceptItem(
          title: 'La Fórmula E-I-A (3 Pasos)',
          description:
              '1. Hecho Observable (E): "Son las 18:00..."\n2. Impacto Personal (I): "...y concluyó mi jornada laboral pactada..."\n3. Acción/Límite (A): "...por lo que retomaré este pendiente mañana."',
          icon: Icons.filter_3_rounded,
          badge: 'Fórmula',
        ),
        BoundaryConceptItem(
          title: 'El Lenguaje Corporal de Firmeza',
          description:
              'No tienes que mirar a los ojos ni mantener una postura específica. Puedes decir el límite, escribirlo o pedir apoyo.',
          icon: Icons.pan_tool_rounded,
          badge: 'No Verbal',
        ),
        BoundaryConceptItem(
          title: 'Erradicar la Sonrisa de Disculpa',
          description:
              'Tu expresión facial no invalida lo que dices. Puedes sonreír, mirar a otro lado o mostrar poca emoción; tu límite sigue contando.',
          icon: Icons.sentiment_neutral_rounded,
          badge: 'Clave',
        ),
      ],
      practicalProtocol:
          'Puedes decirlo en pocas palabras si eso te ayuda: "No puedo hacerlo hoy". También puedes dar más contexto si lo prefieres.',
    ),

    // ==========================================
    // FASE 3: SOSTENERLOS / RESPETARLOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 3,
      title: 'Sostenerlos: El Cortafuegos',
      subtitle:
          'Cómo neutralizar la insistencia, el victimismo y la resaca de culpa posterior.',
      icon: Icons.shield_rounded,
      corePrinciple:
          'El límite no termina cuando lo pronuncias; empieza cuando el otro intenta derribarlo. Sostenerlo no es egoísmo ni hostilidad, es coherencia y respeto a tu propia vida.',
      conceptItems: [
        BoundaryConceptItem(
          title: 'Las 3 Formas de Resistencia (Pushback)',
          description:
              '• Victimismo: "Pensé que éramos amigos / Me dejas solo."\n• Debate lógico: "Pero si solo son 10 minutos, no seas exagerado."\n• Culpabilización: "Qué egoísta te has vuelto últimamente."',
          icon: Icons.warning_amber_rounded,
          badge: 'Patrones',
        ),
        BoundaryConceptItem(
          title: 'La Técnica del Disco Rayado',
          description:
              'Si alguien insiste, puedes repetir tu respuesta: "Entiendo, pero hoy no puedo". No hay una frase que garantice cómo reaccionará la otra persona.',
          icon: Icons.replay_rounded,
          badge: 'Táctica',
        ),
        BoundaryConceptItem(
          title: 'Cómo te puedes sentir después',
          description:
              'Después de decir que no, podrías sentir culpa o alivio. Esa sensación no demuestra por sí sola que hiciste algo malo. Si lo necesitas, habla con alguien de confianza.',
          icon: Icons.favorite_border_rounded,
          badge: 'Emoción',
        ),
      ],
      practicalProtocol:
          'El Protocolo de Consecuencia Escalonada:\n1º Aviso: "Como te comenté, mi respuesta es no."\n2º Aviso: "Ya lo hemos hablado y no voy a debatir mi decisión."\n3º Acción: "Si insistes, voy a retirarme de la sala / colgar la llamada." (Y actuar de inmediato).',
    ),

    // ==========================================
    // FASE 4: CONSENTIMIENTO REAL Y LÍMITES AJENOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 4,
      title: 'Consentimiento Real: Decodificar el Límite Ajeno',
      subtitle:
          'Aprende a pedir permiso sin presionar y a respetar la respuesta.',
      icon: Icons.handshake_rounded,
      corePrinciple:
          'Un sí después de mucha insistencia puede no ser libre. Pregunta una vez, deja espacio para responder y acepta un no o una duda.',
      conceptItems: [
        BoundaryConceptItem(
          title: 'El "Falso Sí" y la Trampa de la Insistencia',
          description:
              'En el mundo social, muchas personas temen el conflicto o la incomodidad y dicen "bueno, dale..." solo para que la presión cese. Insistir hasta derribar la resistencia de alguien no es convencer; es acorralar.',
          icon: Icons.warning_amber_rounded,
          badge: 'Ética',
        ),
        BoundaryConceptItem(
          title: 'Microseñales No Verbales del Rechazo Disimulado',
          description:
              'Una pausa, una sonrisa o un cambio de postura no confirman que alguien quiera algo. Si no está claro, pregunta y deja que responda con sus palabras.',
          icon: Icons.psychology_alt_rounded,
          badge: 'No Verbal',
        ),
        BoundaryConceptItem(
          title: 'El Protocolo de la "Puerta de Escape"',
          description:
              'Al invitar o pedir algo, ofrece activamente permiso explícito para rechazar sin consecuencias: "Te lo planteo con total libertad: si prefieres descansar o no te apetece, dímelo con total tranquilidad y cero problema".',
          icon: Icons.door_front_door_outlined,
          badge: 'Táctica',
        ),
      ],
      practicalProtocol:
          'Si la respuesta no está clara, no avances. Pregunta sin presionar y espera una respuesta clara. La persona puede cambiar de opinión.',
    ),
  ];
}
