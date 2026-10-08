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
ollama pull qwen3:4b
```

Pesa unos 2,5 GB. Es el modelo recomendado: buena calidad y velocidad aceptable aunque tu equipo no tenga tarjeta gráfica.

| Modelo | Tamaño | Cuándo usarlo |
|---|---|---|
| `qwen3:4b` | 2,5 GB | **Recomendado.** Mejor equilibrio entre calidad y velocidad. |
| `qwen2.5:3b` | 1,9 GB | Equipos con poca memoria. Más rápido, pero prompts más genéricos. |
| `qwen3:8b` | 5,2 GB | Más calidad. Tarda más o menos el doble sin tarjeta gráfica. |

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

1. **Abre Ollama.** Búscalo en el menú Inicio y ábrelo; queda como un icono de llama junto al reloj de Windows. Si ese icono ya está ahí, Ollama ya está encendido.
2. **Haz doble clic en `iniciar.bat`** dentro de la carpeta del proyecto.
   - Se abre una ventana negra (el servidor) y, enseguida, el navegador con la herramienta en `http://localhost:8000/generador-de-prompts.html`.
   - **No cierres la ventana negra** mientras uses la herramienta.
3. Comprueba la etiqueta de arriba del título:
   - **● MODELO ACTIVO** (con punto verde): todo listo.
   - **OLLAMA SIN CONEXIÓN**: Ollama no está abierto. Ábrelo y la herramienta se conecta sola en unos segundos.

> **¿Por qué no basta con hacer doble clic en el archivo HTML?** Ollama, por seguridad, rechaza las páginas abiertas directamente desde el disco. `iniciar.bat` sirve la página en `localhost`, que Ollama sí acepta.

### Apagarla

Cierra la pestaña del navegador y la ventana negra de `iniciar.bat`. Ollama puede seguir abierto; no consume casi nada mientras no se usa y libera el modelo de la memoria a los 15 minutos.

---

## 3. Cómo usarla

1. **Elige el modelo** en el selector *Modelo de Ollama* (por defecto, `qwen3:4b`). La herramienta recuerda tu elección.
2. **Escribe tu mensaje** en *Tu mensaje*, tal como te salga. Ejemplos:
   - `nesesito un correo pa pedir aumento pero q no suene desesperado`
   - `kiero aprender python pero tengo poco tiempo`
   - `ayudame con mi pc q va lentisima`
3. Pulsa **GENERAR PROMPT ↗** (o `Ctrl + Enter`).
4. Espera a que termine. La tarjeta muestra los segundos transcurridos:
   - La **primera vez** tarda más (unos 70 s) porque carga el modelo en memoria.
   - Las siguientes, unos **30–40 s** en un equipo sin tarjeta gráfica.
5. Revisa el resultado y pulsa **COPIAR**. Se copia el prompt completo, listo para pegar en ChatGPT, Claude, Gemini u otra IA.
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
| **OLLAMA SIN CONEXIÓN** | Abre la app de Ollama (o ejecuta `ollama serve` en una terminal). Se reconecta sola. |
| "Abre la herramienta con iniciar.bat" | Abriste el HTML con doble clic. Usa `iniciar.bat`. |
| **SIN MODELOS INSTALADOS** | Ejecuta `ollama pull qwen3:4b` y recarga la página. |
| La ventana negra se cierra y dice que no pudo iniciar el servidor | Comprueba `python --version`. Si Python está bien, el puerto 8000 está ocupado: cierra la otra ventana de `iniciar.bat` que tengas abierta. |
| Tarda mucho | Es normal en equipos sin tarjeta gráfica. Prueba `qwen2.5:3b` (más rápido) y cierra programas pesados. |
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
| `iniciar.bat` | Enciende el servidor local y abre la herramienta en el navegador. |
| `DESIGN.md` | Sistema de diseño (estilo Hyperstudio) en el que se basa la interfaz. |
