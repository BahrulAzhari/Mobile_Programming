import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_service.dart';

class MealDetailPage extends StatefulWidget {
  final String mealId;

  const MealDetailPage({
    super.key,
    required this.mealId,
  });

  @override
  State<MealDetailPage> createState() =>
      _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  final MealService _service = MealService();
  late Future<Meal> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = _service.getMealDetail(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Resep'),
        backgroundColor: const Color(0xFF27845C),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<Meal>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Gagal memuat detail resep:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Detail resep tidak tersedia.'),
            );
          }

          final Meal meal = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  meal.image,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 260,
                      color: Colors.black12,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.restaurant,
                        size: 60,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Chip(
                            avatar: const Icon(
                              Icons.restaurant_menu,
                              size: 18,
                            ),
                            label: Text(meal.category),
                          ),
                          Chip(
                            avatar: const Icon(
                              Icons.public,
                              size: 18,
                            ),
                            label: Text(meal.area),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Bahan-bahan',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (meal.ingredients.isEmpty)
                        const Text('Bahan tidak tersedia.')
                      else
                        ...meal.ingredients.map(
                              (ingredient) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: Color(0xFF27845C),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    ingredient,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      const Text(
                        'Cara Memasak',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        meal.instructions.trim().isEmpty
                            ? 'Instruksi memasak tidak tersedia.'
                            : meal.instructions,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
