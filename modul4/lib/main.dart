
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MusicPage(),
    );
  }
}

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),

      body: const Center(
        child: Text(
          'Pemutar Musik',
          style: TextStyle(fontSize: 24),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        color: Colors.black54,
        child: Row(
          children: [
            // Tombol Shuffle
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle,
                  color: Colors.white,
                ),
                iconSize: 28,
                tooltip: 'Shuffle',
              ),
            ),

            // Tombol Previous
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                ),
                iconSize: 28,
                tooltip: 'Previous',
              ),
            ),

            // Tombol Play lebih besar
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                ),
                iconSize: 48,
                tooltip: 'Play',
              ),
            ),

            // Tombol Next
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
                iconSize: 28,
                tooltip: 'Next',
              ),
            ),

            // Tombol Repeat
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.repeat,
                  color: Colors.white,
                ),
                iconSize: 28,
                tooltip: 'Repeat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}