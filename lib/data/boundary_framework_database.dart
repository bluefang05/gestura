import 'package:flutter/material.dart';
import '../models/boundary_framework.dart';

class BoundaryFrameworkDatabase {
  static const List<BoundaryPhase> phases = [
    // ==========================================
    // FASE 1: ENTENDERLOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 1,
      title: 'Entenderlos: El Radar Somático',
      subtitle:
          'Identifica la vulneración de tus límites en el cuerpo antes de que ocurra el colapso.',
      icon: Icons.psychology_rounded,
      corePrinciple:
          'El resentimiento y la rabia sorda son el timbre de alarma de un límite que no pusiste a tiempo. Tu cuerpo siempre sabe que te estás traicionando antes de que tu mente busque justificaciones.',
      conceptItems: [
        BoundaryConceptItem(
          title: 'El Radar Somático (Señales Físicas)',
          description:
              'Tensión en la mandíbula, nudo en el estómago, hombros pegados a las orejas, respiración corta o ganas urgentes de huir. Son alertas neurobiológicas de invasión o sobrecarga.',
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
          'El Test del Resentimiento: Si al pensar en decir que "sí" sientes pesadez, amargura o la fantasía de que el plan se cancele por arte de magia, tu respuesta auténtica y necesaria es un "NO".',
    ),

    // ==========================================
    // FASE 2: COMUNICARLOS / HACERLOS
    // ==========================================
    BoundaryPhase(
      phaseNumber: 2,
      title: 'Hacerlos: La Ejecución Asertiva',
      subtitle:
          'La fórmula verbal exacta y el lenguaje corporal para marcar el límite sin agresión ni disculpas.',
      icon: Icons.record_voice_over_rounded,
      corePrinciple:
          'Un límite claro no necesita gritos ni sermones. La serenidad del tono de voz y la brevedad de las palabras proyectan una solidez inquebrantable.',
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
              'Ambos pies apoyados planos en el suelo (anclaje), hombros relajados hacia atrás, cabeza erguida y contacto visual directo de 2 a 3 segundos sin desviar los ojos al suelo.',
          icon: Icons.pan_tool_rounded,
          badge: 'No Verbal',
        ),
        BoundaryConceptItem(
          title: 'Erradicar la Sonrisa de Disculpa',
          description:
              'Sonreír nerviosamente al decir "no" es un reflejo de apaciguamiento. El cerebro ajeno lo interpreta como debilidad o margen de negociación. Mantén una expresión neutra y en paz.',
          icon: Icons.sentiment_neutral_rounded,
          badge: 'Clave',
        ),
      ],
      practicalProtocol:
          'La Regla de las 10 Palabras: Mantén la declaración de tu límite en menos de 10 palabras. Cada frase adicional que agregas después de tu negativa funciona como combustible para que el otro abra un debate.',
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
              'Repite exactamente la misma frase sin cambiar palabras ni añadir explicaciones: "Comprendo tu urgencia, pero hoy no estoy disponible". Repetir 3 veces con tono plano desactiva al 95% de los insistentes.',
          icon: Icons.replay_rounded,
          badge: 'Táctica',
        ),
        BoundaryConceptItem(
          title: 'La Resaca de Culpa (Boundary Hangover)',
          description:
              'La taquicardia o culpa que sientes tras marcar un límite no significa que hiciste daño a nadie. Es solo el síndrome de abstinencia de la complacencia aprendida. Respira y déjala pasar sin retractarte.',
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
          'Aprende a leer cuándo el otro cede por desgaste o apaciguamiento, y cómo ofrecer salidas airosas.',
      icon: Icons.handshake_rounded,
      corePrinciple:
          'Si tuviste que insistir varias veces para que alguien dijera que sí, la persona te dijo que NO antes. Un "sí" arrancado por cansancio o presión social es complacencia forzada (fawning), jamás consentimiento auténtico.',
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
              '• Pausa prolongada con suspiro sutil antes de responder.\n• Tono de voz resignado o apagado ("Supongo que sí...").\n• Sonrisa tensa sin arrugas en los ojos (sonrisa de compromiso social).\n• El torso o los pies retroceden físicamente mientras la boca dice "sí".',
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
          'La Regla del Consentimiento Entusiasta: Si la respuesta de la otra persona no es un sí claro, tranquilo y espontáneo, trátala inmediatamente como si fuera un NO y cambia de tema con amabilidad.',
    ),
  ];
}
