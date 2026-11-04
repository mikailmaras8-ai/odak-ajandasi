const CACHE_NAME = 'odak-pwa-v7';
const STATIC_ASSETS = [
  './',
  'index.html',
  'manifest.json',
  'icons/icon-192.png',
  'icons/icon-512.png',
  'icons/apple-touch-icon.png',
  'sounds/rain.mp3',
  'sounds/forest.mp3',
  'sounds/cafe.mp3',
  'sounds/waves.mp3',
  'sounds/silence.m4a',
  'sounds/silence.mp3',
  'sounds/silence.wav'
];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(STATIC_ASSETS).catch((err) => {
        console.warn('PWA Asset önbelleğe alma:', err);
      });
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // 1. API çağrılarını ve Supabase bulut isteklerini doğrudan ağa gönder
  if (url.pathname.includes('/api/') || url.hostname.includes('supabase.co')) {
    return;
  }

  // 2. Gezinme (Sayfa Yükleme): Anında Önbellekten Aç
  if (event.request.mode === 'navigate' || (event.request.headers.get('accept') && event.request.headers.get('accept').includes('text/html'))) {
    event.respondWith(
      caches.match(event.request).then((cached) => {
        if (cached) return cached;
        return caches.match('./').then((rootCached) => {
          if (rootCached) return rootCached;
          return fetch(event.request).then((networkResponse) => {
            if (networkResponse && networkResponse.status === 200) {
              const toCache = networkResponse.clone();
              caches.open(CACHE_NAME).then((cache) => cache.put(event.request, toCache));
            }
            return networkResponse;
          }).catch(() => caches.match('index.html'));
        });
      })
    );
    return;
  }

  // 3. Statik dosyalar: Önbellek Öncelikli (Cache First)
  event.respondWith(
    caches.match(event.request).then((cached) => {
      if (cached) return cached;
      return fetch(event.request).then((response) => {
        if (!response || response.status !== 200 || response.type !== 'basic') {
          return response;
        }
        const toCache = response.clone();
        caches.open(CACHE_NAME).then((cache) => {
          cache.put(event.request, toCache);
        });
        return response;
      }).catch(() => cached);
    })
  );
});
