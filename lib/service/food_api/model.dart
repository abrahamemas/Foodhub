class Recipe {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strYoutube;
  final List<String> ingredients;
  final List<String> measures;
  final String strTags;

  Recipe({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strYoutube,
    required this.ingredients,
    required this.measures,
    required this.strTags,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] as String? ?? '';
      String measure = json['strMeasure$i'] as String? ?? '';
      if (ingredient.isNotEmpty) ingredients.add(ingredient);
      if (measure.isNotEmpty) measures.add(measure);
    }

    return Recipe(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strYoutube: json['strYoutube'] as String,
      ingredients: ingredients,
      measures: measures,
      strTags: json['strTags'] as String? ?? '',
    );
  }

  static List<Recipe> recipesFromSnapshot(List<dynamic> snapshot) {
    return snapshot
        .map((data) => Recipe.fromJson(data as Map<String, dynamic>))
        .toList();
  }
}