#!/bin/bash

PROJECT_NAME="minecraft-web-launcher"

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

mkdir -p css js

cat > index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Minecraft Web Launcher</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="launcher">
  <h1>Minecraft Web Launcher</h1>
  <p>Select a client to play:</p>

  <h3>Eaglercraft JS/WASM</h3>
  <div class="button-group">
    <button class="launch-btn" data-client="eaglercraft-1.12.2-js">Eaglercraft 1.12.2 JS</button>
    <button class="launch-btn" data-client="eaglercraft-1.12.2-wasm">Eaglercraft 1.12.2 WASM</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-js">Eaglercraft 1.8.8 JS</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-wasm">Eaglercraft 1.8.8 WASM</button>
    <button class="launch-btn" data-client="eaglercraft-1.5.2-js">Eaglercraft 1.5.2 JS</button>
  </div>

  <h3>Eaglercraft 1.8.8 Updates</h3>
  <button id="toggle-updates" class="toggle-btn">Toggle Updates</button>
  <div id="updates" class="collapsible-content" style="display:none;">
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u54">u54</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u53">u53</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u52">u52</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u51">u51</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u50">u50</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u49">u49</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u48">u48</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u47">u47</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u46">u46</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u45">u45</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u44">u44</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u43">u43</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u42">u42</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u41">u41</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u40">u40</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u39">u39</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u38">u38</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u37">u37</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u36">u36</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u35">u35</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u34">u34</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u33">u33</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u32">u32</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u31">u31</button>
    <button class="launch-btn" data-client="eaglercraft-1.8.8-u30">u30</button>
  </div>

  <h3>Astra Client</h3>
  <div class="button-group">
    <button class="launch-btn" data-client="astra-1.6">Astra 1.6</button>
    <button class="launch-btn" data-client="astra-1.5">Astra 1.5</button>
    <button class="launch-btn" data-client="astra-1.4">Astra 1.4</button>
    <button class="launch-btn" data-client="astra-1.3">Astra 1.3</button>
    <button class="launch-btn" data-client="astra-1.2">Astra 1.2</button>
  </div>

  <h3>Other Clients</h3>
  <div class="button-group">
    <button class="launch-btn" data-client="messcraft">MessCraft</button>
    <button class="launch-btn" data-client="resent4.0">Resent 4.0</button>
  </div>

  <iframe id="client-frame" src="" frameborder="0" allowfullscreen></iframe>
</div>
<script src="js/launcher.js"></script>
</body>
</html>
EOL

cat > css/style.css <<EOL
body {
  font-family: Arial, sans-serif;
  background-color: #222;
  color: #eee;
  margin: 0;
  padding: 0;
}

#launcher {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

h1, h2, h3 {
  margin: 10px 0;
}

.button-group {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

button.launch-btn {
  background-color: #444;
  color: #fff;
  border: none;
  padding: 8px 12px;
  cursor: pointer;
  border-radius: 4px;
}

button.launch-btn.active {
  background-color: #0f9;
  color: #000;
}

button.launch-btn:hover {
  background-color: #666;
}

.collapsible-content {
  display: flex;
  overflow-x: auto;
  gap: 10px;
  padding: 5px 0;
  scrollbar-width: thin;
  scrollbar-color: #888 #222;
}

.collapsible-content::-webkit-scrollbar {
  height: 8px;
}

.collapsible-content::-webkit-scrollbar-thumb {
  background-color: #888;
  border-radius: 4px;
}

#client-frame {
  width: 100%;
  height: 600px;
  border: 2px solid #555;
  margin-top: 20px;
  display: none;
}

.toggle-btn {
  background-color: #555;
  color: #fff;
  border: none;
  padding: 5px 10px;
  cursor: pointer;
  border-radius: 4px;
}
EOL

cat > js/launcher.js <<EOL
var CLIENTS = {
  "eaglercraft-1.12.2-js":"https://example.com/mc/client/eaglercraft-1.12.2-js/index.html",
  "eaglercraft-1.12.2-wasm":"https://example.com/mc/client/eaglercraft-1.12.2-wasm/index.html",
  "eaglercraft-1.8.8-js":"https://example.com/mc/client/eaglercraft-1.8.8-js/index.html",
  "eaglercraft-1.8.8-wasm":"https://example.com/mc/client/eaglercraft-1.8.8-wasm/index.html",
  "eaglercraft-1.5.2-js":"https://example.com/mc/client/eaglercraft-1.5.2-js/index.html",
  "eaglercraft-1.8.8-u54":"https://example.com/mc/client/eaglercraft-1.8.8-u54/index.html",
  "eaglercraft-1.8.8-u53":"https://example.com/mc/client/eaglercraft-1.8.8-u53/index.html",
  "eaglercraft-1.8.8-u52":"https://example.com/mc/client/eaglercraft-1.8.8-u52/index.html",
  "eaglercraft-1.8.8-u51":"https://example.com/mc/client/eaglercraft-1.8.8-u51/index.html",
  "eaglercraft-1.8.8-u50":"https://example.com/mc/client/eaglercraft-1.8.8-u50/index.html",
  "eaglercraft-1.8.8-u49":"https://example.com/mc/client/eaglercraft-1.8.8-u49/index.html",
  "eaglercraft-1.8.8-u48":"https://example.com/mc/client/eaglercraft-1.8.8-u48/index.html",
  "eaglercraft-1.8.8-u47":"https://example.com/mc/client/eaglercraft-1.8.8-u47/index.html",
  "eaglercraft-1.8.8-u46":"https://example.com/mc/client/eaglercraft-1.8.8-u46/index.html",
  "eaglercraft-1.8.8-u45":"https://example.com/mc/client/eaglercraft-1.8.8-u45/index.html",
  "eaglercraft-1.8.8-u44":"https://example.com/mc/client/eaglercraft-1.8.8-u44/index.html",
  "eaglercraft-1.8.8-u43":"https://example.com/mc/client/eaglercraft-1.8.8-u43/index.html",
  "eaglercraft-1.8.8-u42":"https://example.com/mc/client/eaglercraft-1.8.8-u42/index.html",
  "eaglercraft-1.8.8-u41":"https://example.com/mc/client/eaglercraft-1.8.8-u41/index.html",
  "eaglercraft-1.8.8-u40":"https://example.com/mc/client/eaglercraft-1.8.8-u40/index.html",
  "eaglercraft-1.8.8-u39":"https://example.com/mc/client/eaglercraft-1.8.8-u39/index.html",
  "eaglercraft-1.8.8-u38":"https://example.com/mc/client/eaglercraft-1.8.8-u38/index.html",
  "eaglercraft-1.8.8-u37":"https://example.com/mc/client/eaglercraft-1.8.8-u37/index.html",
  "eaglercraft-1.8.8-u36":"https://example.com/mc/client/eaglercraft-1.8.8-u36/index.html",
  "eaglercraft-1.8.8-u35":"https://example.com/mc/client/eaglercraft-1.8.8-u35/index.html",
  "eaglercraft-1.8.8-u34":"https://example.com/mc/client/eaglercraft-1.8.8-u34/index.html",
  "eaglercraft-1.8.8-u33":"https://example.com/mc/client/eaglercraft-1.8.8-u33/index.html",
  "eaglercraft-1.8.8-u32":"https://example.com/mc/client/eaglercraft-1.8.8-u32/index.html",
  "eaglercraft-1.8.8-u31":"https://example.com/mc/client/eaglercraft-1.8.8-u31/index.html",
  "eaglercraft-1.8.8-u30":"https://example.com/mc/client/eaglercraft-1.8.8-u30/index.html",
  "astra-1.6":"https://example.com/mc/client/astra-1.6/index.html",
  "astra-1.5":"https://example.com/mc/client/astra-1.5/index.html",
  "astra-1.4":"https://example.com/mc/client/astra-1.4/index.html",
  "astra-1.3":"https://example.com/mc/client/astra-1.3/index.html",
  "astra-1.2":"https://example.com/mc/client/astra-1.2/index.html",
  "messcraft":"https://mess.eu.org/",
  "resent4.0":"https://client.eaglercraft.win/eagler-files/1.8/resent4.0/index.html"
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
var lastClient = localStorage.getItem("lastClient");
if (lastClient && CLIENTS[lastClient]) loadClient(lastClient);

document.body.addEventListener("click", function(e) {
  if (e.target.classList.contains("launch-btn")) {
    var clientKey = e.target.dataset.client;
    loadClient(clientKey);
  }
});

function loadClient(clientKey) {
  var url = CLIENTS[clientKey];
  if (!url) { alert("Client not found!"); return; }
  frame.src = url;
  frame.style.display = "block";
  localStorage.setItem("lastClient", clientKey);

  var buttons = document.querySelectorAll(".launch-btn");
  for (var i=0; i<buttons.length; i++) {
    buttons[i].classList.remove("active");
  }
  var activeBtn = document.querySelector('[data-client="'+clientKey+'"]');
  if (activeBtn) activeBtn.classList.add("active");
}
EOL

chmod +x setup.sh

echo "Project setup complete! Open '$PROJECT_NAME/index.html' in your browser."

