
**Setup**
instalar dependencias con `npm ci`

**Interprete**
para usar el interprete `npm run repl`
dentro del interprete se puede cargar cualquier modulo dentro de los archivos de `src/`, usando en el intérprete `import <nombre del modulo>`

**Desarrollo gráfico**
para usar elm-live con hot reload `npm run dev`
lo que hace es lo siguiente:
- se ejecuta el comando `elm-live src/Main.elm --hot -- --output=elm.js` que indica que se compile el `src/Main.elm` para generar `elm.js` (un archivo tirado en la raíz de este proyecto) y que el proceso se quede escuchando los cambios para hacer el hot reload
- adentro del `index.html` se importa dicho codigo usando `<script src="elm.js"></script>`, y luego se invoca a la función main de ese modulo con `Elm.Main.init({ node: document.getElementById("app") });`. 

Nótese que en dicha sentencia el nombre `Main` corresponde al nombre del archivo Main.elm y a la declaración que tiene `module Main exposing (..)`. 

Si el módulo se llamara `Paradigmas`, el archivo deberia llamarse `Paradigmas.elm` con una declaracion `module Paradigmas exposion (..)` e invocar a su funcion main en el html con `Elm.Paradigmas.init({ node: document.getElementById("app") });`

Nótese tambien que en el index.html, se crea un div con id `app` y en el init se lo selecciona para que Elm haga todo adentro. No necesariamente se tiene que llamar `app`, puede llamarse de cualquier otra forma
