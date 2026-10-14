import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player UI',
      // 1. Menggunakan ThemeData.dark()
      theme: ThemeData.dark(),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. AppBar dengan judul "Sedang memutar" & centerTitle: true
      appBar: AppBar(
        title: const Text('Sedang memutar'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // 3. Menempatkan Card di tengah layar
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          // 4. Properti Card (elevation: 4, shape: RoundedRectangleBorder)
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              // Padding di dalam Card
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  // Cover Album (menggunakan Ikon piringan hitam/music disc)
                  const Center(
                    child: Icon(
                      Icons.album,
                      size: 90,
                      color: Colors.blueGrey,
                    ),
                  ),
                  // SizedBox untuk meyakinkan jarak tetap antara gambar dan teks
                  const SizedBox(height: 20),
                  // Informasi lagu dan tombol like
                  Row(
                    children: [
                      // Informasi Teks (Judul Lagu & Artis)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Di sini ada judul lagu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4), // Jarak tetap antar teks
                          Text(
                            'Di sini ada nama artis',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // Spacer untuk mengatur jarak proporsional antara teks dan tombol
                      const Spacer(),
                      // Tombol Like
                      IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.redAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}