# ResepKu - Aplikasi Resep Makanan

## Deskripsi

ResepKu adalah aplikasi mobile berbasis Flutter yang menggunakan API TheMealDB untuk mencari dan menampilkan resep makanan. Pengguna dapat melihat informasi resep, gambar makanan, bahan-bahan, dan instruksi memasak.

Aplikasi ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) dengan menerapkan integrasi API, pengolahan data JSON, dan asynchronous programming pada Flutter.

## Fitur Utama

- Mencari resep makanan berdasarkan nama.
- Menampilkan gambar dan nama resep.
- Menampilkan kategori dan asal masakan.
- Melihat detail resep makanan.
- Menampilkan daftar bahan dan instruksi memasak.
- Menampilkan indikator loading saat mengambil data.
- Menangani kesalahan saat mengambil data dari API.

## Teknologi yang Digunakan

- **Flutter** sebagai framework aplikasi mobile.
- **Dart** sebagai bahasa pemrograman.
- **http** untuk mengirim permintaan HTTP ke API.
- **dart:convert** untuk mengolah data JSON.
- **FutureBuilder** untuk menampilkan kondisi proses asynchronous.
- **TheMealDB API** sebagai sumber data resep makanan.

## Struktur Project

```text
lib/
├── main.dart
├── models/
│   └── meal.dart
├── services/
│   └── meal_service.dart
└── screens/
    ├── home_page.dart
    └── meal_detail_page.dart
```

## API yang Digunakan

API pencarian resep:

https://www.themealdb.com/api/json/v1/1/search.php?s=chicken

API detail resep:

https://www.themealdb.com/api/json/v1/1/lookup.php?i=52795

Dokumentasi API:

https://www.themealdb.com/docs_api_guide.php

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terpasang.
2. Clone repository atau unduh source code project.
3. Buka folder project di Android Studio atau Visual Studio Code.
4. Jalankan perintah berikut di terminal:

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi menggunakan perintah:

   ```bash
   flutter run
   ```

Aplikasi membutuhkan koneksi internet untuk mengambil data resep dari TheMealDB.

## Pengembang

- Nama: Bahrul Ulum Azhari
- NIM: 240605110064
- Program Studi: Teknik Informatika
- Mata Kuliah: Mobile Programming
