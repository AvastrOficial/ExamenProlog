% Base de datos de preguntas
pregunta(1, '¿Cuál es el sistema operativo más utilizado?', ['windows', 'linux', 'macOS'], 2). 
pregunta(2, '¿Qué es un navegador web?', ['un programa para crear páginas', 'un programa para navegar en internet', 'un sistema operativo'], 2). 
pregunta(3, '¿Cuál es el propósito de un antivirus?', ['proteger el equipo de virus y malware', 'optimizar el rendimiento del equipo', 'acelerar la conexión a internet'], 1). 
pregunta(4, '¿Qué significa CPU?', ['Central Processing Unit', 'Computer Power Unit', 'Core Processing Unit'], 1).
pregunta(5, '¿Qué lenguaje se usa principalmente para la creación de páginas web?', ['Python', 'HTML', 'C++'], 2).
pregunta(6, '¿Qué es una IP?', ['Un tipo de conexión', 'Una dirección única en una red', 'Un protocolo de seguridad'], 2).
pregunta(7, '¿Qué es un sistema operativo?', ['Un programa para escribir documentos', 'Un software que gestiona los recursos del hardware', 'Un navegador avanzado'], 2).
pregunta(8, '¿Cuál de estos es un software de ofimática?', ['Microsoft Word', 'Adobe Photoshop', 'Autodesk Maya'], 1).
pregunta(9, '¿Qué significa RAM?', ['Random Access Memory', 'Read Access Memory', 'Real Application Memory'], 1).
pregunta(10, '¿Qué es un bit?', ['La unidad básica de datos', 'Un tipo de archivo', 'Un sistema operativo pequeño'], 1).
pregunta(11, '¿Qué es un servidor web?', ['Una computadora que almacena y entrega contenido web', 'Un servicio para descargar música', 'Un software para diseñar sitios'], 1).
pregunta(12, '¿Cuál de estos es un lenguaje de programación?', ['Java', 'Excel', 'Photoshop'], 1).
pregunta(13, '¿Qué es una URL?', ['Una herramienta de desarrollo', 'Un tipo de conexión', 'Una dirección web'], 3).
pregunta(14, '¿Cuál de estas opciones es un ejemplo de navegador?', ['Windows Explorer', 'Google Chrome', 'Visual Studio'], 2).
pregunta(15, '¿Qué es una base de datos?', ['Un conjunto organizado de datos', 'Un hardware de almacenamiento', 'Un protocolo de red'], 1).
pregunta(16, '¿Qué es el phishing?', ['Un tipo de malware', 'Un método de engaño para obtener datos', 'Un programa de diseño gráfico'], 2).
pregunta(17, '¿Qué significa HTTP?', ['Hyper Text Transfer Protocol', 'High Text Transfer Program', 'Hyper Tool Transfer Protocol'], 1).
pregunta(18, '¿Cuál de estas opciones es un sistema operativo móvil?', ['Windows 10', 'Android', 'Ubuntu'], 2).
pregunta(19, '¿Qué es una red informática?', ['Un grupo de computadoras interconectadas', 'Un software de almacenamiento', 'Un tipo de navegador'], 1).
pregunta(20, '¿Qué es el software libre?', ['Software que permite modificar y distribuir el código fuente', 'Software gratuito sin restricciones', 'Software protegido por copyright'], 1).

% Número total de preguntas
numero_preguntas(20).

% Variable dinámica para acumular estado
:- dynamic estado_actual/2.

% Mostrar banner
banner :- 
    write('******************************************************'), nl,
    write('*               EXAMEN DE INFORMATICA                *'), nl,
    write('******************************************************'), nl.

% Iniciar el programa principal
realizar_examen :- 
    banner,
    write('Opciones:'), nl,
    write('1 - Hacer el examen'), nl,
    write('2 - ¿Quién creó el código?'), nl,
    write('3 - Ver todos los comandos'), nl,
    write('0 - Salir del programa'), nl,
    write('Selecciona una opción con (1., 2., 3. o 0.): '), nl,
    flush_output,
    read(Opcion),
    manejar_opcion(Opcion).

% Manejar las opciones del menú
manejar_opcion(1) :- iniciar_examen.
manejar_opcion(2) :- 
    write('Este código fue creado por AvaStrOficial'), nl,
    realizar_examen.
manejar_opcion(3) :- 
    ver_comandos,
    realizar_examen.
manejar_opcion(0) :- 
    write('Saliendo del programa. ¡Hasta pronto!'), nl.
manejar_opcion(_) :- 
    write('Opción no válida, por favor selecciona 1., 2., 3. o 0.'), nl,
    realizar_examen.

% Iniciar el examen
iniciar_examen :- 
    retractall(estado_actual(_, _)), % Limpiar estado previo
    assert(estado_actual(1, 0)), % Iniciar con la pregunta 1 y 0 puntos
    write('Bienvenido al examen de conocimientos básicos de informática'), nl,
    mostrar_pregunta(1).

% Mostrar la pregunta actual
mostrar_pregunta(N) :- 
    pregunta(N, Texto, Opciones, _),
    write(Texto), nl,
    mostrar_opciones(Opciones),
    write('Selecciona la opción con responder(Número).'), nl.

% Mostrar las opciones
mostrar_opciones(Opciones) :- 
    mostrar_opciones(Opciones, 1).

mostrar_opciones([], _).
mostrar_opciones([Opcion|Resto], Indice) :- 
    write(Indice), write('. '), write(Opcion), nl,
    NuevoIndice is Indice + 1,
    mostrar_opciones(Resto, NuevoIndice).

% Responder una pregunta
responder(OpcionSeleccionada) :- 
    estado_actual(PreguntaActual, Puntuacion),
    pregunta(PreguntaActual, _, _, RespuestaCorrecta),
    verificar_respuesta(OpcionSeleccionada, RespuestaCorrecta, Puntuacion, NuevaPuntuacion),
    avanzar_examen(NuevaPuntuacion).

% Verificar la respuesta y calcular puntos
verificar_respuesta(OpcionSeleccionada, RespuestaCorrecta, Puntuacion, NuevaPuntuacion) :-
    (   OpcionSeleccionada =:= RespuestaCorrecta ->  
        NuevaPuntuacion is Puntuacion + 1,
        write('Respuesta Correcta!'), nl
    ;   
        NuevaPuntuacion is Puntuacion,
        write('Respuesta Incorrecta.'), nl
    ).

% Avanzar en el examen
avanzar_examen(Puntuacion) :- 
    estado_actual(PreguntaActual, _),
    numero_preguntas(TotalPreguntas),
    (   PreguntaActual < TotalPreguntas -> 
        SiguientePregunta is PreguntaActual + 1,
        retractall(estado_actual(_, _)),
        assert(estado_actual(SiguientePregunta, Puntuacion)),
        preguntar_si_continuar
    ;   
        finalizar_examen(Puntuacion)
    ).

% Preguntar si continuar
preguntar_si_continuar :- 
    write('¿Deseas continuar con la siguiente pregunta? (si. / no.): '), nl,
    flush_output,
    read(Respuesta),
    (   Respuesta == si -> 
        estado_actual(PreguntaActual, _),
        mostrar_pregunta(PreguntaActual)
    ;   
        estado_actual(_, Puntuacion),
        finalizar_examen(Puntuacion)
    ).

% Finalizar el examen
finalizar_examen(Puntuacion) :- 
    write('Examen terminado.'), nl,
    (   Puntuacion >= 2 ->  
        write('¡Felicidades! Has aprobado el examen con '), 
        write(Puntuacion), write(' puntos.'), nl
    ;   
        write('Lo siento, no has aprobado el examen. Has obtenido '), 
        write(Puntuacion), write(' puntos.'), nl
    ),
    realizar_examen.

% Ver todos los comandos
ver_comandos :- 
    write('Comandos disponibles:'), nl,
    write('1. realizar_examen - Menu De Opciones.'), nl,
    write('2. quien_creo_codigo - Muestra Quién Creó este Código.'), nl,
    write('3. ver_comandos - Muestra Todos Los Comandos Disponibles.'), nl,
    write('0. salir_programa - Termina La Ejecución Del Programa.'), nl.

% Iniciar el menú
inicio :- 
    realizar_examen.
