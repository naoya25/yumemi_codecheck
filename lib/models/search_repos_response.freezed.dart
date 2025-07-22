// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repos_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchReposResponse _$SearchReposResponseFromJson(Map<String, dynamic> json) {
  return _SearchReposResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchReposResponse {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete_results')
  bool get incompleteResults => throw _privateConstructorUsedError;
  List<GithubRepoModel> get items => throw _privateConstructorUsedError;

  /// Serializes this SearchReposResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchReposResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchReposResponseCopyWith<SearchReposResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchReposResponseCopyWith<$Res> {
  factory $SearchReposResponseCopyWith(
          SearchReposResponse value, $Res Function(SearchReposResponse) then) =
      _$SearchReposResponseCopyWithImpl<$Res, SearchReposResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'incomplete_results') bool incompleteResults,
      List<GithubRepoModel> items});
}

/// @nodoc
class _$SearchReposResponseCopyWithImpl<$Res, $Val extends SearchReposResponse>
    implements $SearchReposResponseCopyWith<$Res> {
  _$SearchReposResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchReposResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GithubRepoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchReposResponseImplCopyWith<$Res>
    implements $SearchReposResponseCopyWith<$Res> {
  factory _$$SearchReposResponseImplCopyWith(_$SearchReposResponseImpl value,
          $Res Function(_$SearchReposResponseImpl) then) =
      __$$SearchReposResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'incomplete_results') bool incompleteResults,
      List<GithubRepoModel> items});
}

/// @nodoc
class __$$SearchReposResponseImplCopyWithImpl<$Res>
    extends _$SearchReposResponseCopyWithImpl<$Res, _$SearchReposResponseImpl>
    implements _$$SearchReposResponseImplCopyWith<$Res> {
  __$$SearchReposResponseImplCopyWithImpl(_$SearchReposResponseImpl _value,
      $Res Function(_$SearchReposResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchReposResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_$SearchReposResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GithubRepoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchReposResponseImpl implements _SearchReposResponse {
  const _$SearchReposResponseImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'incomplete_results') required this.incompleteResults,
      required final List<GithubRepoModel> items})
      : _items = items;

  factory _$SearchReposResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchReposResponseImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  final bool incompleteResults;
  final List<GithubRepoModel> _items;
  @override
  List<GithubRepoModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SearchReposResponse(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchReposResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, incompleteResults,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of SearchReposResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchReposResponseImplCopyWith<_$SearchReposResponseImpl> get copyWith =>
      __$$SearchReposResponseImplCopyWithImpl<_$SearchReposResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchReposResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchReposResponse implements SearchReposResponse {
  const factory _SearchReposResponse(
      {@JsonKey(name: 'total_count') required final int totalCount,
      @JsonKey(name: 'incomplete_results')
      required final bool incompleteResults,
      required final List<GithubRepoModel> items}) = _$SearchReposResponseImpl;

  factory _SearchReposResponse.fromJson(Map<String, dynamic> json) =
      _$SearchReposResponseImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  bool get incompleteResults;
  @override
  List<GithubRepoModel> get items;

  /// Create a copy of SearchReposResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchReposResponseImplCopyWith<_$SearchReposResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
