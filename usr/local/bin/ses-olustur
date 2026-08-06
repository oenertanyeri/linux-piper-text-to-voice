#!/bin/bash

# 1. Kullanıcıdan metin al
metin=$(zenity --text-info --editable --title="Metinden Sese (Piper AI)" --text="Seslendirmek istediğiniz metni buraya yapıştırın:" --width=600 --height=400)

if [ -n "$metin" ]; then

    # 2. Dil ve Ses Seçimi
    dil=$(zenity --list --title="Dil ve Ses Seçimi" --column="Kod" --column="Dil / Model" \
        tr "Türkçe (Doğal AI - Mehmet)" \
        en "İngilizce (Doğal AI - Lessac)" \
        de "Almanca (Doğal AI - Thorsten)" \
        --width=350 --height=220)
    
    if [ -n "$dil" ]; then
        model_yolu=""
        if [ "$dil" = "tr" ]; then
            model_yolu="$HOME/.local/share/piper-voices/tr_TR-dfki-medium.onnx"
        elif [ "$dil" = "en" ]; then
            model_yolu="$HOME/.local/share/piper-voices/en_US-lessac-medium.onnx"
        elif [ "$dil" = "de" ]; then
            model_yolu="$HOME/.local/share/piper-voices/de_DE-thorsten-medium.onnx"
        fi

        # 3. Kayıt yeri
        dosya=$(zenity --file-selection --save --confirm-overwrite --filename="kayit.wav" --title="Ses Dosyasını Kaydet")
         
        if [ -n "$dosya" ] && [ -n "$model_yolu" ]; then
            
            # 4. Metni tamamen düzleştir ve doğrudan Piper'a ver
            temiz_metin=$(echo "$metin" | tr '\n' ' ' | tr -s ' ')
            
            echo "$temiz_metin" | /usr/local/piper/piper --model "$model_yolu" --output_file "$dosya"
            
            zenity --info --title="İşlem Tamam" --text="Yapay zeka sesi başarıyla oluşturuldu:\n$dosya"
        fi
    fi
fi
