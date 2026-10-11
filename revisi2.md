Prompt untuk AI:

Hasil kodemu masih salah. Aplikasi berjalan di dalam frame 406x904, tetapi ukuran elemen di dalamnya (ikon, teks, search bar, dock) tidak proporsional, wallpaper tidak full menutupi layar, dan Search Bar menumpuk dengan Dock. 

Tolong ikuti instruksi arsitektur layout yang SANGAT KETAT ini. Jangan berimprovisasi. Gunakan struktur widget dan ukuran piksel yang saya tentukan di bawah ini agar hasilnya 100% persis seperti referensi Android Home Screen.

### 1. STRUKTUR DASAR (WAJIB)
Bungkus aplikasi dengan struktur berikut agar tampil seperti HP di Web:
`Center` -> `FittedBox(fit: BoxFit.contain)` -> `SizedBox(width: 406, height: 904)` -> `ClipRRect(borderRadius: BorderRadius.circular(0))` -> `Scaffold` (atau Container utama).

Di dalam `SizedBox` tersebut, gunakan `Stack` sebagai layer utama:
- Layer 1 (Paling Bawah): `Image.asset('assets/wallpaper.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity)`
- Layer 2 (Di Atasnya): `SafeArea` -> `Column`

### 2. PENGATURAN COLUMN (DARI ATAS KE BAWAH)
Di dalam `Column` pada Layer 2, susun elemen dengan urutan dan ukuran PERSIS seperti ini:

**A. Spacer Atas**
- Gunakan `SizedBox(height: 60)` untuk memberikan jarak dari status bar ke App Grid.

**B. App Grid (1 Baris, 4 Kolom)**
- Gunakan `Row` dengan `mainAxisAlignment: MainAxisAlignment.spaceEvenly`.
- Setiap ikon dibungkus `Column`.
- Ukuran Ikon: `width: 60, height: 60`.
- Jarak Ikon ke Teks: `SizedBox(height: 8)`.
- Ukuran Teks: `fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500`.
- Teks Label: "wondr by BNI", "DANA", "Shopee", "myIM3".
- Badge Notifikasi (Titik Merah): Gunakan `Stack` di atas ikon. Posisikan di `top: -5, right: -5`. Ukuran `width: 20, height: 20`, `color: Colors.red`, teks putih `fontSize: 10`.

**C. Spacer Tengah (Ruang Kosong untuk Wallpaper)**
- Gunakan `Spacer()` agar ruang ini mengisi sisa layar secara otomatis.

**D. Search Bar**
- Bungkus dengan `Padding(padding: EdgeInsets.symmetric(horizontal: 40))`.
- Ukuran: `width: double.infinity, height: 48`.
- Dekorasi: `color: Colors.black.withOpacity(0.4)`, `borderRadius: BorderRadius.circular(24)`.
- Isi: `Row` dengan `Icon(Icons.search, color: Colors.white, size: 20)` dan `SizedBox(width: 8)` dan `Text("Search", style: TextStyle(color: Colors.white, fontSize: 16))`.
- Berikan `marginBottom: 20` pada Search Bar agar tidak menempel ke Dock.

**E. Dock (1 Baris, 4 Kolom)**
- Gunakan `Row` dengan `mainAxisAlignment: MainAxisAlignment.spaceEvenly`.
- Berikan `padding: EdgeInsets.only(bottom: 24)` pada Row ini.
- Ukuran Ikon Dock: `width: 64, height: 64`.
- Ikon: Phone (Biru), Messages (Putih dengan badge merah angka 4), WhatsApp (Hijau), Camera (Gradasi Pelangi).
- Gunakan `Stack` untuk menempatkan badge notifikasi merah di atas ikon Messages.

### 3. PENGATURAN STATUS BAR
- Di dalam `main.dart`, panggil `SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light))` agar status bar transparan dan ikonnya putih.

### 4. LARANGAN KERAS
- JANGAN gunakan `SizedBox` dengan ukuran 1220x2712 di dalam kode UI.
- JANGAN gunakan `ListView` atau `GridView` untuk App Grid, cukup gunakan `Row` dan `Column` biasa karena hanya 1 baris.
- JANGAN biarkan elemen apapun saling menumpuk (overlap) kecuali badge notifikasi merah.

Tolong refactor kode Flutter saya sekarang berdasarkan instruksi di atas. Tampilkan kodenya secara lengkap.