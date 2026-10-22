import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealService {
  static const String baseUrl =
      'https://www.themealdb.com/api/json/v1/1';

  Future<List<Meal>> searchMeals(String query) async {
    final uri = Uri.parse(
      '$baseUrl/search.php?s=${Uri.encodeQueryComponent(query)}',
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal mengambil data. Kode: ${response.statusCode}',
      );
    }

    final Map<String, dynamic> data =
    jsonDecode(response.body) as Map<String, dynamic>;

    final List<dynamic> mealsJson =
        (data['meals'] as List<dynamic>?) ?? [];

    return mealsJson
        .map(
          (item) => Meal.fromJson(
        item as Map<String, dynamic>,
      ),
    )
        .toList();
  }

  Future<Meal> getMealDetail(String id) async {
    final uri = Uri.parse('$baseUrl/lookup.php?i=$id');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal mengambil detail resep.',
      );
    }

    final Map<String, dynamic> data =
    jsonDecode(response.body) as Map<String, dynamic>;

    final List<dynamic> mealsJson =
        (data['meals'] as List<dynamic>?) ?? [];

    if (mealsJson.isEmpty) {
      throw Exception('Detail resep tidak ditemukan.');
    }

    return Meal.fromJson(
      mealsJson.first as Map<String, dynamic>,
    );
  }
}
