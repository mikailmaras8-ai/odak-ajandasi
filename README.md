# 🌿 Odak Ajandası (Focus Agenda - PWA)

Modern, minimalist ve derin odaklanma sağlayan; **Progressive Web App (PWA)**, **MediaSession API**, **Web Audio API** ve **Gerçek Zamanlı MQTT WebSockets** mimarisiyle geliştirilmiş tam teşekküllü Pomodoro, görev planlama ve sosyal odak takip platformu.

---

### 🌐 Canlı Demo & Kaynak Kodları
* 🚀 **Canlı Uygulama (GitHub Pages):** [https://mikailmaras8-ai.github.io/odak-ajandasi/](https://mikailmaras8-ai.github.io/odak-ajandasi/)
* 📦 **GitHub Deposu:** [https://github.com/mikailmaras8-ai/odak-ajandasi](https://github.com/mikailmaras8-ai/odak-ajandasi)

---

## 🎯 Projenin Amacı ve Çözülen Problem

Günümüz çalışma ve öğrenme ortamında dikkat dağınıklığı, multitasking ve erteleme (procrastination) en büyük verimlilik engelleridir. **Odak Ajandası**, kullanıcıların dikkatini dağıtmadan derin odaklanma (*Deep Work*) durumuna geçmelerini sağlamak amacıyla şu temel ilkeler üzerine kurulmuştur:
1. **Sıfır Kurulum Engeli:** Herhangi bir App Store/Play Store zorunluluğu olmaksızın, her cihazda (iOS, Android, macOS, Windows) tek tıkla kurulan ve çevrimdışı çalışan PWA mimarisi.
2. **Kesintisiz Kilit Ekranı Deneyimi:** Telefon ekranı kilitlendiğinde veya başka uygulamaya geçildiğinde odaklanmanın bozulmaması için arka planda çalışan dinamik kilit ekranı widget'ı.
3. **Sosyal Sorumluluk & Oyunlaştırma:** Yetiştirilen sanal ağaçlar, orman ekosistemi ve arkadaşlarla gerçek zamanlı haftalık yarış kürsüsü.

---

## ✨ Öne Çıkan İnovatif Özellikler & Teknik Çözümler

### 1. ⏱️ Kilit Ekranında Canlı Sayaç & Canlı Kapak Motoru (MediaSession + Canvas API)
* Mobil tarayıcılarda sekme arka plana atıldığında JavaScript zamanlayıcılarının kısılması (*throttle*) veya durdurulması problemi, **HTML5 Audio Loop + MediaSession API** entegrasyonuyla aşılmıştır.
* Arka planda çalışan 512×512 dinamik **HTML5 Canvas motoru**, kalan süreyi, dairesel neon zümrüt ilerleme halkasını ve odaklanılan görevin adını saniye saniye işleyerek telefonun kilit ekranındaki medya kartına canlı kapak görseli olarak yansıtır.

### 2. 🎧 Akıllı Ambiyans Sesleri Yaşam Döngüsü (Web Audio API)
* Yağmur, Kafe, Orman ve Okyanus dalgaları gibi yüksek kaliteli ambiyans frekansları mevcuttur.
* Kullanıcı sadece sesleri test ediyorsa sayfa değiştirdiğinde veya uygulamadan çıktığında sesler otomatik durdurulur; ancak **aktif odaklanma seansı başlatılmışsa**, kullanıcı diğer sekmelere geçse veya telefonunu kilitlese bile ses kesintisiz çalmaya devam eder.

### 3. 👥 Gerçek Zamanlı Bulut Arkadaş Eşleşmesi (MQTT over WebSockets)
* Kullanıcıların e-posta/şifre ile üye olma bariyerine takılmaması için her cihaza kalıcı ve benzersiz bir davet kodu (`ODAK-XXXX`) atanır.
* Güvenli WebSocket MQTT protokolü (`broker.emqx.io` & `broker.hivemq.com`) kullanılarak **çift yönlü otomatik eşleşme (two-way pairing)** sağlanır. A kullanıcısı B kullanıcısını eklediğinde, her iki cihaz birbirinin haftalık odak sürelerini, ağaç sayılarını ve durumlarını anında senkronize eder.
* Arkadaş listesinden anlık canlı motivasyon tezahüratları (☕ Kahve Ismarla, 🙌 Tebrik Et, 🔥 Ateşle) gönderilebilir.

### 4. 🌲 Oyunlaştırılmış Sanal Orman (Forest & Pomodoro Gamification)
* Başarıyla tamamlanan her odak seansı gerçek bir ağaç (Meşe, Çam, Bonsai, Kiraz Ağacı, Baobab vb.) olarak kullanıcının görsel ormanına eklenir.
* Süre dolmadan pes edilirse ağaç kurur (🥀); bu mekanizma kullanıcıda odaklanma disiplini ve sorumluluk bilinci oluşturur.

### 5. ⚡ %100 Çevrimdışı Çalışma (Progressive Web App - Service Worker v13)
* `sw.js` üzerinden uygulanan **Cache-First** ve **Network-Fallback** stratejileriyle tüm ses dosyaları, ikonlar ve uygulama kodları yerel cihazda önbelleğe alınır. İnternet bağlantısı tamamen kesilse bile uygulama tam performansla çalışır.

---

## 🛠️ Kullanılan Teknolojiler

| Alan | Teknoloji / Kütüphane | Açıklama |
| :--- | :--- | :--- |
| **Ön Yüz (Frontend)** | HTML5, CSS3, Modern ES6+ JavaScript | Sıfır bağımlılık (Vanilla JS) ile maksimum hız ve hafiflik (~1 MB) |
| **PWA & Offline** | Service Workers API, CacheStorage, Web App Manifest | Mobil uygulama deneyimi, bağımsız pencere (`standalone`), offline çalışma |
| **Arka Plan & Kilit Ekranı** | MediaSession API, HTML5 Canvas 2D Context | Kilit ekranında canlı geri sayım, oynatıcı kontrolleri ve dinamik kapak |
| **Ses Motoru** | HTML5 Audio, Web Audio API | Çok kanallı arka plan ambiyans döngüleri ve kesintisiz odak müziği |
| **Gerçek Zamanlı Ağ** | Paho MQTT WebSockets (WSS / Port 8084) | Girişsiz, cihazlar arası anlık bulut eşleşmesi ve canlı liderlik tablosu |
| **Veri Kalıcılığı** | LocalStorage + JSON Schema | Yerel verilerin hızlı, güvenilir ve asenkron formatta saklanması |
| **Dağıtım (DevOps)** | GitHub Actions + GitHub Pages | Otomatik derleme, sürüm kontrolü ve global CDN dağıtımı |

---

## 📁 Dosya Yapısı

```text
odak-ajandasi/
├── index.html                           # Tüm arayüz, stiller ve istemci mimarisini barındıran ana uygulama
├── sw.js                                # Çevrimdışı desteği ve önbellek yönetimi sağlayan Service Worker (v13)
├── manifest.json                        # PWA kurulum ve tema meta verileri
├── mqttws31.min.js                      # Çevrimdışı yerel MQTT WebSocket istemci kütüphanesi
├── .nojekyll                            # GitHub Pages statik dosya uyumluluk yapılandırması
├── icons/                               # Farklı çözünürlükler için PWA ikonları (192x192, 512x512)
├── sounds/                              # Ambiyans sesleri (rain, cafe, waves, forest, silence)
├── ODAK_AJANDASI_PROJE_VE_SUNUM_REHBERI.md # 10 Slaytlık hazır sunum şablonu ve konuşmacı notları
├── ODAK_AJANDASI_TUM_KONUSMALAR.md       # Proje geliştirme sürecinin 139 adımlık eksiksiz arşiv günlüğü
└── README.md                            # Proje teknik dokümantasyonu ve rehberi
```

---

## 💻 Yerel Geliştirme ve İnceleme

Projeyi yerel bilgisayarınızda klonlamak ve çalıştırmak için:

```bash
# 1. Depoyu klonlayın
git clone https://github.com/mikailmaras8-ai/odak-ajandasi.git
cd odak-ajandasi

# 2. Basit bir HTTP yerel sunucu başlatın
python3 -m http.server 8080

# 3. Tarayıcınızda açın
http://localhost:8080
```

---

## 📱 Mobil Kurulum Adımları (PWA)

* **iOS (Safari):** Siteyi açın ➔ Paylaş (Share) butonuna dokunun ➔ *"Ana Ekrana Ekle"* seçeneğini seçin.
* **Android (Chrome):** Siteyi açın ➔ Sağ üstteki üç noktaya dokunun ➔ *"Uygulamayı Yükle"* veya *"Ana Ekrana Ekle"* deyin.

---

## 📄 Lisans
Bu proje MIT Lisansı altında açık kaynak olarak geliştirilmiştir.
