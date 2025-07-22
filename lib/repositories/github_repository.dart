import 'package:yumemi_codecheck/models/github_repo_model.dart';
import 'package:yumemi_codecheck/models/search_repos_response.dart';
import 'package:yumemi_codecheck/repositories/api.dart';

class GithubRepository {
  Future<SearchReposResponse> searchRepos({
    required String query,
    int page = 1,
    int perPage = 30,
    String? sort,
    String? order,
  }) async {
    try {
      final response = await getApi<Map<String, dynamic>>(
        '/search/repositories',
        queryParameters: {
          'q': query,
          'page': page,
          'per_page': perPage,
          if (sort != null) 'sort': sort,
          if (order != null) 'order': order,
        },
      );

      if (response.data == null) {
        throw Exception('No data received from API');
      }

      return SearchReposResponse.fromJson(response.data!);
    } catch (e) {
      throw Exception('Failed to search repositories: $e');
    }
  }

  Future<GithubRepoModel> getRepo({
    required String owner,
    required String repo,
  }) async {
    try {
      final response = await getApi<Map<String, dynamic>>(
        '/repos/$owner/$repo',
      );

      if (response.data == null) {
        throw Exception('No data received from API');
      }

      return GithubRepoModel.fromJson(response.data!);
    } catch (e) {
      throw Exception('Failed to get repository: $e');
    }
  }
}
