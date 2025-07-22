// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchReposResponseImpl _$$SearchReposResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchReposResponseImpl(
      totalCount: (json['total_count'] as num).toInt(),
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => GithubRepoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchReposResponseImplToJson(
        _$SearchReposResponseImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
