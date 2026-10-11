Prompt untuk AI:

Ada beberapa masalah besar pada hasil kode sebelumnya. Tolong perbaiki dengan instruksi SANGAT KETAT berikut ini. Jangan berimprovisasi.

### 1. PERBAIKI ERROR DI TERMINAL (Gambar 3)
Sistem menolak menimpa file `home_screen.dart` karena Anda belum membaca isinya secara utuh. 
Tolong lakukan langkah ini:
- Baca file `home_screen.dart` terlebih dahulu menggunakan fungsi `read_file`.
- Setelah membaca, gunakan fungsi `write_file` untuk menimpa seluruhnya, ATAU gunakan fungsi `replace` untuk mengedit bagian tertentu saja. Jangan gunakan perintah yang memicu error "Refusing to overwrite".

### 2. HAPUS PAKSAAN UKURAN (Hilangkan White Space)
Hapus struktur `Center -> FittedBox -> SizedBox(406, 904)`. 
Ubah menjadi layout responsif:
- Gunakan `Scaffold` langsung.
- Bungkus body dengan `Container` yang memiliki `decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/wallpaper.jpg'), fit: BoxFit.cover))`.
- Gunakan `MediaQuery.of(context).size` untuk mengambil lebar dan tinggi layar secara dinamis agar memenuhi seluruh area browser tanpa ruang kosong.

### 3. BUAT STATUS BAR PALSU (Navbar Atas)
Karena ini berjalan di Web, kita harus membuat status bar manual agar mirip HP Android.
- Di dalam `SafeArea`, buat `Row` paling atas dengan `padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)`.
- Sisi Kiri: `Text("3:34", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))` dan ikon notifikasi kecil (Telegram, WA, Gmail) menggunakan `Icon(Icons.circle, size: 10)`.
- Sisi Kanan: `Text("0.03 KB/s", style: TextStyle(color: Colors.white, fontSize: 12))`, `Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16)`, `Icon(Icons.wifi, color: Colors.white, size: 16)`, `Icon(Icons.battery_full, color: Colors.white, size: 16)`, dan `Text("97", style: TextStyle(color: Colors.white, fontSize: 12))`.
- Gunakan `MainAxisAlignment.spaceBetween` pada Row ini.

### 4. PERBAIKI APP GRID (Ikon Atas)
- Gunakan `Padding(padding: EdgeInsets.only(top: 40))` sebelum Grid.
- Gunakan `Row` dengan `mainAxisAlignment: MainAxisAlignment.spaceEvenly`.
- Setiap ikon dibungkus `Column`.
- Ukuran Ikon: `width: 70, height: 70` (perbesar dari sebelumnya).
- Gunakan `Stack` untuk badge notifikasi:
  - Posisi badge: `Positioned(top: -5, right: -5)`.
  - Ukuran badge: `width: 22, height: 22`.
  - Warna: `Colors.red`. Teks di dalamnya: `fontSize: 12, color: Colors.white`.
- Jarak Ikon ke Teks: `SizedBox(height: 8)`.
- Ukuran Teks Label: `fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500`.
- Teks Label: "wondr by BNI", "DANA", "Shopee", "myIM3".
- Pastikan Ikon DANA memiliki badge "1", Shopee badge "99", myIM3 badge titik merah.

### 5. PERBAIKI SEARCH BAR & DOCK (Bawah)
- Gunakan `Spacer()` di antara App Grid dan Search Bar agar ruang kosong mengisi sisa layar secara otomatis.
- **Search Bar:** 
  - `Padding(padding: EdgeInsets.symmetric(horizontal: 50))`.
  - `Container(height: 50, decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(25)))`.
  - Isi: `Row` dengan `Icon(Icons.search, color: Colors.white)` dan `Text("Search", style: TextStyle(color: Colors.white, fontSize: 16))`.
- **Dock:**
  - Berikan `SizedBox(height: 20)` setelah Search Bar.
  - Gunakan `Row` dengan `mainAxisAlignment: MainAxisAlignment.spaceEvenly`.
  - Berikan `padding: EdgeInsets.only(bottom: 30)`.
  - Ukuran Ikon Dock: `width: 70, height: 70`.
  - Ikon: Phone (Biru), Messages (Putih, badge merah "4"), WhatsApp (Hijau), Camera (Pelangi).
  - Gunakan `Stack` untuk badge merah "4" di atas ikon Messages.

### 6. WALLPAPER & TEKS
- Pastikan gambar wallpaper yang digunakan adalah yang memiliki teks "I want to see the ending with you".
- Jika gambar tidak muncul, pastikan file gambar sudah ada di folder `assets` dan didaftarkan di `pubspec.yaml`.

Tolong refactor kode `home_screen.dart` sekarang dengan instruksi di atas. Tampilkan kode lengkapnya.