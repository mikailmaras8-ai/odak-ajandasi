#!/bin/bash
cd "$(dirname "$0")"
echo "=================================================="
echo "🚀 Odak Ajandası - GitHub'a Yükleme Aracı"
echo "=================================================="
echo ""
echo "1. Dosyalar kontrol ediliyor..."
git status -s
echo ""
echo "2. GitHub'a gönderiliyor..."
git push -u origin main
if [ $? -eq 0 ]; then
  echo ""
  echo "=================================================="
  echo "✅ TEBRİKLER! Kodlar başarıyla GitHub'a yüklendi!"
  echo "🌐 Depo: https://github.com/mikailmaras8-ai/odak-ajandasi"
  echo "=================================================="
  echo ""
  echo "Şimdi yapmanız gereken son adım:"
  echo "1. Depo sayfasında üstteki 'Settings' sekmesine tıklayın."
  echo "2. Soldaki menüden 'Pages' seçin."
  echo "3. 'Branch' altından 'main' seçip 'Save' butonuna basın."
  echo "4. Siteniz 1-2 dakika içinde yayında: https://mikailmaras8-ai.github.io/odak-ajandasi/"
else
  echo ""
  echo "⚠️ Yükleme tamamlanamadı."
  echo "Lütfen önce https://github.com/new adresinden 'odak-ajandasi' adıyla boş bir depo oluşturduğunuzdan emin olun."
fi
echo ""
read -p "Pencereyi kapatmak için Enter'a basın..."
