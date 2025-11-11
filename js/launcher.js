var CLIENTS = {
  "eaglercraft-1.12.2-js":"/versions/eaglercraft/1.12.2/js/index.html",
  "eaglercraft-1.12.2-wasm":"/versions/eaglercraft/1.12.2/wasm/index.html",
  "eaglercraft-1.8.8-js":"/versions/eaglercraft/1.8.8/js/",
  "eaglercraft-1.8.8-wasm":"/versions/eaglercraft/1.8.8/wasm/",
  "eaglercraft-1.5.2-js":"/versions/eaglercraft/1.5.2/index.html",
  "eaglercraft-1.8.8-u54":"https://stoppedwummpython.github.io/eageag/eaglercraft_js_client/",
  "eaglercraft-1.8.8-u54-wasm":"https://stoppedwummpython.github.io/eageag/eaglercraft_wasm_client/",
  "eaglercraft-1.8.8-u53":"/versions/eaglercraft/1.8.8/js/",
  "pixelclient-v3":"/versions/pixelclient/",
  "eaglercraft-1.8.8-u41":"https://webv0.vercel.app/website-data/prx-177/frontend.html",
  "eaglercraft-1.8.8-u31":"https://math-lessons.vercel.app/test.html",
  "astra-1.6":"https://astraclientorg.github.io/play/js/18/",
  "astra-1.5":"/versions/astraclient/15/astra-1.5.0.html",
  "astra-1.4":"/versions/astraclient/14/astra-1.4.0.html",
  "astra-1.3":"/versions/astraclient/13/astraclient-1.3.0.html",
  "astra-1.2":"/versions/astraclient/12/astra1.2.html",
  "messcraft":"https://mess.eu.org/",
  "resent4.0":"https://client.eaglercraft.win/eagler-files/1.8/resent4.0/index.html"
};

var TEXTURES = {
  "rubygigglepack":"/packs/rubygigglepack/rubygigglepack.zip",
  "overgrowngigglepack":"/packs/overgrowngigglepack/overgrowngigglepack.zip",
  "mysticgigglepack":"/packs/mysticgigglepack/mysticgigglepack.zip",
  "redgigglebluepack":"/packs/redgigglebluepack/redgigglebluepack.zip"
};

var toggleBtn = document.getElementById("toggle-updates");
var updatesContainer = document.getElementById("updates");

toggleBtn.addEventListener("click", function() {
  if (updatesContainer.style.display === "flex") {
    updatesContainer.style.display = "none";
  } else {
    updatesContainer.style.display = "flex";
  }
});

var frame = document.getElementById("client-frame");

// Load last selected client or texture
var lastClient = localStorage.getItem("lastClient");
if (lastClient && CLIENTS[lastClient]) loadClient(lastClient);

var lastTexture = localStorage.getItem("lastTexture");
if (lastTexture && TEXTURES[lastTexture]) loadTexture(lastTexture);

document.body.addEventListener("click", function(e) {
  var key = e.target.dataset.client;
  if (!key) return;

  if (TEXTURES[key]) {
    loadTexture(key);
  } else if (CLIENTS[key]) {
    loadClient(key);
  }
});

function loadClient(clientKey) {
  var url = CLIENTS[clientKey];
  if (!url) { alert("Client not found!"); return; }
  frame.src = url;
  frame.style.display = "block";
  localStorage.setItem("lastClient", clientKey);
  updateActiveButton(clientKey, "launch-btn");
}

function loadTexture(textureKey) {
  var url = TEXTURES[textureKey];
  if (!url) { alert("Texture pack not found!"); return; }
  frame.src = url;
  frame.style.display = "block";
  localStorage.setItem("lastTexture", textureKey);
  updateActiveButton(textureKey, "download-btn");
}

function updateActiveButton(key, btnClass) {
  var buttons = document.querySelectorAll("." + btnClass);
  for (var i=0; i<buttons.length; i++) {
    buttons[i].classList.remove("active");
  }
  var activeBtn = document.querySelector('[data-client="'+key+'"]');
  if (activeBtn) activeBtn.classList.add("active");
}
