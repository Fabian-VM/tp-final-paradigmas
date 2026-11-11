
## Setup
Instalar dependencias con `npm ci`

## Interprete
Para usar el interprete `npm run repl`.

Dentro del interprete se puede cargar cualquier modulo dentro de los archivos de `src/`, usando en el intérprete `import <nombre del modulo>`


## Desarrollo web o gráfico

Para usar elm-live con hot reload `npm run dev`. Con eso los cambios que se hagan en `src/Main.elm` se van a ver reflejados automáticamente. Igual cualquier cosa conviene hacer F5 por si se corrompe el estado (es algo que el propio elm-live dice al iniciar)

Lo que hace es lo siguiente:
- Se ejecuta el comando `elm-live src/Main.elm --hot -- --output=elm.js` que indica que se compile el `src/Main.elm` para generar `elm.js` (un archivo tirado en la raíz de este proyecto) y que el proceso se quede escuchando los cambios para hacer el hot reload
- Adentro del `index.html` se importa dicho codigo usando `<script src="elm.js"></script>`, y luego se invoca a la función main de ese modulo con `Elm.Main.init({ node: document.getElementById("app") });`. 

El nombre del modulo realmente no importa. Nótese que en dicha sentencia el nombre `Main` corresponde al nombre del archivo Main.elm y a la declaración que tiene `module Main exposing (..)`. 

Si el módulo se llamara `Paradigmas`, el archivo deberia llamarse `Paradigmas.elm` con una declaracion `module Paradigmas exposion (..)` e invocar a su funcion main en el html con `Elm.Paradigmas.init({ node: document.getElementById("app") });`

El id del div adentro del index.html tampoco importa. Se declara un div con id `app` y en el init se lo selecciona para que Elm haga todo adentro, pero podria tener otro id y funcionar igual.

