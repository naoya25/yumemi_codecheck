import 'package:freezed_annotation/freezed_annotation.dart';
import 'github_repo_model.dart';

part 'search_repos_response.freezed.dart';
part 'search_repos_response.g.dart';

@freezed
class SearchReposResponse with _$SearchReposResponse {
  const factory SearchReposResponse({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<GithubRepoModel> items,
  }) = _SearchReposResponse;

  factory SearchReposResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchReposResponseFromJson(json);
}
