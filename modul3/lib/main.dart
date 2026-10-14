import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Malang',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

              const Text(
                '25°',
                style: TextStyle(
                  fontSize: 70,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherItem(
                    hari: 'Minggu',
                    icon: Icons.sunny,
                    suhu: '26°C',
                  ),

                  WeatherItem(
                    hari: 'Senin',
                    icon: Icons.cloudy_snowing,
                    suhu: '23°C',
                  ),

                  WeatherItem(
                    hari: 'Selasa',
                    icon: Icons.cloud,
                    suhu: '22°C',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  final String hari;
  final IconData icon;
  final String suhu;

  const WeatherItem({
    super.key,
    required this.hari,
    required this.icon,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hari,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 10),

        Icon(
          icon,
          size: 30,
        ),

        const SizedBox(height: 10),

        Text(
          suhu,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}