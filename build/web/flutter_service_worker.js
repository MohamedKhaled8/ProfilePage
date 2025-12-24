'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3bd1067199552a115a19d64ceb2d8763",
"assets/AssetManifest.bin.json": "483db148f105b7516d4790fc23f5762b",
"assets/AssetManifest.json": "9c0ace836b35383d0dafefc8ddf4f74f",
"assets/assets/fonts/fonnts.com-Qs_Iranyekan-bold.ttf": "339f2e127eec6ea1db42d9af398fddde",
"assets/assets/fonts/Poppins-Bold.ttf": "92934d92f57e49fc6f61075c2aeb7689",
"assets/assets/fonts/Poppins-Medium.ttf": "20aaac2ef92cddeb0f12e67a443b0b9f",
"assets/assets/fonts/Poppins-Regular.ttf": "09acac7457bdcf80af5cc3d1116208c5",
"assets/assets/fonts/Qs_Iranyekan%2520black.ttf": "5cc94df235c83e0548fc93afe75791e6",
"assets/assets/fonts/Qs_Iranyekan%2520bold.ttf": "339f2e127eec6ea1db42d9af398fddde",
"assets/assets/fonts/Qs_Iranyekan%2520extrablack.ttf": "9d84d24120dde4ccef88ffab0437645d",
"assets/assets/fonts/Qs_Iranyekan%2520extrabold.ttf": "a8e71b60756858fe2a3337ff615735ab",
"assets/assets/fonts/Qs_Iranyekan%2520light.ttf": "551f8564c4d02044985524131e957760",
"assets/assets/fonts/Qs_Iranyekan%2520medium.ttf": "e14e275c7e80dd36cc9308541221306e",
"assets/assets/fonts/Qs_Iranyekan%2520thin.ttf": "1ec38807dc12bc1c88292e34fbca8474",
"assets/assets/fonts/Qs_Iranyekan.ttf": "5504ec99783af49b905fcb3c4ed78e55",
"assets/assets/fonts/README.txt": "810e3cf8a55904e84ff969406a8825f9",
"assets/assets/icons/svg/ar.svg": "a13a7be395668006f6e8f35137a814fb",
"assets/assets/icons/svg/facebook.svg": "9c168fe72a5e8820ce7851ca0b14bfed",
"assets/assets/icons/svg/github.svg": "8bdb408a35061ff06a35f048c21a1d3b",
"assets/assets/icons/svg/instagram.svg": "80a976056b25c7efcbc75e1153085dad",
"assets/assets/icons/svg/linkedin.svg": "103f01f45752945273a036fb886e5e5c",
"assets/assets/icons/svg/us.svg": "bc46c21d9093bc9351a34a781f137d04",
"assets/assets/icons/svg/whatsapp.svg": "732aff88946e42de3f73b5a65b716c3e",
"assets/assets/images/backgrounds/me.png": "c19395634376dec54737b82abfff161a",
"assets/assets/images/backgrounds/me2.jpg": "2adc46099323a9349148675675d2b6d7",
"assets/assets/video/world.mp4": "65f540518ecd387a64b1a751d4336659",
"assets/FontManifest.json": "93813078a455c749fad8291c11ce67e6",
"assets/fonts/MaterialIcons-Regular.otf": "064e3d8bbd6345d611d2442235bd429f",
"assets/NOTICES": "0623fe28c08a54310e5630f71b9b0351",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "8d1dd3f3715cd9db6965fa4db83c4787",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d0af1e9e35369e47260aac525556cb8b",
"/": "d0af1e9e35369e47260aac525556cb8b",
"main.dart.js": "c558763b248849831ab49455d6b08bb4",
"manifest.json": "d6ca57350173b3ccd7074f958253fbee",
"styles.css": "a0c6d0734d2732b3214ad1b5183f15e4",
"version.json": "c8f979d408e51acd1ee06f6af9b9722c"};
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
