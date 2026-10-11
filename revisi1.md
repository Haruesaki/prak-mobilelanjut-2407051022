# Analisis Komparatif & Instruksi Perbaikan Layout Flutter
**Tujuan:** Memperbaiki tampilan UI (Gambar 1) agar 100% identik dengan referensi (Gambar 2).
**Catatan untuk AI:** Gambar 1 adalah hasil render di browser web (localhost), sedangkan Gambar 2 adalah tampilan di perangkat Android fisik. Abaikan UI browser (title bar, URL bar) pada Gambar 1. Fokuslah pada area konten (viewport).

## 1. Perbandingan Elemen Visual (Gambar 1 vs Gambar 2)

### A. Wallpaper & Background
- **Gambar 1 (Hasil):** Wallpaper terpotong (cropped). Teks "I want to see the ending with you" tidak terlihat. Posisi pria dan matahari bergeser ke bawah.
- **Gambar 2 (Referensi):** Wallpaper full-screen. Teks terlihat jelas di atas. Posisi matahari dan pria berada di tengah secara proporsional.

### B. Status Bar
- **Gambar 1:** Hanya menampilkan jam (3:34) dan beberapa ikon. Tidak ada indikator sinyal, Wi-Fi, atau baterai.
- **Gambar 2:** Menampilkan jam, ikon notifikasi (Telegram, WhatsApp, Gmail), kecepatan jaringan (0.03 KB/s), sinyal seluler penuh, Wi-Fi, dan baterai (97).

### C. App Grid (Baris Ikon Atas)
- **Gambar 1:** 
  - Ukuran ikon terlalu kecil.
  - Label teks: "wondr", "DANA", "99", "myIM3".
  - Jarak antar ikon terlalu rapat.
  - Posisi grid terlalu ke atas (menempel ke status bar).
- **Gambar 2:** 
  - Ukuran ikon lebih besar (standar ikon Android).
  - Label teks: "wondr by BNI", "DANA", "Shopee", "myIM3".
  - Jarak antar ikon proporsional.
  - Posisi grid berada di sepertiga atas layar, memiliki jarak yang pas dari status bar.

### D. Search Bar
- **Gambar 1:** 
  - Lebar search bar hampir memenuhi seluruh layar (margin kiri-kanan sangat kecil).
  - Posisi terlalu ke bawah, hampir menempel dengan Dock.
  - Warna latar abu-abu transparan.
- **Gambar 2:** 
  - Lebar search bar lebih sempit (memiliki margin kiri-kanan yang jelas).
  - Posisi melayang di tengah bawah, memiliki jarak vertikal yang cukup dengan Dock.
  - Warna latar hitam transparan dengan sudut membulat (pill shape).

### E. Dock (Baris Ikon Bawah)
- **Gambar 1:** 
  - Ikon: Telepon, Pesan, Kamera (Hijau), Kamera (Pelangi).
  - Ukuran ikon terlihat kecil.
  - Jarak antara Search Bar dan Dock sangat dekat (hampir menumpuk).
- **Gambar 2:** 
  - Ikon: Telepon, Pesan, WhatsApp, Kamera (Pelangi).
  - Ukuran ikon lebih besar (standar Android).
  - Jarak antara Search Bar dan Dock memiliki spacing yang jelas.

### F. Page Indicator
- **Gambar 1:** Tidak ada.
- **Gambar 2:** Tidak ada (layar bersih).

---

## 2. Instruksi Perbaikan untuk Kode Flutter
*AI harus mengubah kode berdasarkan poin-poin di bawah ini.*

### Perbaikan 1: Layout Utama & Spacing
- Gunakan widget `SafeArea` untuk memastikan konten tidak tertutup oleh status bar atau navigation bar.
- Gunakan `Column` dengan `MainAxisAlignment.spaceBetween` atau `Spacer` untuk membagi layar menjadi beberapa zona: Atas (Grid), Tengah (Kosong untuk wallpaper), Bawah (Search + Dock).
- **Jangan** menggunakan `Stack` untuk menumpuk Search Bar dan Dock secara sembarangan. Gunakan `Column` agar mereka memiliki jarak vertikal yang tetap.

### Perbaikan 2: App Grid (Atas)
- Ubah ukuran ikon grid menjadi lebih besar (misal: `width: 60`, `height: 60` atau sesuaikan dengan `MediaQuery`).
- Tambahkan `Padding` pada bagian atas grid agar tidak menempel ke status bar (misal: `paddingTop: 50`).
- Perbaiki teks label: Ubah "wondr" menjadi "wondr by BNI" dan "99" menjadi "Shopee".
- Pastikan jarak horizontal antar ikon menggunakan `MainAxisAlignment.spaceEvenly` atau `spaceAround` di dalam `Row`.

### Perbaikan 3: Search Bar
- Kurangi lebar Search Bar. Gunakan `Padding` horizontal (kiri-kanan) sekitar `20.0` hingga `30.0` agar tidak memenuhi layar.
- Ubah warna latar menjadi hitam transparan (`Colors.black.withOpacity(0.5)`).
- Berikan `margin` bawah pada Search Bar agar tidak menempel dengan Dock (misal: `marginBottom: 20`).

### Perbaikan 4: Dock (Bawah)
- Ubah ikon Kamera (Hijau) menjadi ikon WhatsApp (atau sesuaikan dengan aset yang tersedia).
- Perbesar ukuran ikon Dock agar setara dengan ukuran ikon App Grid.
- Berikan `padding` bawah pada Dock agar tidak menempel ke tepi layar.

### Perbaikan 5: Wallpaper
- Gunakan `BoxFit.cover` pada widget `Image` untuk wallpaper.
- Pastikan wallpaper dirender sebagai layer paling bawah (menggunakan `Stack` atau `Container` dengan `decoration: BoxDecoration(image: ...)`).
- Pastikan teks "I want to see the ending with you" terlihat dengan mengatur `Alignment` wallpaper ke `Alignment.topCenter` atau menyesuaikan `fit` gambar.

### Perbaikan 6: Status Bar
- Gunakan `SystemChrome.setSystemUIOverlayStyle` di `main.dart` untuk memastikan status bar transparan dan ikon berwarna putih (karena wallpaper gelap).

## 3. Kesimpulan Layout yang Diharapkan (Struktur Widget)
```text
Scaffold
 └── Container (Wallpaper: BoxFit.cover)
      └── SafeArea
           └── Column
                ├── SizedBox (Spacer atas)
                ├── Row (App Grid: 4 ikon, spaceEvenly, padding horizontal)
                ├── Spacer (Ruang kosong besar untuk wallpaper)
                ├── Padding (Search Bar: margin horizontal 24, margin bottom 16)
                └── Row (Dock: 4 ikon, spaceEvenly, padding bottom)