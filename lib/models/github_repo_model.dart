import 'package:freezed_annotation/freezed_annotation.dart';
import 'owner.dart';

part 'github_repo_model.freezed.dart';
part 'github_repo_model.g.dart';

@freezed
class GithubRepoModel with _$GithubRepoModel {
  const factory GithubRepoModel({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required Owner owner,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    String? description,
    String? language,
  }) = _GithubRepoModel;

  factory GithubRepoModel.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoModelFromJson(json);
}
