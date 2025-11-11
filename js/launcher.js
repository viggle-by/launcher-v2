var CLIENTS = {
  "eaglercraft-1.12.2-js":"https://viggle-by.github.io/launcher-v2/versions/eaglercraft/1.12.2/js/index.html",
  "eaglercraft-1.12.2-wasm":"https://viggle-by.github.io/launcher-v2/versions/eaglercraft/1.12.2/wasm/index.html",
  "eaglercraft-1.8.8-js":"https://viggle-by.github.io/launcher-v2/versions/eaglercraft/1.8.8/js/",
  "eaglercraft-1.8.8-wasm":"https://viggle-by.github.io/launcher-v2/versions/eaglercraft/1.8.8/wasm/",
  "eaglercraft-1.5.2-js":"https://viggle-by.github.io/launcher-v2/versions/eaglercraft/1.5.2/index.html",
  "eaglercraft-1.8.8-u54":"https://stoppedwummpython.github.io/eageag/eaglercraft_js_client/",
  "eaglercraft-1.8.8-u54-wasm":"https://stoppedwummpython.github.io/eageag/eaglercraft_wasm_client/",
  "eaglercraft-1.8.8-u53":"https://eaglercraft.com/mc/1.8.8/?token=ac068911-2935-48ce-b415-39690dc08033&version=1.8.8",
  "pixelclient-v3":"https://viggle-by.github.io/launcher-v2/versions/pixelclient/",
  "eaglercraft-1.8.8-u41":"https://webv0.vercel.app/website-data/prx-177/frontend.html",
  "eaglercraft-1.8.8-u31":"https://math-lessons.vercel.app/test.html",
  "astra-1.6":"https://astraclientorg.github.io/play/js/18/",
  "astra-1.5":"https://viggle-by.github.io/launcher-v2/versions/astraclient/15/astra-1.5.0.html",
  "astra-1.4":"https://viggle-by.github.io/launcher-v2/versions/astraclient/14/astra-1.4.0.html",
  "astra-1.3":"https://viggle-by.github.io/launcher-v2/versions/astraclient/13/astraclient-1.3.0.html",
  "astra-1.2":"https://viggle-by.github.io/launcher-v2/versions/astraclient/12/astra1.2.html",
  "messcraft":"https://mess.eu.org/",
  "resent4.0":"https://client.eaglercraft.win/eagler-files/1.8/resent4.0/index.html"
};

var TEXTURES = {
  "rubygigglepack":"https://viggle-by.github.io/launcher-v2/packs/rubygigglepack/rubygigglepack.zip",
  "overgrowngigglepack":"https://viggle-by.github.io/launcher-v2/packs/overgrowngigglepack/overgrowngigglepack.zip",
  "mysticgigglepack":"https://viggle-by.github.io/launcher-v2/packs/mysticgigglepack/mysticgigglepack.zip",
  "redgigglebluepack":"https://viggle-by.github.io/launcher-v2/packs/redgigglebluepack/redgigglebluepack.zip"
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

document.body.addEventListener("click", function(e) {
  var key = e.target.dataset.client;
  if (!key) return;

  if (TEXTURES[key]) {
    var link = document.createElement("a");
    link.href = TEXTURES[key];
    link.download = "";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  } else if (CLIENTS[key]) {
    window.open(CLIENTS[key], "_blank");
  }
});
