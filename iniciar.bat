@echo off
rem Sirve el Generador de Prompts en http://localhost:8000 para que pueda hablar con Ollama.
rem (Ollama bloquea las paginas abiertas con doble clic desde el disco.)
cd /d "%~dp0"
echo Generador de Prompts en http://localhost:8000/generador-de-prompts.html
echo Cierra esta ventana para detenerlo.
start "" "http://localhost:8000/generador-de-prompts.html"
python -m http.server 8000 --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo No se pudo iniciar el servidor. Comprueba que Python este instalado y que el puerto 8000 este libre.
  pause
)
