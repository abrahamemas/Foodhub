import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model.dart';

class ApiService {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/random.php';

  Future<List<Recipe>> fetchRecipes(int count) async {
    List<Recipe> recipes = [];
    Set<String> fetchedIds = {};

    try {
      int fetchedCount = 0;
      while (fetchedCount < count) {
        final batchResponse = await http.get(Uri.parse(apiUrl));

        if (batchResponse.statusCode == 200) {
          final batchData = jsonDecode(batchResponse.body)['meals'];
          for (var meal in batchData) {
            Recipe recipe = Recipe.fromJson(meal);
            if (!fetchedIds.contains(recipe.idMeal)) {
              recipes.add(recipe);
              fetchedIds.add(recipe.idMeal);
              fetchedCount++;
              if (fetchedCount >= count) break;
            }
          }
        } else {
          throw Exception('Failed to load recipes');
        }
      }
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }

    return recipes;
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final recipesProvider =
    FutureProvider.family<List<Recipe>, int>((ref, count) async {
  final apiService = ref.read(apiServiceProvider);
  return await apiService.fetchRecipes(count);
});

class SelectedRecipeNotifier extends StateNotifier<Recipe?> {
  SelectedRecipeNotifier() : super(null);

  void setSelectedRecipe(Recipe selectedRecipe) {
    state = selectedRecipe;
  }
}

final selectedRecipeProvider =
    StateNotifierProvider<SelectedRecipeNotifier, Recipe?>((ref) {
  return SelectedRecipeNotifier();
});
