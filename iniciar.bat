@echo off
rem Enciende el Generador de Prompts: Ollama + servidor local + navegador.
rem (Ollama bloquea las paginas abiertas con doble clic desde el disco, por eso se sirve en localhost.)
setlocal
cd /d "%~dp0"
set "URL=http://localhost:8000/generador-de-prompts.html"
set "OLLAMA_APP=%LOCALAPPDATA%\Programs\Ollama\ollama app.exe"

rem 1. Encender Ollama si esta apagado
curl.exe -s -o nul http://127.0.0.1:11434/api/version
if errorlevel 1 (
  if exist "%OLLAMA_APP%" (
    start "" "%OLLAMA_APP%"
  ) else (
    start "Ollama" /min ollama serve
  )
)

rem 2. Si el servidor ya esta encendido, solo abrir la pagina
curl.exe -s -o nul "%URL%"
if not errorlevel 1 goto abrir

where python >nul 2>nul
if errorlevel 1 (
  echo No se encontro Python. Instalalo desde https://www.python.org/downloads/
  echo y marca la casilla "Add Python to PATH".
  pause
  exit /b 1
)

rem 3. Encender el servidor en una ventana minimizada (cierrala para apagarlo)
start "Generador de Prompts - cierra esta ventana para apagarlo" /min python -m http.server 8000 --bind 127.0.0.1

rem 4. Esperar a que responda (maximo 15 s)
set /a INTENTOS=0
:esperar
timeout /t 1 /nobreak >nul
curl.exe -s -o nul "%URL%"
if not errorlevel 1 goto abrir
set /a INTENTOS+=1
if %INTENTOS% lss 15 goto esperar
echo No se pudo iniciar el servidor. Puede que el puerto 8000 este ocupado por otro programa.
pause
exit /b 1

:abrir
start "" "%URL%"
exit /b 0
