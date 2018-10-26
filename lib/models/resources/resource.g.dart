// GENERATED CODE - DO NOT MODIFY BY HAND

part of resource;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<ResourceData> _$resourceDataSerializer =
    new _$ResourceDataSerializer();
Serializer<Resource> _$resourceSerializer = new _$ResourceSerializer();

class _$ResourceDataSerializer implements StructuredSerializer<ResourceData> {
  @override
  final Iterable<Type> types = const [ResourceData, _$ResourceData];
  @override
  final String wireName = 'ResourceData';

  @override
  Iterable serialize(Serializers serializers, ResourceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'articles',
      serializers.serialize(object.articles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Resource)])),
    ];

    return result;
  }

  @override
  ResourceData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResourceDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Resource)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ResourceSerializer implements StructuredSerializer<Resource> {
  @override
  final Iterable<Type> types = const [Resource, _$Resource];
  @override
  final String wireName = 'Resource';

  @override
  Iterable serialize(Serializers serializers, Resource object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'thumb',
      serializers.serialize(object.thumb,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Resource deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResourceData extends ResourceData {
  @override
  final BuiltList<Resource> articles;

  factory _$ResourceData([void updates(ResourceDataBuilder b)]) =>
      (new ResourceDataBuilder()..update(updates)).build();

  _$ResourceData._({this.articles}) : super._() {
    if (articles == null) {
      throw new BuiltValueNullFieldError('ResourceData', 'articles');
    }
  }

  @override
  ResourceData rebuild(void updates(ResourceDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceDataBuilder toBuilder() => new ResourceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourceData && articles == other.articles;
  }

  @override
  int get hashCode {
    return $jf($jc(0, articles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResourceData')
          ..add('articles', articles))
        .toString();
  }
}

class ResourceDataBuilder
    implements Builder<ResourceData, ResourceDataBuilder> {
  _$ResourceData _$v;

  ListBuilder<Resource> _articles;
  ListBuilder<Resource> get articles =>
      _$this._articles ??= new ListBuilder<Resource>();
  set articles(ListBuilder<Resource> articles) => _$this._articles = articles;

  ResourceDataBuilder();

  ResourceDataBuilder get _$this {
    if (_$v != null) {
      _articles = _$v.articles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourceData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResourceData;
  }

  @override
  void update(void updates(ResourceDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ResourceData build() {
    _$ResourceData _$result;
    try {
      _$result = _$v ?? new _$ResourceData._(articles: articles.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'articles';
        articles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ResourceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Resource extends Resource {
  @override
  final String title;
  @override
  final String url;
  @override
  final String thumb;

  factory _$Resource([void updates(ResourceBuilder b)]) =>
      (new ResourceBuilder()..update(updates)).build();

  _$Resource._({this.title, this.url, this.thumb}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Resource', 'title');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Resource', 'url');
    }
    if (thumb == null) {
      throw new BuiltValueNullFieldError('Resource', 'thumb');
    }
  }

  @override
  Resource rebuild(void updates(ResourceBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourceBuilder toBuilder() => new ResourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Resource &&
        title == other.title &&
        url == other.url &&
        thumb == other.thumb;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), url.hashCode), thumb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Resource')
          ..add('title', title)
          ..add('url', url)
          ..add('thumb', thumb))
        .toString();
  }
}

class ResourceBuilder implements Builder<Resource, ResourceBuilder> {
  _$Resource _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _thumb;
  String get thumb => _$this._thumb;
  set thumb(String thumb) => _$this._thumb = thumb;

  ResourceBuilder();

  ResourceBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _url = _$v.url;
      _thumb = _$v.thumb;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Resource other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Resource;
  }

  @override
  void update(void updates(ResourceBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Resource build() {
    final _$result =
        _$v ?? new _$Resource._(title: title, url: url, thumb: thumb);
    replace(_$result);
    return _$result;
  }
}
