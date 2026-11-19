const app = Elm.Examples.PortsExample.init({
  node: document.getElementById("app")
});

const STORAGE_KEY = "elm_port_example";

app.ports.saveNota.subscribe((texto) => {
  localStorage.setItem(STORAGE_KEY, texto);
});

const previa = localStorage.getItem(STORAGE_KEY);
if (previa !== null) {
  app.ports.loadNotaReceiver.send(previa);
}