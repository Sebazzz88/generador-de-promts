# Generador de Prompts

Herramienta web que convierte mensajes informales (con errores o ideas a medias) en prompts claros con la estructura **Rol / Contexto / Tarea / Requisitos / Formato de respuesta**, más una línea "Supuse: ..." con lo que asumió.

## Uso

1. Abre `generador-de-prompts.html` en el navegador (no necesita servidor ni instalación).
2. Pega tu clave API de Anthropic en el campo "Clave API". Se guarda solo en tu navegador y se envía únicamente a `api.anthropic.com`.
3. Escribe tu mensaje y pulsa **GENERAR PROMPT** (o `Ctrl + Enter`).
4. Copia el resultado con **COPIAR**.

Si el mensaje es demasiado ambiguo, la herramienta hace hasta 2 preguntas antes de generar el prompt.

## Archivos

- `generador-de-prompts.html` — la herramienta completa (HTML, CSS y JS en un solo archivo). Usa el modelo `claude-opus-5-5`.
- `DESIGN.md` — sistema de diseño (estilo Hyperstudio) en el que se basa la interfaz.
