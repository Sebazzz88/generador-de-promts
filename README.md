# Generador de Prompts

Herramienta web que convierte mensajes informales (con errores o ideas a medias) en prompts claros con la estructura **Rol / Contexto / Tarea / Requisitos / Formato de respuesta**, más una línea "Supuse: ..." con lo que asumió.

Funciona 100 % en local con [Ollama](https://ollama.com): nada sale de tu ordenador.

## Requisitos

- Ollama instalado y abierto.
- Un modelo descargado. Recomendado: `qwen3:4b` (buen equilibrio entre calidad y velocidad en CPU). Alternativa más ligera: `qwen2.5:3b`.
  ```
  ollama pull qwen3:4b
  ```
- Python 3 (solo para servir la página en localhost).

## Uso

1. Haz doble clic en `iniciar.bat`. Abre la herramienta en `http://localhost:8000/generador-de-prompts.html`.
2. Elige el modelo en el selector (aparecen los que tengas instalados en Ollama).
3. Escribe tu mensaje y pulsa **GENERAR PROMPT** (o `Ctrl + Enter`).
4. Copia el resultado con **COPIAR**.

Si el mensaje es demasiado ambiguo, la herramienta hace hasta 2 preguntas antes de generar el prompt.

> ¿Por qué `iniciar.bat` y no doble clic en el HTML? Ollama rechaza las peticiones de páginas abiertas directamente desde el disco (`file://`). Servirla en `localhost` lo evita sin tocar la configuración de Ollama. Si prefieres abrir el HTML directamente, define la variable de entorno `OLLAMA_ORIGINS=*` y reinicia Ollama.

## Archivos

- `generador-de-prompts.html` — la herramienta completa (HTML, CSS y JS en un solo archivo).
- `iniciar.bat` — sirve la página en localhost y la abre en el navegador.
- `DESIGN.md` — sistema de diseño (estilo Hyperstudio) en el que se basa la interfaz.
