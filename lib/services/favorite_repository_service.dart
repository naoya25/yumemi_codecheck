import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/github_repo_model.dart';

class FavoriteRepositoryService {
  static const String _favoritesKey = 'favorite_repositories';

  Future<List<GithubRepoModel>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];
    
    return favoritesJson.map((json) {
      final Map<String, dynamic> map = jsonDecode(json);
      return GithubRepoModel.fromJson(map);
    }).toList();
  }

  Future<void> addFavorite(GithubRepoModel repository) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    // 既に存在する場合は追加しない
    if (favorites.any((repo) => repo.id == repository.id)) {
      return;
    }
    
    favorites.add(repository);
    await _saveFavorites(prefs, favorites);
  }

  Future<void> removeFavorite(int repositoryId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    favorites.removeWhere((repo) => repo.id == repositoryId);
    await _saveFavorites(prefs, favorites);
  }

  Future<bool> isFavorite(int repositoryId) async {
    final favorites = await getFavorites();
    return favorites.any((repo) => repo.id == repositoryId);
  }

  Future<void> _saveFavorites(SharedPreferences prefs, List<GithubRepoModel> favorites) async {
    final favoritesJson = favorites.map((repo) => jsonEncode(repo.toJson())).toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }
}