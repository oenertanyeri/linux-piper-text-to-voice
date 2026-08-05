# Linux Piper TTS 🎙️

Linux sistemler için, Zenity arayüzü destekli, hafif ve hızlı bir metinden sese (Text-to-Speech / TTS) dönüştürme aracı. Arkada **Piper TTS** motorunu kullanarak yerel ve kaliteli ses sentezi gerçekleştirir.

## Özellikler
- 🚀 **Hafif ve Hızlı:** Sistem kaynaklarını yormayan sade yapı.
- 🪟 **Zenity Arayüzü:** Ekstra bağımlılık gerektirmeyen, temiz grafik pencereler.
- 📦 **Saf .deb Paketi:** Snap/Flatpak içermeyen, tamamen yerel Debian paket standardı.
- 🎵 **Ses Üretimi:** Metinleri hızlıca ses dosyalarına dönüştürme imkanı.

## Gereksinimler
- `piper`
- `zenity`

## Kurulum
İndirdiğiniz `.deb` paketini GDebi, QApt veya terminal üzerinden kurabilirsiniz:
```bash
sudo dpkg -i linux-piper-tts_1.0_all.deb
