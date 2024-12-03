# ExamenProlog
## Descripción

Este proyecto es un examen interactivo sobre conocimientos básicos de informática. El sistema presenta una serie de preguntas y permite al usuario seleccionar respuestas para obtener una puntuación. Las preguntas cubren temas como sistemas operativos, programación, redes, seguridad informática, entre otros.

### Funcionalidades

1. **Realizar Examen**: Inicia un examen con preguntas de opción múltiple. El usuario debe responder cada pregunta y, al final, se muestra su puntuación.
2. **Ver Comandos**: Muestra todos los comandos disponibles en el sistema.
3. **¿Quién creó el código?**: Muestra el nombre del autor del código.
4. **Salir del Programa**: Termina la ejecución del programa.

### Base de Datos de Preguntas

El sistema tiene una base de datos de 20 preguntas relacionadas con temas de informática. Cada pregunta tiene tres opciones de respuesta y la correcta está marcada por un índice. A continuación, se incluyen algunas de las preguntas almacenadas:

- **Pregunta 1**: ¿Cuál es el sistema operativo más utilizado?  
  Opciones: `['Windows', 'Linux', 'macOS']`  
  Respuesta correcta: `Windows`

- **Pregunta 2**: ¿Qué es un navegador web?  
  Opciones: `['Un programa para crear páginas', 'Un programa para navegar en internet', 'Un sistema operativo']`  
  Respuesta correcta: `Un programa para navegar en internet`

- **Pregunta 3**: ¿Cuál es el propósito de un antivirus?  
  Opciones: `['Proteger el equipo de virus y malware', 'Optimizar el rendimiento del equipo', 'Acelerar la conexión a internet']`  
  Respuesta correcta: `Proteger el equipo de virus y malware`

...y así sucesivamente hasta la pregunta 20.

### Comandos del Sistema

- **realizar_examen**: Muestra el menú de opciones para realizar el examen.
- **quien_creo_codigo**: Muestra quién creó el código del sistema.
- **ver_comandos**: Muestra todos los comandos disponibles en el sistema.
- **salir_programa**: Termina la ejecución del programa.

### Lógica del Examen

- El examen comienza con la primera pregunta y el usuario puede avanzar una por una.
- Si el usuario responde correctamente, su puntuación aumenta. Si responde incorrectamente, no cambia su puntuación.
- Al finalizar el examen, se muestra el resultado basado en la puntuación obtenida.
- Si el usuario no desea continuar con el examen, puede optar por finalizarlo en cualquier momento.

### Requisitos

Este código está escrito en Prolog y se ejecuta en un entorno que soporte el lenguaje. Se recomienda tener conocimientos básicos de Prolog para entender y modificar el código según las necesidades del usuario.

---

¡Disfruta resolviendo el examen y mejorando tus conocimientos de informática!
