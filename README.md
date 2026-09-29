# Gestura

Aplicación Flutter para explorar y practicar la comunicación no verbal. Incluye
66 señales, 45 preguntas y 15 escenarios. El contenido educativo y el progreso
se consultan localmente; los anuncios y algunas voces pueden requerir conexión.

## Funciones

- Manual con búsqueda sin distinción de tildes y por varias palabras,
  categorías, partes del cuerpo, favoritos y señales por explorar.
- Práctica personal de hasta cinco preguntas, con prioridad para los errores
  pendientes y explicaciones tras cada respuesta.
- Entrenamiento visual, modo rápido, escenarios y herramientas de consulta.
- Progreso por pregunta y métricas por categoría. Leer una señal, responder una
  pregunta o completar un escenario registra un día de actividad.
- Temas claro, oscuro y de alto contraste; tamaño de texto, movimiento reducido,
  narración y ajustes de sonido. La navegación admite cinco idiomas; parte del
  contenido educativo y de las pantallas permanece en español.

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

Los ajustes, favoritos y el progreso usan SharedPreferences. Reiniciar el progreso
conserva favoritos y preferencias. Los resultados nuevos se guardan por ID de
pregunta; los registros antiguos por título se conservan, pero no permiten
reconstruir qué preguntas se respondieron. El repaso personal usa los resultados
por pregunta y se actualiza al corregir una respuesta.
