'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "020c68e47ddb893262cb7f43b0bf91b8",
"version.json": "9b818ca9511483c901bed1545384376c",
"index.html": "190f64c96ce174ac26ac5c543bf82a87",
"/": "190f64c96ce174ac26ac5c543bf82a87",
"main.dart.js": "8f3be72bf07307474a3d61fd87b0efd7",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
"assets/AssetManifest.json": "99c0ffef91fb9aefec99ab3664822180",
"assets/NOTICES": "18f2e77b0ec74ad70c64e7917803006b",
"assets/FontManifest.json": "a49f2bc92b2b3be4f832474b3b261e68",
"assets/AssetManifest.bin.json": "491b18074654a07d78f7368516c8ac60",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "bb14f9fcd0535ca7c5e530e65c85fe7e",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/news.png": "b11e2e1c48be82234e91547078c90476",
"assets/assets/images/hat.png": "4b738afb54e6e4c821c1e3938f17afa7",
"assets/assets/images/Git.png": "b3f88caac2e81dc959c3e1f62923a734",
"assets/assets/images/scar.png": "c8b0835acd5fe5eac11088d09527a3fb",
"assets/assets/images/SCA%2520logo.png": "58d1ecae1323fac707fd9d358c585c98",
"assets/assets/images/Flutter.png": "d61c1f7a4eafc4b631c7afd05d186d2d",
"assets/assets/images/besafe.png": "def2541ebbdce70fe3153a1023fd4a48",
"assets/assets/images/islami.png": "b3f6845638cccc18e9b7f9571c25fb99",
"assets/assets/images/Firebase.png": "b35a18b79b3a6494c4de10548759a01d",
"assets/assets/images/owl.png": "1182d91b9d36302354bdbf7d2b7c2e8a",
"assets/assets/images/Figma.png": "61c272c7423f5e9cc4dd1a8d9299b4b9",
"assets/assets/images/notes.png": "40027df01e65206221652640e2183313",
"assets/assets/images/flying%2520owl.png": "a9c69ee0ff30cbfc209d43512a84fea5",
"assets/assets/images/y_r.png": "a929d5d7be4ac7d66de34ef9970422f6",
"assets/assets/images/foot_prints.png": "5b123e790492d1cf38c3b3398b5e0189",
"assets/assets/images/me.jpeg": "e4e4a58427438f8c1b65a8e326494293",
"assets/assets/images/deathly_hollow.png": "6861651c29492c1f6e25276eced2f61a",
"assets/assets/images/scholar.png": "feac286349a811c14e14125849ef003b",
"assets/assets/images/evently.png": "d0d6aae39a60933be749aa9da776a045",
"assets/assets/images/C++.png": "4142f103f40e54fbd7883963375390e4",
"assets/assets/images/Dart.png": "43538c25d101eab6e928eca03c8b951a",
"assets/assets/images/glasses.png": "9c50beb68149bb235f36ce91bd4bae80",
"assets/assets/icons/mail.png": "d599dacfd718fa09267849f8080fb9db",
"assets/assets/icons/github.png": "29d8e936da36c1e6feee0b5e8b888ced",
"assets/assets/icons/attach.png": "17dc4b5bf66b8f7e775c0b4ca33b8629",
"assets/assets/icons/linkedin.png": "4e4d0341fb308f56084680d66faa6e27",
"assets/assets/fonts/Headland_One/HeadlandOne-Regular.ttf": "716f5cfab7ce5cff42968f59c0224a24",
"assets/assets/fonts/Henny_Penny/HennyPenny-Regular.ttf": "a6ea9a6beb001a4ec7795ff7045804ff",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
