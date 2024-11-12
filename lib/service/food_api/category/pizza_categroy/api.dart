import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/service/food_api/model.dart';

final searchPizzaProvider =
    Provider<SearchPizzaService>((ref) => SearchPizzaService());
final searchPizzaDataProvider =
    FutureProvider.family<List<Recipe>, String>((ref, query) async {
  final apiService = ref.read(searchPizzaProvider);
  return apiService.fetchRecipes(query);
});

class SearchPizzaService {
  final String apiUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Recipe>> fetchRecipes(String query) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl$query'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['meals'];
        if (data != null) {
          return data.map((meal) => Recipe.fromJson(meal)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Failed to load recipes: $e');
    }
  }
}
