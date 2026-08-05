#!/bin/bash

# 1. Kullanıcıdan metin alan grafik pencere
metin=$(zenity --entry --title="Metinden Sese (Piper AI)" --text="Seslendirmek istediğiniz metni buraya yazın:" --width=500)

# Eğer metin boş değilse işlem yap
if [ -n "$metin" ]; then
    
    # 2. Python kullanarak metni TTS motoru için optimize et:
    # - Noktalama işaretlerini boşlukla değiştir (takılmayı önler)
    # - Birden fazla boşlukları teke indir
    temiz_metin=$(python3 -c '
import re, sys
text = sys.argv[1]
# Okuma motorunun takılacağı noktalama ve özel karakterleri temizle
text = re.sub(r"[.,;:!?\"()\[\]{}\*\-/|_+=~`<>@#$%^&\\타]", " ", text)
# Art arda oluşan fazla boşlukları düzelt
text = " ".join(text.split())
print(text)
' "$metin")

    # 3. Dil ve Ses Seçimi için küçük bir menü
    dil=$(zenity --list --title="Dil ve Ses Seçimi" --column="Kod" --column="Dil / Model" \
        tr "Türkçe (Doğal AI - Mehmet)" \
        en "İngilizce (Doğal AI - Lessac)" \
        de "Almanca (Doğal AI - Thorsten)" \
        --width=350 --height=220)
    
    if [ -n "$dil" ]; then
        # Seçilen dile göre .onnx model dosyasının yolunu belirle
        model_yolu=""
        if [ "$dil" = "tr" ]; then
            model_yolu="$HOME/.local/share/piper-voices/tr_TR-dfki-medium.onnx"
        elif [ "$dil" = "en" ]; then
            model_yolu="$HOME/.local/share/piper-voices/en_US-lessac-medium.onnx"
        elif [ "$dil" = "de" ]; then
            model_yolu="$HOME/.local/share/piper-voices/de_DE-thorsten-medium.onnx"
        fi

        # 4. Kaydedilecek dosya adını sor
        dosya=$(zenity --file-selection --save --confirm-overwrite --filename="kayit.wav" --title="Ses Dosyasını Kaydet")
        
        if [ -n "$dosya" ] && [ -n "$model_yolu" ]; then
            # Optimize edilmiş metni Piper Yapay Zeka motoruyla ses dosyasına çevir
            echo "$temiz_metin" | piper --model "$model_yolu" --output_file "$dosya"
            zenity --info --title="İşlem Tamam" --text="Yapay zeka sesiyle optimize edilerek kaydedildi:\n$dosya"
        fi
    fi
fi
