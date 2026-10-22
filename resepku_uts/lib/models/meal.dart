class Meal {
  final String id;
  final String name;
  final String image;
  final String category;
  final String area;
  final String instructions;
  final List<String> ingredients;

  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.area,
    required this.instructions,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final List<String> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient =
      (json['strIngredient$i'] ?? '').toString().trim();

      final measure =
      (json['strMeasure$i'] ?? '').toString().trim();

      if (ingredient.isNotEmpty) {
        ingredients.add(
          measure.isNotEmpty
              ? '$ingredient - $measure'
              : ingredient,
        );
      }
    }

    return Meal(
      id: json['idMeal']?.toString() ?? '',
      name: json['strMeal']?.toString() ?? 'Tanpa nama',
      image: json['strMealThumb']?.toString() ?? '',
      category: json['strCategory']?.toString() ?? '-',
      area: json['strArea']?.toString() ?? '-',
      instructions:
      json['strInstructions']?.toString() ?? '',
      ingredients: ingredients,
    );
  }
}
