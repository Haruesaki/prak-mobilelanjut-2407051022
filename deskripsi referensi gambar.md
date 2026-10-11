# Deskripsi Referensi UI: Layar Utama Smartphone Android (Home Screen)

**Konteks:** Gambar ini adalah referensi visual untuk perbaikan layout aplikasi Flutter. Fokus utama adalah pada penataan grid aplikasi, search bar, dan dock yang tidak boleh saling tumpang tindih (overlap).

## 1. Informasi Global
- **Orientasi:** Portrait (Vertikal).
- **Rasio Aspek:** Standar smartphone modern (sekitar 9:20).
- **Tipe Layar:** Android Home Screen (Launcher).
- **Navigasi:** Menggunakan gesture navigation (terlihat garis horizontal tipis di bagian paling bawah layar).

## 2. Wallpaper (Latar Belakang)
- **Tipe:** Full-screen (menutupi seluruh area di belakang ikon dan widget).
- **Gaya:** Digital art / Anime.
- **Visual:** 
  - Langit senja dengan awan berwarna oranye, kuning, dan biru.
  - Matahari/moon besar berwarna putih kekuningan di tengah atas.
  - Sosok pria berjaket putih panjang menghadap ke kanan bawah (membelakangi kamera).
  - Rumput tinggi di bagian depan (foreground).
- **Teks di Wallpaper:** Tulisan tangan berwarna putih di bagian atas tengah: "I want to see the ending with you."
- **Watermark:** Teks "okioeee" di pojok kiri bawah.

## 3. Status Bar (Bagian Paling Atas)
- **Posisi:** Menempel di tepi atas layar, transparan.
- **Sisi Kiri:** 
  - Jam digital: "3:34".
  - Ikon notifikasi: Telegram (pesawat kertas), WhatsApp, Gmail (huruf 'M'), dan sebuah titik notifikasi.
- **Sisi Kanan:**
  - Kecepatan jaringan: "0.03 KB/s".
  - Sinyal seluler: 4 bar penuh.
  - Ikon Wi-Fi: Aktif.
  - Baterai: Angka "97" di dalam ikon baterai.

## 4. App Grid (Bagian Atas)
- **Layout:** 1 baris, 4 kolom.
- **Posisi:** Berada di area atas layar, di bawah status bar.
- **Detail Ikon (dari kiri ke kanan):**
  1. **wondr by BNI:** Latar kuning-hijau, teks "wondr" berwarna oranye. Tanpa badge notifikasi.
  2. **DANA:** Latar biru bulat dengan logo gelombang putih. Memiliki badge notifikasi merah bertuliskan angka "1".
  3. **Shopee:** Latar oranye dengan logo tas belanja putih dan teks "99" di bawahnya. Memiliki titik notifikasi merah.
  4. **myIM3:** Latar kuning dengan teks "myIM3". Memiliki titik notifikasi merah di atasnya.

## 5. Search Bar (Bagian Tengah)
- **Posisi:** Melayang (floating) di bagian tengah bawah layar, tepat di atas dock.
- **Bentuk:** Pill (kapsul) dengan sudut membulat penuh.
- **Warna:** Hitam transparan (semi-transparan/gelap).
- **Isi:** Ikon kaca pembesar (magnifying glass) berwarna putih di sebelah kiri, dan teks "Search" berwarna putih.
- **Catatan Penting:** Search bar ini TIDAK menumpuk (overlap) dengan App Grid di atasnya maupun Dock di bawahnya. Ada jarak yang jelas.

## 6. Dock / Bottom Bar (Bagian Bawah)
- **Layout:** 1 baris, 4 kolom.
- **Posisi:** Menempel di bagian bawah layar, di bawah search bar.
- **Detail Ikon (dari kiri ke kanan):**
  1. **Phone:** Latar biru bulat, ikon telepon putih. Tanpa badge.
  2. **Messages:** Latar putih bulat, ikon gelembung chat biru. Memiliki badge notifikasi merah bertuliskan angka "4".
  3. **WhatsApp:** Latar hijau bulat, ikon telepon putih di dalam gelembung chat. Tanpa badge.
  4. **Kamera/Lens:** Latar bulat dengan gradasi warna pelangi (merah, kuning, hijau, biru). Tanpa badge.

## 7. Page Indicator (Indikator Halaman)
- **Status:** TIDAK ADA titik-titik (dots) indikator halaman yang terlihat di layar ini. Layar terlihat bersih dari indikator halaman.

## 8. Metrik Layout & Spacing (Estimasi untuk Flutter)
- **Jarak Status Bar ke App Grid:** Sekitar 5-8% dari tinggi layar.
- **Jarak App Grid ke Search Bar:** Sekitar 20-30% dari tinggi layar (ruang kosong yang cukup luas untuk menampilkan wallpaper).
- **Jarak Search Bar ke Dock:** Sekitar 10-15px (jarak yang cukup agar tidak overlap).
- **Ukuran Ikon:** Standar ikon aplikasi Android (biasanya 48dp - 64dp).
- **Spasi antar Ikon (Horizontal & Vertikal):** Seragam (uniform), sekitar 16dp - 24dp.
- **Margin Kiri/Kanan Grid & Dock:** Sekitar 16dp - 20dp dari tepi layar.

## 9. Kesimpulan Layout untuk AI
Layout ini menggunakan struktur **Column** dengan pembagian:
1. Status Bar (System UI).
2. Spacer (Area kosong untuk wallpaper).
3. GridView (1 baris, 4 kolom) untuk aplikasi utama.
4. Spacer (Area kosong).
5. Search Bar (Widget melayang).
6. Spacer (Jarak kecil).
7. Row (4 ikon) untuk Dock.
8. Navigation Bar (System UI).
Pastikan tidak ada widget yang saling menimpa (overlap) dan semua elemen memiliki padding yang konsisten.