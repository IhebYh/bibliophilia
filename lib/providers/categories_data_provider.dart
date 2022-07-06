/// CategoriesData provider Class
import 'dart:convert';
import 'package:bibliophilia/models/category.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoriesData with ChangeNotifier {
  bool _loaded = false;
  List<Categ> _categories = [];
  String _selectedCategory = '';

  bool get isLoaded {
    return _loaded;
  }

  List<Categ> get getAllCategories {
    return [..._categories];
  }

  void setLoading(bool loadingState) {
    _loaded = loadingState;
    notifyListeners();
  }

  String get getSelectedCategory {
    return _selectedCategory;
  }

  Future<void> getCategoryList() async {
    var apiKey = 'AIzaSyAWUDA3M7es_gJ2Bqzp4ItU07LpO_RbMHw';
    final url =
        'https://www.googleapis.com/svc/books/v3/lists/names.json?api-key=$apiKey';
    try {
      http.Response response = await http.get(Uri.parse(url));
      var jsonResponse = await jsonDecode(response.body);
      List categoriesJsonList = jsonResponse['results'];

      List<Categ> categories = [];
      for (var category in categoriesJsonList) {
        categories.add(Categ(
          categoryLink: category['list_name_encoded'],
          categoryTitle: category['display_name'],
          oldDate: category['oldest_published_date'],
          newDate: category['newest_published_date'],
          updated: category['updated'],
          iconLink: '',
        ));
      }
      _categories = categories;

      await null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
