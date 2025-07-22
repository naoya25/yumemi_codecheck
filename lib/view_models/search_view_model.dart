import 'package:flutter/foundation.dart';
import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/repositories/github_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final GithubRepository _repository = GithubRepository();

  List<GithubRepoModel> _repos = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  String _currentQuery = '';
  int _currentPage = 1;
  int _totalCount = 0;
  bool _hasMore = true;

  List<GithubRepoModel> get repos => _repos;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get errorMessage => _errorMessage;
  bool get hasResults => _repos.isNotEmpty;
  bool get hasSearched => _currentQuery.isNotEmpty;
  bool get hasMore => _hasMore && _repos.length < _totalCount;
  String get currentQuery => _currentQuery;

  Future<void> searchRepos(String query) async {
    if (query.trim().isEmpty) {
      return;
    }

    _currentQuery = query;
    _currentPage = 1;
    _hasMore = true;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.searchRepos(
        query: query,
        page: _currentPage,
        sort: 'stars',
        order: 'desc',
      );
      _repos = response.items;
      _totalCount = response.totalCount;
      _hasMore = _repos.length < _totalCount;
      _errorMessage = null;
    } catch (e) {
      _repos = [];
      _errorMessage = '検索中にエラーが発生しました: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !hasMore || _currentQuery.isEmpty) {
      return;
    }

    _isLoadingMore = true;
    notifyListeners();

    try {
      final response = await _repository.searchRepos(
        query: _currentQuery,
        page: _currentPage + 1,
        sort: 'stars',
        order: 'desc',
      );

      _currentPage++;
      _repos.addAll(response.items);
      _hasMore = _repos.length < _totalCount;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = '追加読み込み中にエラーが発生しました: ${e.toString()}';
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    _repos = [];
    _currentQuery = '';
    _errorMessage = null;
    _currentPage = 1;
    _totalCount = 0;
    _hasMore = true;
    notifyListeners();
  }
}
