# Generador de Prompts

Convierte mensajes informales (con faltas de ortografía o ideas a medias) en prompts claros y listos para pegar en cualquier IA, con esta estructura:

```
Rol: ...
Contexto: ...
Tarea: ...
Requisitos: ...
Formato de respuesta: ...
```

Debajo muestra una línea **"Supuse: ..."** con lo que la herramienta asumió por ti.

Funciona **100 % en local** con [Ollama](https://ollama.com) y el modelo Qwen. No necesitas cuentas, claves ni internet (solo para la instalación), y lo que escribes no sale de tu ordenador.

---

## 1. Instalación (solo la primera vez)

### 1.1 Instala Ollama

Descárgalo de https://ollama.com/download e instálalo. Para comprobarlo, abre una terminal (PowerShell) y escribe:

```
ollama --version
```

### 1.2 Descarga el modelo

```
ollama pull qwen3:8b
```

Pesa unos 5,2 GB y necesita unos 8 GB de RAM libres. Es el modelo recomendado: da los prompts más útiles y, como escribe de forma concisa, tarda casi lo mismo que los modelos pequeños.

| Modelo | Tamaño | Cuándo usarlo |
|---|---|---|
| `qwen3:8b` | 5,2 GB | **Recomendado.** Prompts concretos y sensatos. La herramienta lo elige por defecto. |
| `qwen3:4b` | 2,5 GB | Equipos con menos de 12 GB de RAM. Más flojo: a veces inventa límites o pasos sin sentido. |
| `qwen2.5:3b` | 1,9 GB | Solo si los anteriores no caben. Prompts bastante genéricos. |

Puedes tener varios: la herramienta te deja elegir entre todos los que tengas instalados.

### 1.3 Instala Python

La herramienta usa Python para abrirse en el navegador. Si no lo tienes, descárgalo de https://www.python.org/downloads/ y, durante la instalación, marca la casilla **"Add Python to PATH"**. Para comprobarlo:

```
python --version
```

### 1.4 Descarga este proyecto

Con Git:

```
git clone https://github.com/Sebazzz88/generador-de-promts.git
```

O desde GitHub: botón verde **Code → Download ZIP** y descomprímelo.

---

## 2. Cómo encenderla

### Crear el acceso directo en el escritorio (solo la primera vez)

Clic derecho en `iniciar.bat` → **Mostrar más opciones** → **Enviar a** → **Escritorio (crear acceso directo)**.

Opcional: clic derecho en el acceso directo → **Propiedades** → **Cambiar icono...** → elige `icono.ico` de la carpeta del proyecto, y en **Ejecutar** elige **Minimizada**.

### Encenderla

**Doble clic en el acceso directo** (o en `iniciar.bat`). Hace todo solo:

1. Enciende Ollama si estaba apagado.
2. Enciende el servidor de la herramienta en una ventana **minimizada** en la barra de tareas.
3. Abre la herramienta en el navegador (`http://localhost:8000/generador-de-prompts.html`).

Si ya estaba encendida, solo abre la página otra vez.

Comprueba la etiqueta de arriba del título:
- **● MODELO ACTIVO** (con punto verde): todo listo.
- **OLLAMA SIN CONEXIÓN**: Ollama todavía está arrancando. Espera unos segundos; la herramienta se conecta sola.

> **¿Por qué no basta con hacer doble clic en el archivo HTML?** Ollama, por seguridad, rechaza las páginas abiertas directamente desde el disco. `iniciar.bat` sirve la página en `localhost`, que Ollama sí acepta.

### Apagarla

Cierra la pestaña del navegador y la ventana minimizada **"Generador de Prompts - cierra esta ventana para apagarlo"** de la barra de tareas. Ollama puede seguir abierto; no consume casi nada mientras no se usa y libera el modelo de la memoria a los 15 minutos.

---

## 3. Cómo usarla

1. **Elige el modelo** en el selector *Modelo de Ollama* (por defecto, `qwen3:8b`). La herramienta recuerda tu elección.
2. **Escribe tu mensaje** en *Tu mensaje*, tal como te salga. Ejemplos:
   - `nesesito un correo pa pedir aumento pero q no suene desesperado`
   - `quiero vender mis dibujos por instagram pero nadie me sigue`
   - `un discurso pa la boda de mi hermana q de risa pero tambien emocione`
3. Pulsa **Enter** (o el botón **GENERAR PROMPT ↗**). Para hacer un salto de línea dentro del mensaje, usa **Shift + Enter**.
4. El prompt se va escribiendo en la tarjeta en tiempo real, sección por sección. En un equipo sin tarjeta gráfica:
   - La **primera vez** tarda en empezar (1–2 min) porque carga el modelo en memoria.
   - Las siguientes, el texto empieza a salir en unos **10 s** y el prompt completo tarda unos **2–2,5 min**.
5. Cuando termine, pulsa **COPIAR**. Se copia el prompt completo, listo para pegar en ChatGPT, Claude, Gemini u otra IA.
6. **Rellena los marcadores** entre corchetes, como `[nombre del jefe]` o `[tu sistema operativo]`. La herramienta los pone en lugar de inventar datos que no le diste.

**Si te hace preguntas:** cuando el mensaje es muy ambiguo (por ejemplo, `quiero hacer una app`), la tarjeta muestra hasta 2 preguntas. Respóndelas y pulsa **RESPONDER Y GENERAR ↗**. Si dejas alguna en blanco, asumirá lo más razonable.

**LIMPIAR** borra el mensaje y el resultado. Si hay una generación en curso, la cancela.

### Consejos para mejores resultados

- Di **para qué** lo quieres y **para quién** (tu jefe, un cliente, clase...).
- Menciona límites si los tienes: longitud, tono, idioma, herramientas.
- Escribe en el idioma en que quieras el prompt; la herramienta responde en el mismo.

---

## 4. Problemas frecuentes

| Qué ves | Qué hacer |
|---|---|
| **OLLAMA SIN CONEXIÓN** durante más de un minuto | Abre la app de Ollama a mano (o ejecuta `ollama serve` en una terminal). Se reconecta sola. |
| "Abre la herramienta con iniciar.bat" | Abriste el HTML con doble clic. Usa el acceso directo o `iniciar.bat`. |
| **SIN MODELOS INSTALADOS** | Ejecuta `ollama pull qwen3:8b` y recarga la página. |
| "No se encontró Python" | Instala Python (ver 1.3) marcando "Add Python to PATH". |
| "No se pudo iniciar el servidor" | Otro programa usa el puerto 8000. Ciérralo o reinicia el PC. |
| Tarda mucho | Es normal en equipos sin tarjeta gráfica (unos 2 min por prompt). Cierra programas pesados. Si tu PC tiene poca RAM, prueba `qwen3:4b`. |
| El acceso directo no muestra el icono | Comprueba que `icono.ico` sigue en la carpeta del proyecto. Si acabas de crearlo, puede tardar en aparecer: reinicia el Explorador o el PC. |
| "El modelo devolvió un formato inesperado" | Pulsa otra vez **GENERAR PROMPT**. Si se repite, prueba con otro modelo. |

### Encenderla sin `iniciar.bat`

En una terminal, dentro de la carpeta del proyecto:

```
python -m http.server 8000 --bind 127.0.0.1
```

Y abre `http://localhost:8000/generador-de-prompts.html` en el navegador.

---

## 5. Archivos

| Archivo | Qué es |
|---|---|
| `generador-de-prompts.html` | La herramienta completa (HTML, CSS y JS en un solo archivo). |
| `iniciar.bat` | Enciende Ollama y el servidor local, y abre la herramienta en el navegador. |
| `icono.ico` | Icono para el acceso directo del escritorio. |
| `DESIGN.md` | Sistema de diseño (estilo Hyperstudio) en el que se basa la interfaz. |
