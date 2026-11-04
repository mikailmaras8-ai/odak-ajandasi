#!/bin/bash
cd "/Users/mikailmaras/.gemini/antigravity/scratch/odak-ajandasi"

echo "========================================================"
echo "🚀 Odak Ajandası - GitHub'a Yükleme Aracı"
echo "========================================================"
echo ""
echo "📌 ÖNEMLİ BİLGİ:"
echo "GitHub güvenlik nedeniyle normal hesap şifrenizi KABUL ETMEZ."
echo "Bunun yerine tek seferlik bir 'Erişim Token'ı' (ghp_...) ister."
echo ""
echo "Token'ı 10 saniyede almak için şu bağlantıya tıklayın:"
echo "👉 https://github.com/settings/tokens/new?scopes=repo&description=odak-ajandasi"
echo ""
echo "(Açılan sayfada gerekli kutucuklar zaten seçilidir."
echo "En alttaki yeşil 'Generate token' butonuna basın ve çıkan kodu kopyalayın.)"
echo ""
read -p "🔑 Kopyaladığınız token'ı buraya yapıştırıp Enter'a basın: " GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
  echo "⚠️ Token girilmedi, işlem iptal edildi."
  read -p "Çıkmak için Enter'a basın..."
  exit 1
fi

GITHUB_TOKEN=$(echo "$GITHUB_TOKEN" | xargs)

echo "⏳ Kodlar GitHub'a yükleniyor, lütfen bekleyin..."
git push -u "https://mikailmaras8-ai:${GITHUB_TOKEN}@github.com/mikailmaras8-ai/odak-ajandasi.git" main

if [ $? -eq 0 ]; then
  git remote set-url origin https://github.com/mikailmaras8-ai/odak-ajandasi.git
  
  git credential-osxkeychain store <<EOF
protocol=https
host=github.com
username=mikailmaras8-ai
password=${GITHUB_TOKEN}
EOF

  echo ""
  echo "========================================================"
  echo "🎉 HARİKA! Kodlar başarıyla GitHub'a yüklendi!"
  echo "🌐 Depo: https://github.com/mikailmaras8-ai/odak-ajandasi"
  echo "========================================================"
  echo ""
  echo "Sitenizi 7/24 yayına almak için son adım:"
  echo "1. GitHub'da deponuzu açın: https://github.com/mikailmaras8-ai/odak-ajandasi"
  echo "2. Üstteki 'Settings' sekmesine tıklayın."
  echo "3. Sol menüden 'Pages' seçeneğine tıklayın."
  echo "4. 'Branch' altından 'main' seçip 'Save' butonuna basın."
  echo "5. 1-2 dakika sonra siteniz yayında: https://mikailmaras8-ai.github.io/odak-ajandasi/"
  echo ""
else
  echo ""
  echo "⚠️ Yükleme başarısız oldu. Lütfen token'ı doğru kopyaladığınızdan emin olun."
fi

echo ""
read -p "Pencereyi kapatmak için Enter'a basın..."
