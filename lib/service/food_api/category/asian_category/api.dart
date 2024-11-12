import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/service/food_api/model.dart';

final searchAsianProvider =
    Provider<SearchAsianService>((ref) => SearchAsianService());
final searchAsianDataProvider = FutureProvider<List<Recipe>>((ref) async {
  final apiService = ref.read(searchAsianProvider);
  return apiService.fetchAllAsianRecipes();
});

class SearchAsianService {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  final List<String> asianFoods = [
    "Laksa",
    "Biryani",
    "Sushi",
  ];

  Future<List<Recipe>> fetchAllAsianRecipes() async {
    List<Recipe> allRecipes = [];

    try {
      for (String food in asianFoods) {
        final response = await http.get(Uri.parse('$apiUrl$food'));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['meals'];
          if (data != null) {
            allRecipes
                .addAll(data.map((meal) => Recipe.fromJson(meal)).toList());
          }
        } else {
          throw Exception('Failed to load recipes for $food');
        }
      }
      return allRecipes;
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
}
