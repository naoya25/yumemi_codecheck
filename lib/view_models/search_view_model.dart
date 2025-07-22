import 'package:flutter/foundation.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/repositories/github_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final GithubRepository _repository = GithubRepository();

  List<GithubRepoModel> _repos = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _currentQuery = '';

  List<GithubRepoModel> get repos => _repos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasResults => _repos.isNotEmpty;
  bool get hasSearched => _currentQuery.isNotEmpty;

  Future<void> searchRepos(String query) async {
    if (query.trim().isEmpty) {
      return;
    }

    _currentQuery = query;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.searchRepos(
        query: query,
        sort: 'stars',
        order: 'desc',
      );
      _repos = response.items;
      _errorMessage = null;
    } catch (e) {
      _repos = [];
      _errorMessage = '検索中にエラーが発生しました: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    _repos = [];
    _currentQuery = '';
    _errorMessage = null;
    notifyListeners();
  }
}
