# Gestura

Aplicación Flutter para explorar y practicar la comunicación no verbal. Incluye
90 señales, 96 preguntas y 27 escenarios. El contenido educativo y el progreso
se consultan localmente; los anuncios y algunas voces pueden requerir conexión.

## Funciones

- Comunicar ahora: ocho frases listas y mensajes propios para mostrar en grande,
  copiar o leer en voz alta. Mostrar una frase no activa el sonido.
- Ayuda rápida: pasos opcionales para trabajo, encuentros, quedarse en blanco,
  ruido y pausas, con una frase para mostrar en cada situación.
- Manual con búsqueda sin distinción de tildes y por varias palabras,
  categorías, partes del cuerpo, favoritos y señales por explorar.
- Práctica personal de hasta cinco preguntas, con prioridad para los errores
  pendientes y explicaciones tras cada respuesta.
- Entrenamiento visual, modo rápido, escenarios y herramientas de consulta.
- Flash con pausa y repetición de la imagen. El tiempo de observación se detiene
  mientras consultas conceptos, escuchas audio o usas otra app; las respuestas
  no tienen límite de tiempo. El resumen separa repaso y aciertos al primer intento.
- Guía de catorce lecciones, casos sobre contexto y accesibilidad, y guiones
  con tres niveles de firmeza. Consulta los [criterios y fuentes](CONTENT_SOURCES.md).
- Ocho ilustraciones originales creadas para la guía, las fichas y las
  preguntas visuales; incluyen descripciones accesibles.
- Progreso por pregunta y métricas por categoría. Leer una señal, responder una
  pregunta o completar un escenario registra un día de actividad.
- Ruta guiada de once pasos visible al inicio, con porcentaje propio y botón
  para empezar o continuar. Completar un tema abre el siguiente; volver atrás
  lo deja pendiente. Al llegar al 100% se ofrece repasar la ruta.
- Inicio centrado en aprender y comunicar; búsqueda secundaria y acceso a
  Explorar para consultar conceptos, el gesto del día y las categorías.
- Herramientas reunidas en una pantalla accesible desde la barra de inicio,
  con accesos directos a ayuda rápida y límites. Ajustes de voz y tamaño de
  texto al principio de Ajustes; etiquetas visibles en toda la navegación.
- Lectura de conceptos filtrados, lecciones con sus ejercicios y contenido de
  límites y guiones, con controles para detener el audio en la barra superior.
- Lector común en todas las pantallas y sobre los diálogos: «Escuchar pantalla»
  lee el texto visible completo, incluidas opciones, instrucciones, avisos y
  resultados. Al desplazarte puedes escuchar la siguiente parte. El control
  «Elegir un texto» permite tocar una frase o botón para oírlo sin activarlo.
  Incluye descripciones de imágenes, cifras del radar y estados de controles.
  Las lecturas largas se dividen en partes para evitar los límites del motor
  TTS. Detener, cambiar de pantalla o desplazar el contenido cancela la lectura
  común; mostrar un mensaje de comunicación sigue sin iniciar audio.
- Temas claro, oscuro y de alto contraste; tamaño de texto, movimiento reducido,
  narración y ajustes de sonido. La navegación admite español de Latinoamérica,
  español de España, inglés, francés, portugués de Brasil y alemán. Al abrir por
  primera vez sigue el idioma del teléfono; la elección manual se conserva.
  Parte del contenido educativo y de las pantallas permanece en español y se
  lee con una voz española. La voz requiere un idioma compatible instalado en
  el motor de lectura del dispositivo; si falta, se muestra un aviso.

## Ejecutar y validar

Requiere Flutter y el SDK de Android para compilar el APK. Las versiones resueltas
de las dependencias están en `pubspec.lock`.

```sh
flutter pub get
flutter run
flutter analyze
flutter test
flutter build apk --debug
```

El APK de prueba se genera en `build/app/outputs/flutter-apk/app-debug.apk`.
La distribución de producción requiere la configuración de firma de Android.

## Estructura

- `lib/data`: contenido educativo.
- `lib/models`: modelos y reglas de progreso.
- `lib/state`: estado compartido y notificaciones a las pantallas.
- `lib/core`: almacenamiento, audio, temas y utilidades.
- `lib/screens` y `lib/widgets`: pantallas y componentes.
- `test`: pruebas de datos, navegación, progreso, búsqueda y accesibilidad.

## Persistencia

Los mensajes propios y las casillas de ayuda rápida se mantienen mientras su
pantalla sigue abierta; no se guardan al cerrarla.

Los ajustes, favoritos y el progreso usan SharedPreferences. Reiniciar el progreso
conserva favoritos y preferencias. Los resultados nuevos se guardan por ID de
pregunta; los registros antiguos por título se conservan, pero no permiten
reconstruir qué preguntas se respondieron. El repaso personal usa los resultados
por pregunta y se actualiza al corregir una respuesta.
Una respuesta fallada permanece pendiente al reabrir la app. Los aciertos ya
registrados se conservan aunque vuelvas a practicar una pregunta.

El porcentaje de la ruta cuenta sus once pasos. La exploración del catálogo se
muestra aparte en «Actividad y práctica»; al ampliar el catálogo, ese porcentaje
puede bajar aunque se conserven todas las actividades completadas.
