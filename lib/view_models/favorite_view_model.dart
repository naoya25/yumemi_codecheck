import 'package:flutter/foundation.dart';

import '../models/github_repo_model.dart';
import '../services/favorite_repository_service.dart';

class FavoriteViewModel extends ChangeNotifier {
  final FavoriteRepositoryService _service = FavoriteRepositoryService();
  
  List<GithubRepoModel> _favorites = [];
  bool _isLoading = false;
  String? _error;

  List<GithubRepoModel> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasFavorites => _favorites.isNotEmpty;

  Future<void> loadFavorites() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _favorites = await _service.getFavorites();
    } catch (e) {
      _error = 'お気に入りの読み込みに失敗しました';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addFavorite(GithubRepoModel repository) async {
    try {
      await _service.addFavorite(repository);
      if (!_favorites.any((repo) => repo.id == repository.id)) {
        _favorites.add(repository);
        notifyListeners();
      }
    } catch (e) {
      _error = 'お気に入りの追加に失敗しました';
      notifyListeners();
    }
  }

  Future<void> removeFavorite(int repositoryId) async {
    try {
      await _service.removeFavorite(repositoryId);
      _favorites.removeWhere((repo) => repo.id == repositoryId);
      notifyListeners();
    } catch (e) {
      _error = 'お気に入りの削除に失敗しました';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(int repositoryId) async {
    try {
      return await _service.isFavorite(repositoryId);
    } catch (e) {
      return false;
    }
  }

  bool isFavoriteSync(int repositoryId) {
    return _favorites.any((repo) => repo.id == repositoryId);
  }
}