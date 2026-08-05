# Linux Piper TTS 🎙️

Linux sistemler için, Zenity arayüzü destekli, hafif ve hızlı bir metinden sese (Text-to-Speech / TTS) dönüştürme aracı. Piper TTS motorunu arkada kullanarak hızlı ve kaliteli ses sentezi gerçekleştirir.

## Özellikler
- 🚀 **Hafif ve Hızlı:** Ağır Python kütüphaneleri veya karmaşık servisler yerine doğrudan Piper motorunu kullanır.
- 🪟 **Zenity Grafik Arayüzü:** Ekstra bağımlılık gerektirmeyen, temiz ve sade pencereler.
- 📦 **Yerel .deb Paketi:** Sistem kararlılığını bozmayan, Snap/Flatpak barındırmayan saf Debian paket yapısı.
- 🎵 **Ses Üretimi:** Yazdığınız metinleri anında ses dosyalarına dönüştürün.

## Gereksinimler
- `piper-tts` (Sistemde kurulu olmalıdır)
- `zenity` (Grafik arayüz pencereleri için)

## Kurulum (.deb ile)

Sisteminizde QApt veya GDebi kullanarak ya da terminal üzerinden kolayca kurabilirsiniz:

```bash
sudo dpkg -i linux-piper-tts_1.0_all.deb
sudo apt-get install -f # Eksik bağımlılıklar için
